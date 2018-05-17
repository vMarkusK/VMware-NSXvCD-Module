Function Get-NsxVcdEdgeNatRule {
    <#
    .DESCRIPTION
        Returnes all NAT Rules of the Edge Gatway.

    .NOTES
        File Name  : Get-NsxVcdEdgeNatRule.ps1
        Author     : Markus Kraus
        Version    : 1.0
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
       Get-NsxVcdEdgeNatRule -Id EdgeId

    .PARAMETER Id
        Id of the Edge Gateway

        Note:
        You can list all Ids of your edges by: 'Get-NsxVcdEdge | select Name, datacenterName, Id'

    #>
        Param (
            [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Id of the Edge Gateway")]
            [ValidateNotNullorEmpty()]
                [String] $Id
        )
        Process {

            [XML]$Rules = Invoke-ApiCall -Uri "/network/edges/$Id/nat/config" -Method "Get"
            $Rules.nat.natRules.natRule

        }
    }
