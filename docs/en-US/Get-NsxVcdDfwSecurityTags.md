---
external help file: Get-NsxVcdDfwSecurityTags-help.xml
Module Name: VMware-NSXvCD-Module
online version: https://mycloudrevolution.com/
schema: 2.0.0
---

# Get-NsxVcdDfwSecurityTags

## SYNOPSIS

## SYNTAX

```
Get-NsxVcdDfwSecurityTags [-OrgVdcId] <String> [-OutputXML] [<CommonParameters>]
```

## DESCRIPTION
Returnes the Security tags of the OrgVdc DFW.

## EXAMPLES

### EXAMPLE 1
```
Get-NsxVcdDfwSecurityTags -OrgId OrgVdcId
```

### EXAMPLE 2
```
Get-NsxVcdDfwSecurityTags -OrgId OrgVdcId -OutputXML
```

### EXAMPLE 3
```
Get-NsxVcdDfwSecurityTags -OrgVdcId OrgVdcId | select objectId, name, description, vmCount
```

## PARAMETERS

### -OrgVdcId
Id of the OrgVdcId

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
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
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
File Name  : Get-NsxVcdDfwSecurityTags.ps1
Author     : Markus Kraus
Version    : 1.0
State      : Ready

## RELATED LINKS

[https://mycloudrevolution.com/](https://mycloudrevolution.com/)

