# ####################################################################
# Custom extensions example
#
# The purpose of custom extensions is to allow functionality to be implemented 
# without modifying the base deployment code.  Additionally control over these
# extensions can be exposed via the extensions__fieldX fields to allow functionality
# to be added WITHOUT changes to the presentation layer. By exposing the extension 
# fields as tenant editable we can add code to this portion of the iApp to handle 
# new functionality without changing the northbound data model
#
# The following procs are called at various points during the implementation:
#   custom_extensions_start: Called at the start of the deployment after mode is determined
#   custom_extensions_before_pool:  Called before processing to create the pool starts
#   custom_extensions_after_pool: Called immediately after the pool is created 
#   custom_extensions_before_vs:  Called before processing to create the virtual server starts
#   custom_extensions_after_vs: Called immediately after the virtual server is created 
#   custom_extentions_end: Called at the end of the deployment
#
# Guidelines: 
#  - Avoid name collisions please prefix variables with 'custom_' unless used by the base deployment code
#  - Restrict modifications to global presentation layer variables unless absolutely required
#  - Try to modify the config once created by the base deployment code to maintain compatibility
#
# Two examples are implemented here:
#  - custom_example_1: Called from all hooks to dump some info to the debug log
#  - custom_example_2: (Disabled by default) Called at the end of the deployment to execute 
#                      a tmsh::create command

proc custom_extensions_start {} {
  debug "\[[lindex [info level 0] 0]\] entering proc"

  # Example 1: Parse a string of the format "key1=val1;key2=val2;key3=val3" and populate an array.
  # The we call the custom_example proc to dump some info to the /var/tmp/scriptd.out log

  # Make the global variable accessable locally.  Additionally create a global array to store KVP pairs
  upvar extensions__Field1 field1
  upvar custom_field1_kvp kvp_array

  # Check to see we got some data in extensions__Field1
  if { [string length $field1] > 0 } {
    # Use the process_kvp_string proc to populate an array
    array set kvp_array [process_kvp_string $field1]

    debug "\[[lindex [info level 0] 0]\] kvp_array=[array get kvp_array]"
    # Call our custom_example_1 proc to dump some info to the debug log.
    custom_example_1 [array get kvp_array]
  }
}

proc custom_extensions_before_pool {} {
  debug "\[[lindex [info level 0] 0]\] entering proc"

  # Call our custom_example_1 proc to dump some info to the debug log.
  upvar custom_field1_kvp kvp_array
  custom_example_1 [array get kvp_array]
}

proc custom_extensions_after_pool {} {
  debug "\[[lindex [info level 0] 0]\] entering proc"

  # Call our custom_example_1 proc to dump some info to the debug log.
  upvar custom_field1_kvp kvp_array
  custom_example_1 [array get kvp_array]
}

proc custom_extensions_before_vs {} {
  debug "\[[lindex [info level 0] 0]\] entering proc"

  # Call our custom_example_1 proc to dump some info to the debug log.
  upvar custom_field1_kvp kvp_array
  custom_example_1 [array get kvp_array]
}

proc custom_extensions_after_vs {} {
  debug "\[[lindex [info level 0] 0]\] entering proc"

  # Call our custom_example_1 proc to dump some info to the debug log.
  upvar custom_field1_kvp kvp_array
  custom_example_1 [array get kvp_array]
}

proc custom_extensions_end {} {
  debug "\[[lindex [info level 0] 0]\] entering proc"

  # Call our custom_example_1 proc to dump some info to the debug log.
  upvar custom_field1_kvp kvp_array
  custom_example_1 [array get kvp_array]

  # Call our custom_example_2 proc to run a user provided tmsh create command
  # 
  # Populate extensions__Field2 with a valid command like:
  #  ltm data-group internal customDG type string records replace-all-with { record1 { data data1 } record2 { data data2 } }
  #
  # Once the template executes you can see the creation of the datagroup under the application template container

  # ** To enable example 2 uncomment the following two lines **
  # upvar extensions__Field2 field2
  # custom_example_2 $field2
}

# Example 1: Simply dump a log line to /var/tmp/scriptd.out
proc custom_example_1 { kvp_array_in } {
  set calling_proc [lindex [info level -1] 0]
  set current_proc [lindex [info level 0] 0]
  array set kvp_array $kvp_array_in

  debug "\[$current_proc\] entering proc kvp_array_in=$kvp_array_in"
  
  if { [info exists kvp_array(custom_example)] && $kvp_array(custom_example) == 1} {
   debug "\[$current_proc\] This is an example of a custom extension called from $calling_proc"
  }
}

# Example 2: Run the text in extensions__Field2 as a tmsh create command
proc custom_example_2 { cmd } {
  set calling_proc [lindex [info level -1] 0]
  set current_proc [lindex [info level 0] 0]

  debug "\[$current_proc\] entering proc cmd=$cmd"
  
  if { [string length $cmd] > 0 } {
    debug "\[$current_proc\] Called from $calling_proc - About the execute tmsh::create $cmd"
    tmsh::create $cmd
  }
}