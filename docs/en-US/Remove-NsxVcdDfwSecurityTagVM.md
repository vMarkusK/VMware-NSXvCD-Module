---
external help file: Remove-NsxVcdDfwSecurityTagVM-help.xml
Module Name: VMware-NSXvCD-Module
online version: https://mycloudrevolution.com/
schema: 2.0.0
---

# Remove-NsxVcdDfwSecurityTagVM

## SYNOPSIS

## SYNTAX

```
Remove-NsxVcdDfwSecurityTagVM [-SecurityTagId] <String> [[-VmId] <String>] [<CommonParameters>]
```

## DESCRIPTION
Remove a VM to a Security Tag of the OrgVdc DFW.

## EXAMPLES

### EXAMPLE 1
```
Remove-NsxVcdDfwSecurityTagVMs -SecurityTagId SecurityTagId -VmId
```

## PARAMETERS

### -SecurityTagId
Id (objectId) of the Security Tag

```yaml
Type: String
Parameter Sets: (All)
Aliases: objectId

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -VmId
Id (UUID) of the VM

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
File Name  : Remove-NsxVcdDfwSecurityTagVM.ps1
Author     : Markus Kraus
Version    : 1.0
State      : Ready

## RELATED LINKS

[https://mycloudrevolution.com/](https://mycloudrevolution.com/)

