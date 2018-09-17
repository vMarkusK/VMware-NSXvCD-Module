---
external help file: Get-NsxVcdEdge-help.xml
Module Name: VMware-NSXvCD-Module
online version: https://mycloudrevolution.com/
schema: 2.0.0
---

# Get-NsxVcdEdge

## SYNOPSIS

## SYNTAX

```
Get-NsxVcdEdge [[-Name] <String>] [[-OrgVdcName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returnes the Edge Gatways.

## EXAMPLES

### EXAMPLE 1
```
Get-NsxVcdEdge
```

### EXAMPLE 2
```
Get-NsxVcdEdge -Name YourEdgeName
```

### EXAMPLE 3
```
Get-NsxVcdEdge -OrgVdcName YourOrgName
```

### EXAMPLE 4
```
Get-NsxVcdEdge | select Name, datacenterName, Id | ft -AutoSize
```

## PARAMETERS

### -Name
Name of the Edge Gateway

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OrgVdcName
OrgVdc Name of the Edge Gateway

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
File Name  : Get-NsxVcdEdge.ps1
Author     : Markus Kraus
Version    : 1.3
State      : Ready

## RELATED LINKS

[https://mycloudrevolution.com/](https://mycloudrevolution.com/)

