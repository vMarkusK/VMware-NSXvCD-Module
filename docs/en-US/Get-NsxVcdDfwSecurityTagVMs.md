---
external help file: Get-NsxVcdDfwSecurityTagVMs-help.xml
Module Name: VMware-NSXvCD-Module
online version: https://mycloudrevolution.com/
schema: 2.0.0
---

# Get-NsxVcdDfwSecurityTagVMs

## SYNOPSIS

## SYNTAX

```
Get-NsxVcdDfwSecurityTagVMs [-SecurityTagId] <Object> [-OutputXML] [<CommonParameters>]
```

## DESCRIPTION
Returnes the Security Tag VMs of the OrgVdc DFW.

## EXAMPLES

### EXAMPLE 1
```
Get-NsxVcdDfwSecurityTagVMs -SecurityTagId SecurityTagId
```

### EXAMPLE 2
```
Get-NsxVcdDfwSecurityTagVMs -SecurityTagId SecurityTagId -OutputXML
```

### EXAMPLE 3
```
Get-NsxVcdDfwSecurityTags -OrgVdcId OrgVdcId | Get-NsxVcdDfwSecurityTagVMs | select objectId, objectTypeName, name
```

## PARAMETERS

### -SecurityTagId
Id (objectId) of the Security Tag

```yaml
Type: Object
Parameter Sets: (All)
Aliases: objectId

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -OutputXML
Output the result as XML

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
File Name  : Get-NsxVcdDfwSecurityTagVMss.ps1
Author     : Markus Kraus
Version    : 1.0
State      : Ready

## RELATED LINKS

[https://mycloudrevolution.com/](https://mycloudrevolution.com/)

