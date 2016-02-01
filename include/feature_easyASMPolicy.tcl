# Process the feature__easyASMPolicy option
if { [string length $feature__easyASMPolicy] > 0 && $feature__easyASMPolicy ne "disabled" } { 
  if { ![is_provisioned asm]} {
    error "The ASM module is not provisioned on this device"
  }

  if { [string length $vs__ProfileHTTP] == 0 } {
    error "A HTTP Profile is required to use ASM functionality"
  }

  set asm_filename [format "/var/tmp/appsvcs_asm_%s.xml" $::app]

  if { $newdeploy || [expr { $redeploy && [string match redeploy* $iapp__asmDeployMode]}] } {
    set asm_policyname $feature__easyASMPolicy
    set asm_policy_varname [format "asm_policy_%s_data" $asm_policyname]
    debug [list asm deploy] $asm_policyname 0

%insertfile:tmp/asm.build%

    if {! [info exists [subst $asm_policy_varname]]} {
      error "A bundled ASM policy named '$asm_policyname' was not found in the template"
    }

    set outfile [open $asm_filename w]
    puts $outfile [set [subst $asm_policy_varname]]
    close $outfile
  } else {
    set savecmd [format "asm policy %s/%s_asm_policy min-xml-file %s" $app_path $app $asm_filename]
    debug [list asm preserve] [format "preserving existing policy... save to %s" $asm_filename] 0
    debug [list asm preserve tmsh_save] $savecmd 0
    tmsh::save $savecmd
  }

  set asm_enablevs 0
  if { [string match *\-block $iapp__asmDeployMode] } {
    set asm_cmd [format "ltm virtual %s/%s disabled" $app_path $vs__Name]
    debug [list asm check_deploy_mode] "iapp__asmDeployMode specified block mode, disabling virtual server" 0
    debug [list asm check_deploy_mode tmsh_modify] $asm_cmd 0
    tmsh::modify $asm_cmd
    set asm_enablevs 1
  }

  set asm_icall_script_tmpl {
%insertfile:include/postdeploy_asm.icall%    
  };
  set asm_script_map [list %APP_NAME%      $::app \
                       %APP_PATH%      $::app_path \
                       %VS_NAME%       $::vs__Name \
                       %PARTITION%     $::partition \
                       %ENABLEVS%      $asm_enablevs ]

  set asm_icall_script_src [string map $asm_script_map $asm_icall_script_tmpl]  
  #debug "\[create_asm\] asm_icall_script_src=$asm_icall_script_src"

  debug [list asm icall_script] "creating asm deploy script" 0
  tmsh::create sys icall script postdeploy_asm definition \{ $asm_icall_script_src \}
  set asm_icall_time [clock format [expr {[clock seconds] + $::POSTDEPLOY_DELAY}] -format {%Y-%m-%d:%H:%M:%S}]
  debug [list asm icall_handler] [format "creating iCall handler; executing postdeploy script at: %s" $asm_icall_time] 0
  tmsh::create sys icall handler periodic postdeploy_load_asm first-occurrence $asm_icall_time interval 3000 last-occurrence now+10m script postdeploy_asm status active
  debug [list asm] "ASM policy deployment will complete momentarily..." 0
}