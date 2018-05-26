---
external help file: Invoke-NsxVcdApiCall-help.xml
Module Name: VMware-NSXvCD-Module
online version: https://mycloudrevolution.com/
schema: 2.0.0
---

# Invoke-NsxVcdApiCall

## SYNOPSIS

## SYNTAX

```
Invoke-NsxVcdApiCall [[-Server] <String>] [[-Authorization] <String>] [-Uri] <String> [[-Accept] <String>]
 [-Method] <String> [<CommonParameters>]
```

## DESCRIPTION
Helper Function to call the vCloud Director API.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NsxVcdApiCall -Uri "/network/edges/$Id/nat/config" -Method "Get"
```

## PARAMETERS

### -Server
FQDN of the vCloud Director Instance

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: $Global:ApiConnection.Server
Accept pipeline input: False
Accept wildcard characters: False
```

### -Authorization
API Authorization String

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: $Global:ApiConnection.Authorization
Accept pipeline input: False
Accept wildcard characters: False
```

### -Uri
API Uri

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Accept
Accept Header fot the API Call

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: Application/*+xml
Accept pipeline input: False
Accept wildcard characters: False
```

### -Method
Method of the API Call

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
File Name  : Invoke-NsxVcdApiCall.ps1
Author     : Markus Kraus
Version    : 1.1
State      : Ready

## RELATED LINKS

[https://mycloudrevolution.com/](https://mycloudrevolution.com/)

