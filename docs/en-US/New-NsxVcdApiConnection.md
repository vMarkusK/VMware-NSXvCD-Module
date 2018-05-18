---
external help file: New-NsxVcdApiConnection-help.xml
Module Name: VMware-NSXvCD-Module
online version: https://mycloudrevolution.com/
schema: 2.0.0
---

# New-NsxVcdApiConnection

## SYNOPSIS

## SYNTAX

```
New-NsxVcdApiConnection [-Server] <String> [-Credential] <PSCredential> [<CommonParameters>]
```

## DESCRIPTION
Connects to the API of your vCloud Director instance.
The Session is saved for further use.

## EXAMPLES

### EXAMPLE 1
```
New-NsxVcdApiConnection -Server ServerFQDN -Credential $Credential
```

## PARAMETERS

### -Server
FQDN of the vCloud Director Instance

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

### -Credential
API Credentials for the vCloud Director Instance

Note:
Username needs to be: \<User\>@\<Org\> (Administrtator@system)

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
File Name  : New-NsxVcdApiConnection.ps1
Author     : Markus Kraus
Version    : 1.2
State      : Ready

## RELATED LINKS

[https://mycloudrevolution.com/](https://mycloudrevolution.com/)

