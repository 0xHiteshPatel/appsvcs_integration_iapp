import requests
# Disable alerting for self-signed certs
from requests.packages import urllib3
urllib3.disable_warnings()

import json
import pprint
pp = pprint.PrettyPrinter(indent=2)


s = requests.session()
# Credentials for the BIG-IP
s.auth = ('admin','password')
s.verify = False

# Replace with the address of your BIG-IP
url = "https://BIGIP ADDRESS/mgmt/tm/sys/application/service"

# Set iApp name and template
app_name = "example-appsvcs1"
template = "/Common/appsvcs_integration_v1.0_001"

payload = {
    'template': template,
    'inheritedDevicegroup': 'true',
    'inheritedTrafficGroup': 'true',
    'kind': 'tm:sys:application:service:servicestate',
    'name': app_name,
    'partition': 'Common',
# Pool Members
    'tables': [ { 'columnNames': [ 'IPAddress',
                                    'Port',
                                    'ConnectionLimit',
                                    'Ratio',
                                    'State'],
                  'name': 'pool__Members',
                  'rows': [ { 'row': [ 'NodeName', # Pre-existing node
                              '80',
                              '0',
                              '1',
                              'enabled']},
                            { 'row': [ '10.20.30.99', # iApp will generate the node
                              '80',
                              '0',
                              '1',
                              'enabled']}]
                  }],

    'variables': [
# iApp Options
        { 'name': 'iapp__strictUpdates',
          'value': 'enabled'},
        { 'name': 'iapp__appStats',
          'value': 'enabled'},
        { 'name': 'iapp__mode',
          'value': 'auto'},
        { 'name': 'iapp__routeDomain',
          'value': 'auto'},

# Virtual Server & Listener Configuration
        { 'name': 'pool__addr',
          'value': '10.20.30.1'}, # Virtual Service Address
        { 'name': 'pool__mask',
          'value': '255.255.255.255'},
        { 'name': 'pool__port',
          'value': '443'},
        { 'name': 'pool__Name',
          'value': 'my_pool'},
        { 'name': 'pool__Description',
          'value': 'pooldescr'},
        { 'name': 'pool__Monitor',
          'value': '/Common/http'},
        { 'name': 'pool__LbMethod',
          'value': 'round-robin'},
        { 'name': 'pool__MemberDefaultPort',
          'value': '80'},

# Virtual Server Configuration        
        { 'name': 'vs__Name',
          'value': 'my_virtualserver'},
        { 'name': 'vs__Description',
          'value': 'vsdescr'},
        { 'name': 'vs__SourceAddress',
          'value': '0.0.0.0/0'},
        { 'name': 'vs__IpProtocol',
          'value': 'tcp'},
        { 'name': 'vs__ConnectionLimit',
          'value': '0'},
        { 'name': 'vs__ProfileClientProtocol',
          'value': '/Common/tcp-wan-optimized'},
        { 'name': 'vs__ProfileServerProtocol',
          'value': '/Common/tcp-lan-optimized'},
        { 'name': 'vs__ProfileHTTP',
          'value': '/Common/http'},
        { 'name': 'vs__ProfileOneConnect',
          'value': '/Common/oneconnect'},
        { 'name': 'vs__ProfileCompression',
          'value': '/Common/httpcompression'},
        { 'name': 'vs__ProfileDefaultPersist',
          'value': '/Common/cookie'},
        { 'name': 'vs__ProfileFallbackPersist',
          'value': '/Common/source_addr'},
        { 'name': 'vs__SNATConfig',
          'value': 'automap'},
        { 'name': 'vs__ProfileClientSSLCert',
          'value': '/Common/mycert.crt'},
        { 'name': 'vs__ProfileClientSSLChain',
          'value': '/Common/ca-bundle.crt'},
        { 'name': 'vs__ProfileClientSSLKey',
          'value': '/Common/mycert.key'},
        { 'name': 'vs__ProfileSecurityIPBlacklist',
          'value': 'none'},
        { 'name': 'vs__OptionSourcePort',
          'value': 'preserve'},
        { 'name': 'vs__OptionConnectionMirroring',
          'value': 'disabled'},

# L4-7 Application Functionality
        { 'name': 'feature__statsTLS',
          'value': 'auto'},
        { 'name': 'feature__statsHTTP',
          'value': 'auto'},
        { 'name': 'feature__insertXForwardedFor',
          'value': 'auto'},
        { 'name': 'feature__redirectToHTTPS',
          'value': 'auto'},
        { 'name': 'feature__sslEasyCipher',
          'value': 'high'},
        { 'name': 'feature__securityEnableHSTS',
          'value': 'disabled'},
        { 'name': 'feature__easyL4Firewall',
          'value': 'auto'},
        ]}

resp = s.post(url, data=json.dumps(payload))
pp.pprint(json.loads(resp.text))



# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4

