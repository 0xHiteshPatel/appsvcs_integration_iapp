proc custom_extensions {} {
  # ####################################################################
  # Custom config example
  # The purpose of the extensions__fieldX fields are to allow for changes WITHOUT updates
  # to the APIC device package.  By exposing these fields now we can add code to the implementation
  # portion of the iApp to handle new functionality.  Example 1 parses a string of the
  # format "key1=val1;key2=val2;key3=val3" and populates variables that can be acted on.
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
  
  if { [info exists custom_kvp(nagle)] && $custom_kvp(nagle) == 0 } {
    debug "\[custom_extentions\] This is an example of the custom KVP nagle=0 in Custom String 1"
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