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

    .EXAMPLE
        Get-NsxVcdEdge | Get-NsxVcdEdgeDetails | ft -AutoSize

    .PARAMETER Server
        Server

    .PARAMETER Authorization
        Authorization

    .PARAMETER Id
        Id

    #>
        Param (
            [Parameter(Mandatory=$True, ValueFromPipelineByPropertyName=$True, ValueFromPipeline=$True, HelpMessage="Server")]
            [ValidateNotNullorEmpty()]
                    [String] $Id
        )
        Process {

            [XML]$EdgeDetails = Invoke-ApiCall -Uri "/network/edges/$Id" -Method "Get"

            $EdgeDetails.edge
        }
    }
