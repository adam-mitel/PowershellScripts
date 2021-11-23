# Delete then Add the Contect-Security-Policy header

$value = "default-src https: data: 'unsafe-inline' 'unsafe-eval'"

Remove-WebConfigurationProperty -PSPath MACHINE/WEBROOT/APPHOST `
    -Name . -Filter system.webServer/httpProtocol/customHeaders `
    -AtElement @{name = "Content-Security-Policy"}

Add-WebConfigurationProperty -PSPath MACHINE/WEBROOT/APPHOST `
    -Name . -Filter system.webServer/httpProtocol/customHeaders `
    -AtElement @{name = "Content-Security-Policy" ; value = $value }


# Delete then Add the X-XSS-Protection header

$value = "1; mode=block"

Remove-WebConfigurationProperty -PSPath MACHINE/WEBROOT/APPHOST `
    -Name . -Filter system.webServer/httpProtocol/customHeaders `
    -AtElement @{name = "X-XSS-Protection"}

Add-WebConfigurationProperty -PSPath MACHINE/WEBROOT/APPHOST `
    -Name . -Filter system.webServer/httpProtocol/customHeaders `
    -AtElement @{name = "X-XSS-Protection" ; value = $value }


# Delete then Add the X-Content-Type-Options header

$value = "nosniff"

Remove-WebConfigurationProperty -PSPath MACHINE/WEBROOT/APPHOST `
    -Name . -Filter system.webServer/httpProtocol/customHeaders `
    -AtElement @{name = "X-Content-Type-Options"}

Add-WebConfigurationProperty -PSPath MACHINE/WEBROOT/APPHOST `
    -Name . -Filter system.webServer/httpProtocol/customHeaders `
    -AtElement @{name = "X-Content-Type-Options" ; value = $value }

# Delete then Add the Referrer-Policy header

$value = "no-referrer"

Remove-WebConfigurationProperty -PSPath MACHINE/WEBROOT/APPHOST `
    -Name . -Filter system.webServer/httpProtocol/customHeaders `
    -AtElement @{name = "Referrer-Policy"}

Add-WebConfigurationProperty -PSPath MACHINE/WEBROOT/APPHOST `
    -Name . -Filter system.webServer/httpProtocol/customHeaders `
    -AtElement @{name = "Referrer-Policy" ; value = $value }


# Delete then Add the X-Frame-Options header

$value = "DENY"

Remove-WebConfigurationProperty -PSPath MACHINE/WEBROOT/APPHOST `
    -Name . -Filter system.webServer/httpProtocol/customHeaders `
    -AtElement @{name = "X-Frame-Options"}

Add-WebConfigurationProperty -PSPath MACHINE/WEBROOT/APPHOST `
    -Name . -Filter system.webServer/httpProtocol/customHeaders `
    -AtElement @{name = "X-Frame-Options" ; value = $value }

# Delete the X-Powered-By header

Remove-WebConfigurationProperty -PSPath MACHINE/WEBROOT/APPHOST `
    -Name . -Filter system.webServer/httpProtocol/customHeaders `
    -AtElement @{name = "X-Powered-By"}

# Enable removeServerHeader to hide IIS fingerprint
Set-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter "system.webServer/security/requestFiltering" -name "removeServerHeader" -value "True"

# Disable enableVersionHeader to hide ASPNET version
Set-WebConfigurationProperty -pspath 'MACHINE/WEBROOT'  -filter "system.web/httpRuntime" -name "enableVersionHeader" -value "False"