---
external help file: Get-NsxVcdEdgeDetails-help.xml
Module Name: VMware-NSXvCD-Module
online version: https://mycloudrevolution.com/
schema: 2.0.0
---

# Get-NsxVcdEdgeDetails

## SYNOPSIS

## SYNTAX

```
Get-NsxVcdEdgeDetails [-Id] <String> [<CommonParameters>]
```

## DESCRIPTION
Returnes Details of the Edge Gatway.

## EXAMPLES

### BEISPIEL 1
```

```

### BEISPIEL 2
```
Get-NsxVcdEdge | Get-NsxVcdEdgeDetails | ft -AutoSize
```

## PARAMETERS

### -Id
Id of the Edge Gateway

Note:
You can list all Ids of your edges by: 'Get-NsxVcdEdge | select Name, datacenterName, Id'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
File Name  : Get-NsxVcdEdgeDetails.ps1
Author     : Markus Kraus
Version    : 1.1
State      : Ready

## RELATED LINKS

[https://mycloudrevolution.com/](https://mycloudrevolution.com/)

