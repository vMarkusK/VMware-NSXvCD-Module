Function Get-NsxVcdEdgeDetails {
    <#
    .SYNOPSIS

    .DESCRIPTION

    .NOTES
        File Name  : Get-NsxVcdEdgeDetails.ps1
        Author     : Markus Kraus
        Version    : 1.1
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
        Get-NsxVcdEdgeDetails -Id <Edge Id>

    .PARAMETER Server
        Server

    .PARAMETER Authorization
        Authorization

    .PARAMETER Id
        Id

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

            [XML]$EdgeDetails = Invoke-ApiCall -Uri "/network/edges/$Id" -Method "Get"

            $EdgeDetails.edge
        }
    }
