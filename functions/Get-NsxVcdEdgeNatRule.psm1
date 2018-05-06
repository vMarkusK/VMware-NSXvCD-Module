Function Get-NsxVcdEdgeNatRule {
    <#
    .SYNOPSIS

    .DESCRIPTION

    .NOTES
        File Name  : Get-NsxVcdEdgeNatRule.ps1
        Author     : Markus Kraus
        Version    : 1.0
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
       Get-NsxVcdEdgeNatRule -Id <Edge Id>

    .PARAMETER Id
        Id

    #>
        Param (
            [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Server")]
            [ValidateNotNullorEmpty()]
                [String] $Id
        )
        Process {

            [XML]$Rules = Invoke-ApiCall -Uri "/network/edges/$Id/nat/config" -Method "Get"
            $Rules.nat.natRules.natRule

        }
    }
