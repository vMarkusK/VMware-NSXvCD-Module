---
external help file: Get-NsxVcdEdgeFirewallRuleStats-help.xml
Module Name: VMware-NSXvCD-Module
online version: https://mycloudrevolution.com/
schema: 2.0.0
---

# Get-NsxVcdEdgeFirewallRuleStats

## SYNOPSIS

## SYNTAX

```
Get-NsxVcdEdgeFirewallRuleStats [-Id] <String> [-RuleId] <Int64> [<CommonParameters>]
```

## DESCRIPTION
Returnes the Stats of the Firewall Rule of the Edge Gatway.

## EXAMPLES

### BEISPIEL 1
```
-RuleId <Rule Id>
```

### BEISPIEL 2
```
"} | Get-NsxVcdEdgeFirewallRuleStats -RuleId <Rule Id>
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

### -RuleId
RuleId of the Firewall Rule

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
File Name  : Get-NsxVcdEdgeFirewallRuleStats.ps1
Author     : Markus Kraus
Version    : 1.2
State      : Ready

## RELATED LINKS

[https://mycloudrevolution.com/](https://mycloudrevolution.com/)

