#Source: https://raw.githubusercontent.com/vmware/powernsx/master/module/PowerNSX.psm1
function Format-XML () {

    <#
    .SYNOPSIS
    Accepts a string containing valid XML tags or an XMLElement object and
    outputs it as a formatted string including newline and indentation of child
    nodes.

    .DESCRIPTION
    Valid XML returned by the NSX API is a single string with no newlines or
    indentation.  While PowerNSX cmdlets typicallly emit an XMLElement object,
    which PowerShell outputs as formatted tables or lists when outputing to host,
    making normal human interaction easy, for output to file or debug stream,
    format-xml converts the API returned XML to more easily read formated XML
    complete with linebreaks and indentation.

    As a side effect, this has the added benefit of being useable as an
    additional format handler on the PowerShell pipeline, so rather than
    displaying output objects using familiar table and list output formats, the
    user now has the option of displaying the native XML in a human readable
    format.

    .EXAMPLE
    Get-NsxTransportZone | Format-Xml

    Displays the XMLElement object returned by Get-NsxTransportZone as formatted
    XML.

    #>

    #NB: Find where I got this to reference...
    #Shamelessly ripped from the web with some modification, useful for formatting XML output into a form that
    #is easily read by humans.  Seriously - how is this not part of the dotnet system.xml classes?

    param (
        [Parameter (Mandatory=$false,ValueFromPipeline=$true,Position=1) ]
            [ValidateNotNullorEmpty()]

            #String object containing valid XML, or XMLElement or XMLDocument object
            $xml="",
        [Parameter (Mandatory=$False)]
            [ValidateNotNullOrEmpty()]

            #Number of whitespace charaters to indent child nodes by when formatting
            [int]$indent=2
    )

    begin {}

    process {
        if ( ($xml -is [System.Xml.XmlElement]) -or ( $xml -is [System.Xml.XmlDocument] ) ) {
            try {
                [xml]$_xml = $xml.OuterXml
            }
            catch {
                throw "Specified XML element cannot be cast to an XML document."
            }
        }
        elseif ( $xml -is [string] ) {
            try {
                [xml]$_xml = $xml
            }
            catch {
                throw "Specified string cannot be cast to an XML document."
            }
        }
        else{

            throw "Unknown data type specified as xml to Format-Xml."
        }

        $StringWriter = New-Object System.IO.StringWriter
        $XmlSettings = New-Object System.Xml.XmlWriterSettings
        $XmlSettings.Indent = $true
        $XmlSettings.ConformanceLevel = "fragment"

        $XmlWriter = [System.XMl.XmlWriter]::Create($StringWriter, $XmlSettings)

        $_xml.WriteContentTo($XmlWriter)
        $XmlWriter.Flush()
        $StringWriter.Flush()
        Write-Output $StringWriter.ToString()
    }

    end{}
}