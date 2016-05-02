Application Services Integration iApp
Release v2.0_001

Supported Features

Deployment Control:
 - Strict Updates setting Control
 - Automated Statistics Handler Creation
 - Deployment mode override
 - Route Domain support
 - ASM/APM Policy Redeployment Control
   - Preserve on-box policy (allow out-of-band policy updates)
   - Enforce template policy (overwrite local changes)
 - Deployment Log Level Control

L4-7 Functionality:
 Statistics:
  - TLS/SSL
  - HTTP
  - Virtual Server/Pool
 HTTP/HTTPS ADC:
  - HTTP/L7 Policy Creation
  - X-Forwarded-For Header Insertion
  - HTTP->HTTPS Redirect creation
  - TLS/SSL Easy Cipher String
 L4 Security:
  - L4 Firewall Policy Support
   - Dynamic IP Blacklisting/IP Intelligence (BIG-IP subscription required)
   - Static Blacklist Source Address List
   - Static Allowed Source Address List
 HTTP/HTTPS L7 Security:
  - HTTP Strict Transport Security Header Insertion
  - Web Application Firewall (ASM) policy bundling/deployment
  - Identity and Access Management (APM) policy bundling/deployment

Custom Extensions:
 - Extensibility through custom TCL scripting
   - See include/custom_extensions.tcl for more info

Virtual Server Options:
 - Multiple listeners:
   - IPv4 & IPv6 Address and L4 Port
   - Remove SSL/TLS profile(s) (Client, Server, Both)
   - Destinations:
     - Pools
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
   - Advanced Profile Support
     - Reference any pre-existing policy on the device
   - SSL/TLS:
     - Dynamically created Client-SSL profiles
       - Reference pre-existing static Cert/Key
       - ‘auto’ mode to dynamically link pre-existing Cert/Key pair
       - Load cert/key from URL
     - Certificate Chain/Bundle
     - Cipher String
     - Advanced Option Support - Access to any TMSH configurable Client-SSL profile attribute     
   - Profiles with create syntax support:
     - L4 Protocol (tcp/udp/fastL4)
     - HTTP
     - OneConnect
     - Compression
     - Request Logging
     - Server-SSL
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
       
Pool Options:
 - Create multiple pools
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
 - Advanced Option Support
   - Access to any TMSH configurable attribute

Health Monitors:
 - Multiple monitor support
 - Create custom health monitors
   - Advanced Option Support
     - Access to any TMSH configurable attribute
 - Reference existing health monitors

Utility Scripts:
 - import_template_bigip.py: Create/update iApp template
 - import_cery_key.py: Create/update SSL/TLS Cert/Key on BIG-IP
 - deploy_iapp_bigip.py: Deploy iApp Service on BIG-IP 
 - delete_iapp_bigip.py: Delete iApp Service on BIG-IP

