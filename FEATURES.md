Application Services Integration iApp
Release v1.0_001

Supported Features

Deployment Control:
 - Strict Updates setting Control
 - Automated Statistics Handler Creation
 - Deployment mode override
 - Route Domain support

L4-7 Functionality
 Statistics:
  - TLS/SSL
  - HTTP
  - Virtual Server/Pool
 HTTP/HTTPS ADC:
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

Virtual Server Options:
 - Administrative Attributes:
   - Name
   - Description
 - L3/4 Functionality:
   - Types:
     - Standard
     - Performance/FastL4
     - Forwarding (L2/IP)
     - Internal   - IP
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
   - Profiles without create syntax support:
     - Pre-existing Client-SSL
     - Default/fallback Persistence
     - Analytics
     - Security Logging
     - DoS Protection
     - Access Specific (APM):
       - Access Profile
       - Connectivity Profile
       - Per-Request Profile
       
Pool Options:
 - Administrative Attributes:
   - Name
   - Description
 - Pre-existing Health Monitor
 - Load Balancing Method
 - Dynamic Member Update Defaults (Port)
 - Members
   - IP/Pre-existing Node Name
   - Port
   - Connection Limit
   - Ratio
   - Administrative State
 - Advanced Option Support
   - Access to any TMSH configurable attribute