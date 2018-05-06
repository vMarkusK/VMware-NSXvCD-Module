Function Get-NsxVcdEdgeFirewallRule {
    <#
    .SYNOPSIS

    .DESCRIPTION

    .NOTES
        File Name  : Get-NsxVcdEdgeFirewallRule.ps1
        Author     : Markus Kraus
        Version    : 1.1
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
       Get-NsxVcdEdgeFirewallRule -Id <Edge Id>

    .PARAMETER Id
        Id

    #>
        Param (
            [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Server")]
            [ValidateNotNullorEmpty()]
                    [String] $Id
        )
        Process {

            [XML]$Rules = Invoke-ApiCall -Uri "/network/edges/$Id/firewall/config" -Method "Get"

            $Rules.firewall.firewallRules.firewallRule
        }
    }
