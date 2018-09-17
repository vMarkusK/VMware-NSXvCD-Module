---
external help file: Format-XML-help.xml
Module Name: VMware-NSXvCD-Module
online version: https://mycloudrevolution.com/
schema: 2.0.0
---

# Format-XML

## SYNOPSIS
Accepts a string containing valid XML tags or an XMLElement object and
outputs it as a formatted string including newline and indentation of child
nodes.

## SYNTAX

```
Format-XML [[-xml] <Object>] [-indent <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Valid XML returned by the NSX API is a single string with no newlines or
indentation. 
While PowerNSX cmdlets typicallly emit an XMLElement object,
which PowerShell outputs as formatted tables or lists when outputing to host,
making normal human interaction easy, for output to file or debug stream,
format-xml converts the API returned XML to more easily read formated XML
complete with linebreaks and indentation.

As a side effect, this has the added benefit of being useable as an
additional format handler on the PowerShell pipeline, so rather than
displaying output objects using familiar table and list output formats, the
user now has the option of displaying the native XML in a human readable
format.

## EXAMPLES

### EXAMPLE 1
```
Get-NsxTransportZone | Format-Xml
```

Displays the XMLElement object returned by Get-NsxTransportZone as formatted
XML.

## PARAMETERS

### -xml
String object containing valid XML, or XMLElement or XMLDocument object

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -indent
Number of whitespace charaters to indent child nodes by when formatting

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 2
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
