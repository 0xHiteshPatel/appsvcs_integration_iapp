proc custom_extensions {} {
  # ####################################################################
  # Custom config example
  # The purpose of the extensions__fieldX fields are to allow for changes WITHOUT updates
  # to the presentation layer.  By exposing these fields as tenant editable we can add code to this
  # portion of the iApp to handle new functionality.  

  # Example 1 parses a string of the format "key1=val1;key2=val2;key3=val3" and populates variables
  # that can be acted on.
  #
  # Another use case is to use the field to pass raw commands to the tmsh::create command as in Example 2 below
  #
  
  # Example 1
  set pairs [split $::extensions__Field1 \;]
  debug "\[custom_extentions\] Custom1: pairs=$pairs"
  array set custom_kvp {}
  foreach pair $pairs {
    set key [lindex [split $pair =] 0]
    set val [lindex [split $pair =] 1]
    set custom_kvp($key) $val
    debug "\[custom_extentions\] Custom1: pair=$pair key=$key val=$val custom_kvp($key)=$custom_kvp($key)"
  }
  
  # Example of a custom extension.  Setting client_nagle=0 disables nagle on the clientside TCP profile
  if { [info exists custom_kvp(client_nagle)] && $custom_kvp(client_nagle) == 0 } {
    debug "\[custom_extentions\] found client_nagle=0 KVP, calling custom_disable_client_nagle proc"
    # Call the proc below to do the work
    custom_disable_client_nagle
  }
  
  if { [info exists custom_kvp(logit)] && $custom_kvp(logit) == 1} {
   debug "\[custom_extentions\] This is an example of the custom KVP logit=1 in Custom String 1"
  }
  
  # Example 2 
  # Populate String 2 with a valid command like:
  #  ltm data-group internal customDG type string records replace-all-with { record1 { data data1 } record2 { data data2 } }
  #
  # Once the template executes you can see the creation of the datagroup under the application template container
  # tmsh::create $::extensions__Field2
  #
  # End custom config example
  # ####################################################################
}

proc custom_disable_client_nagle {} {
  debug "\[custom_extentions\]\[custom_disable_client_nagle\] found client_nagle=0 KVP, creating new clientside TCP profile"

  # Setup the name of the new profile.  We can reference global vars to grab data ($::app_path)
  set nagle_tcp_name [format "%s/clientside_tcp_nonagle" $::app_path]

  # Create a new tcp profile that references the profile that was provided in the template as a default with nagle disabled
  tmsh::create ltm profile tcp $nagle_tcp_name defaults-from $::vs__ProfileClientProtocol nagle disabled

  # Get the current profiles tied to the VS as a tmsh object
  set profileobj [tmsh::get_config ltm virtual $::app_path/$::vs__Name profiles]
  debug "\[custom_extentions\]\[custom_disable_client_nagle\] profileobj=$profileobj"

  # Use the replace_profile proc from util.tcl to safely replace old profile with the new
  set replacestr [replace_profile $profileobj $::vs__ProfileClientProtocol $nagle_tcp_name]
  debug "\[custom_extentions\]\[custom_disable_client_nagle\] replacestr=$replacestr"

  # Modify the existing config to reference the new profile
  tmsh::modify ltm virtual $::app_path/$::vs__Name profiles replace-all-with $replacestr
}
