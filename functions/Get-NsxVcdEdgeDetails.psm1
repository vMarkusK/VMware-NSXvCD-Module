Function Get-NsxVcdEdgeDetails {
    <#
    .SYNOPSIS

    .DESCRIPTION

    .NOTES
        File Name  : Get-NsxVcdEdgeDetails.ps1
        Author     : Markus Kraus
        Version    : 1.0
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE

    .PARAMETER Name
        Name

    #>
        Param (
            [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Server")]
            [ValidateNotNullorEmpty()]
                [String] $Server = $Global:ApiConnection.Server,
            [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Authorization")]
            [ValidateNotNullorEmpty()]
                [String] $Authorization = $Global:ApiConnection.Authorization,
            [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Server")]
            [ValidateNotNullorEmpty()]
                    [String] $Id
        )
        Process {

            $Uri = "https://$Server/network/edges/$Id"
            $Headers =  @{'accept' = 'application/*+xml;version=' + $Global:ApiConnection.ApiVersion; 'x-vcloud-authorization' = $Authorization}
            [XML]$EdgeDetails = Invoke-RestMethod -uri $Uri -Method Get -Headers $Headers

            $EdgeDetails.edge
        }
    }
