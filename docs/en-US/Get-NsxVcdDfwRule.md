---
external help file: Get-NsxVcdDfwRule-help.xml
Module Name: VMware-NSXvCD-Module
online version: https://mycloudrevolution.com/
schema: 2.0.0
---

# Get-NsxVcdDfwRule

## SYNOPSIS

## SYNTAX

### layer3Sections
```
Get-NsxVcdDfwRule -OrgVdcId <String> [-RuleId <String>] [-layer3Sections] [-OutputXML] [<CommonParameters>]
```

### layer2Sections
```
Get-NsxVcdDfwRule -OrgVdcId <String> [-RuleId <String>] [-layer2Sections] [-OutputXML] [<CommonParameters>]
```

## DESCRIPTION
Returnes the list of the Firewall Rules the OrgVdc DFW.

## EXAMPLES

### EXAMPLE 1
```
Get-NsxVcdDfwRule -OrgId OrgVdcId -layer3Sections
```

### EXAMPLE 2
```
Get-NsxVcdDfwRule -OrgId OrgVdcId -layer2Sections
```

### EXAMPLE 3
```
Get-NsxVcdDfwRule -OrgId OrgVdcId -layer2Sections -RuleId 1234
```

## PARAMETERS

### -OrgVdcId
Id of the OrgVdcId

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RuleId
Rule Id of the OrgVdc DFW

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -layer3Sections
Display only layer3Sections

```yaml
Type: SwitchParameter
Parameter Sets: layer3Sections
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -layer2Sections
Display only layer2Sections

```yaml
Type: SwitchParameter
Parameter Sets: layer2Sections
Aliases:

Required: True
Position: Named
Default value: False
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
File Name  : Get-NsxVcdDfwRule.ps1
Author     : Markus Kraus
Version    : 1.0
State      : Ready

## RELATED LINKS

[https://mycloudrevolution.com/](https://mycloudrevolution.com/)

