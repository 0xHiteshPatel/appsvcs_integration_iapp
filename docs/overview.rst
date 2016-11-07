.. _APIC: http://www.cisco.com/c/en/us/products/cloud-systems-management/application-policy-infrastructure-controller-apic/index.html
.. _NSX: http://www.vmware.com/products/nsx

Overview
========

Modes
-----

The iApp supports multiple modes of operation:

.. csv-table::
  :header: "Mode","Description"
  :widths: 20 80
  :stub-columns: 1

  "Standalone","Deployment driven by BIG-IP via GUI or API (SOAP/REST)"
  "F5 iWorkflow","Deployment driven by the F5's iWorkflow product 
  (Service Catalog/REST Proxy)"
  "Cisco APIC","Deployment driven by L4-7 Service Graphs via the iWorkflow 
  Dynamic Device Package and Cisco Systems APIC_ Controller"
  "VMware NSX","Deployment driven by L4-7 Service Insertion via iWorkflow 
  from VMware NSX_"

Features
--------

Deployment Control
^^^^^^^^^^^^^^^^^^

- Strict Updates setting Control
- Automated Statistics Handler Creation
- Deployment mode override
- Route Domain support
- ASM/APM Policy Redeployment Control

  - Preserve on-box policy (allow out-of-band policy updates)
  - Enforce template policy (overwrite local changes)

- Deployment Log Level Control

L4-7 Helpers
^^^^^^^^^^^^

- Statistics:

  - TLS/SSL
  - HTTP
  - Virtual Server/Pool

- HTTP/HTTPS ADC:

  - Full HTTP/L7 Policy Creation (e.g. URI/Header/etc based routing, HTTP Request Manipulation)
  - X-Forwarded-For Header Insertion
  - HTTP->HTTPS Redirect creation
  - TLS/SSL Easy Cipher String

- L4 Security:

  - L4 Firewall Policy Support
  - Dynamic IP Blacklisting/IP Intelligence (BIG-IP subscription required)
  - Static Blacklist Source Address List
  - Static Allowed Source Address List

- HTTP/HTTPS L7 Security:

  - HTTP Strict Transport Security Header Insertion
  - Web Application Firewall (ASM) policy bundling and deployment from URL
  - Identity and Access Management (APM) policy bundling deployment from URL

Custom Extensions
^^^^^^^^^^^^^^^^^

- Extensibility through custom TCL scripting

  - See :doc:`/userguide/module4/lab4` for more info

Virtual Address Options
^^^^^^^^^^^^^^^^^^^^^^^

- Route Advertisement Control
- Advanced Option Support

  - Access to any TMSH configurable attribute

Virtual Server Options
^^^^^^^^^^^^^^^^^^^^^^

- Multiple listeners:
  
  - IPv4 & IPv6 Address and L4 Port
    
    - Remove SSL/TLS profile(s) (Client, Server, Both)
    - Destinations:
      
      - Pools (template created and existing pools on system)
      - Create additional HTTP->HTTPS Redirect

- Administrative Attributes:

  - Name
  - Description

- L3/4 Functionality:
  
  - IPv4 & IPv6
  - Types:

    - Standard
    - Performance/FastL4
    - Forwarding (L2/IP)
    - Internal 
    - IP

  - Network Mask
  - Port
  - Protocol (tcp/udp)
  - L4 Protocol Profiles (Server/Client-side)

    - Access to any TMSH configurable attribute via ‘create’ syntax

  - SNAT 

    - Automap
    - Pre-existing SNAT Pool
    - Dynamic SNAT Pool creation
    - Dynamic SNAT Pool referencing (Cisco APIC specific)

  - Connection Limits
  - Dynamic IP Blacklist/IP Intelligence Profiles
  - Source Port Behavior
  - Connection Mirroring
  - Advanced Option Support

    - Access to any TMSH configurable attribute

- L4-7 Functionality:

  - iRules:

    - Reference pre-existing iRules (ordering preserved)
    - Bundled iRule support
    - Dynamically load from URL

        - Required URLs
        - Optional URLs - allow deployment to succeed if iRule does not exist on remote server

    - Advanced Profile Support

      - Reference any pre-existing policy on the device

  - SSL/TLS:

    - Dynamically created Client-SSL profiles

        - Reference pre-existing static Cert/Key
        - ‘auto’ mode to dynamically link pre-existing Cert/Key pair
        - Load cert/key from URL

    - Certificate Chain/Bundle
    - Cipher String
    - Advanced Option Support 

      - Access to any TMSH configurable Client-SSL profile attribute     

  - Profiles with create syntax support:

    - L4 Protocol (tcp/udp/fastL4)
    - HTTP
    - OneConnect
    - Compression
    - Request Logging
    - Server-SSL
    - Client-SSL
    - Default/Fallback Persistence

  - Profiles without create syntax support:

    - Pre-existing Client-SSL
    - Analytics
    - Security Logging
    - DoS Protection
    - Access Specific (APM):

      - Access Profile
      - Connectivity Profile
      - Per-Request Profile
       
Pool Options
^^^^^^^^^^^^

- Create multiple pools
- Advanced Option Support

  - Access to any TMSH configurable attribute

- Administrative Attributes:

  - Name
  - Description

- Health Monitor(s) w/ Minimum # monitors
- Load Balancing Method
- Dynamic Member Update Defaults (Port)
- Members

  - Addressing

    - IPv4 & IPv6
    - Existing Node
    - Node Creation with Custom Name
    - FQDN Lookup

  - Port
  - Connection Limit
  - Ratio
  - Priority Groups
  - Administrative State
  - Advanced Option Support

    - Access to any TMSH configurable attribute

Health Monitors
^^^^^^^^^^^^^^^

- Multiple monitor support
- Create custom health monitors

  - Advanced Option Support

    - Access to any TMSH configurable attribute

- Reference existing health monitors

Helper Scripts
^^^^^^^^^^^^^^^

- import_template_bigip.py: Create/update iApp template
- import_cery_key.py: Create/update SSL/TLS Cert/Key on BIG-IP
- deploy_iapp_bigip.py: Deploy iApp Service on BIG-IP 
- delete_iapp_bigip.py: Delete iApp Service on BIG-IP

