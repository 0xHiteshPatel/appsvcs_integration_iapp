.. |labmodule| replace:: 2
.. |labnum| replace:: 9
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

.. _provisioned: http://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-system-essentials-11-6-0/7.html

L4-7 Helpers
------------

This lab will review some of the basic L4-7 functionality included with the 
|appsvcs| template.  The goal is to add options that not only provide 
convenience to users if the system is already licensed for them.  Where possible
you will see that the L4-7 feature has an ‘auto’ setting.  The auto setting
tries to programmatically determine whether the feature should be enabled or 
disabled.  

.. NOTE::
    All L4-7 Helpers will check to determine if the required BIG-IP module is 
    provisioned_ (enabled) on the system.  If a module is not enabled the 
    specific helper will be ignored.
      
For example the :ref:`'HTTP: Security: Create HTTP(80)->HTTPS(443) Redirect' <preso-feature-redirectToHTTPS>` 
helper will automatically create the redirect virtual server if a Client-SSL 
profile was created or configured.  It will also modify it’s behavior to be 
compatible with features such as the 
:ref:`'HTTP: Security: Enable HTTP Strict Transport Security' <preso-feature-securityEnableHSTS>` 
option.  The HSTS specification requires that redirects are a ‘301’ redirect 
rather than the ‘302’ that is used as the system default.  The redirect feature
will automatically take this into account and configure properly in either case.


Statistics Helpers
^^^^^^^^^^^^^^^^^^

To start we will review the statistics features that were deployed in Labs 
|labmodule|\ .1, |labmodule|\ .2 & |labmodule|\ .3.  Please repeat the
following steps for each of the lab.

#. Navigate to the iApp properties page by clicking iApps -> Application
   Services -> Lab\ |labmodule|\ .<X> -> Properties
#. Review the ‘User-defined Application Service Statistics’ section to see
   which stats were enabled during deployment
#. Review the deployed iCall handler and script to see the mechanism used to
   collect the stats:

    - Open an SSH session to your BIG-IP
    - Execute the following tmsh command to view the iCall handler:

       - .. parsed-literal:: tmsh list sys icall handler periodic |labmodule|\ .<X>.app/publish_stats

    - Execute the following tmsh command to view the iCall stats collector
      script:

       - .. parsed-literal:: tmsh list sys icall script |labmodule|\ .<X>.app/publish_stats

    - Look for the ‘set http_enabled’ and ‘set ssl_enabled’ TCL code near the
      top of the script.  Notice how they change depending on the type of
      virtual server deployed in the lab?

Base statistics are deployed for all virtual servers and controlled by the
:ref:`iApp: Statistics Handler Creation <preso-iapp-appStats>` option in the
template.  The protocol specific statistics are controlled by the protocol
relevant options in the L4-7 Application Functionality section of the template.
The ‘auto’ setting in the L4-7 section will automatically expose the statistics
in configured protocol profiles (HTTP, SSL) via iStats to Northbound systems 
(iWorkflow, APIC, etc.)

HTTP/HTTPS Helpers
^^^^^^^^^^^^^^^^^^

For this section we will review HTTP/HTTPS specific L4-7 features.  The specific
features and their ‘auto’ behavior are detailed below.  Please review the table
and then review the configuration deployed for Lab |labmodule|\ .1 and 
|labmodule|\ .2 to see how the configuration was deployed.

   .. list-table::
        :header-rows: 1
        :stub-columns: 1

        * - L4-7 Functionality Name
          - Description
          - ‘auto’ behavior
        * - :ref:`HTTP: Insert X-Forwarded-For Header <preso-feature-insertXForwardedFor>`
          - Sets the insert-xforwarded-for option in the HTTP profile to enabled
          - Enabled when SNAT is configured and a HTTP profile is present
        * - :ref:`HTTP: Security: Create HTTP(80)->HTTPS(443) Redirect <preso-feature-redirectToHTTPS>`
          - Creates a port 80->443 redirect virtual server on the specified
            Listener IPs.  Default is to create a 302 redirect.  Modified by 
            HSTS feature to a 301 if HSTS is enabled.
          - Enabled when a Client-SSL profile is configured and 
            :ref:`Virtual Server: Port <preso-pool-port>` is 443
        * - :ref:`TLS/SSL: Easy Cipher String <preso-feature-sslEasyCipher>`
          - Allows user to select from a predefined set of TLS/SSL cipher 
            strings and set those in the Client-SSLprofile
          - No auto option
        * - :ref:`HTTP: Security: Enable HTTP Strict Transport Security <preso-feature-securityEnableHSTS>`
          - Configures insertion of the ‘Strict-Transport-Security’ HTTP header.
            Options include the ability to specify any combination of the 
            preload and includeSubDomains options.
          - No auto option

L4 Firewall & IP Blacklist Helpers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. NOTE::
    L4 Firewall functionality is provided by the |afm| (AFM) BIG-IP module.

.. NOTE:: 
    IP Blacklist functionality is provided by an |ipi| (IPI) subscription

If licensed the |appsvcs| template can automatically enable L4 Firewall and IP 
Blacklist functionality.  The specific features and their ‘auto’ behavior are 
detailed below.  Please review the table and then review the configuration 
deployed for Lab |labmodule|\ .1 and |labmodule|\ .2 to see how the 
configuration was deployed.  You can also modify your existing deployments
for Lab |labmodule|\ .1 and |labmodule|\ .2 using the ‘Reconfigure’ option to 
experiment with this feature.

   .. list-table::
        :header-rows: 1
        :stub-columns: 1

        * - L4-7 Functionality Name
          - Description
          - ‘auto’ behavior
        * - :ref:`Security: Firewall: Configure L4 Firewall Policy <preso-feature-easyL4Firewall>`
          - Configures an AFM policy in the Virtual Server context.  Refer to 
            the :ref:`field reference <preso-feature-easyL4Firewall>` for details.

            When IPI is enabled with this option the 
            :ref:`Virtual Server: IP Blacklist Profile <preso-vs-ProfileSecurityIPBlacklist>`
            option is modified to achieve the intended config.  IPI can also be
            configured independently using the option in the Virtual Server 
            section

          - If AFM is provisioned the auto option will use the 
            ‘base+ip_blacklist_block’ option
        * - :ref:`Security: Firewall: Static Blacklisted Addresses <preso-feature-easyL4FirewallBlacklist>`
          - A table of Source IP CIDR blocks that will be blocked via an address
            list at the beginning of the base AFM policy
          - N/A
        * - :ref:`Security: Firewall: Static Allowed Source Addresses <preso-feature-easyL4FirewallSourceList>`
          - A table of CIDR blocks that will be added as allowed source 
            addresses in the base AFM policy.  Note the default is to allow all 
            addresses (0.0.0.0/0)
          - N/A



