# Process the feature__easyASMPolicy option
if { [string length $feature__easyASMPolicy] > 0 && $feature__easyASMPolicy ne "disabled" } { 
  if { ![is_provisioned asm]} {
    error "The ASM module is not provisioned on this device"
  }
  if { [string length $vs__ProfileHTTP] == 0 } {
    error "A HTTP Profile is required to use ASM functionality"
  }
  set asm_policyname $feature__easyASMPolicy
  set asm_policy_varname [format "asm_policy_%s_data" $asm_policyname]
  debug "\[create_asm\] deploying ASM policy $asm_policyname"

%insertfile:tmp/asm.build%

  set outfile [open [format "/var/tmp/appsvcs_asm_%s.xml" $::app] w]
  puts $outfile [set [subst $asm_policy_varname]]
  close $outfile

  set asm_icall_script_tmpl {
%insertfile:include/postdeploy_asm.icall%    
  };
  set asm_script_map [list %APP_NAME%      $::app \
                       %APP_PATH%      $::app_path \
                       %VS_NAME%       $::vs__Name \
                       %PARTITION%     $::partition ]

  set asm_icall_script_src [string map $asm_script_map $asm_icall_script_tmpl]  
  debug "\[create_asm\] asm_icall_script_src=$asm_icall_script_src"

  debug "\[create_asm\] TMSH CREATE asm deploy script"
  tmsh::create sys icall script postdeploy_asm definition \{ $asm_icall_script_src \}
  debug "\[create_asm\] TMSH CREATE iCall handler"
  tmsh::create sys icall handler periodic postdeploy_load_asm first-occurrence now+1m interval 300 last-occurrence now+3m script postdeploy_asm status active
  debug "\[create_asm\] ASM policy deployment will complete in 1 minute..."
}