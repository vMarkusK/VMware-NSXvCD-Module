Function Get-NsxVcdEdgeFirewallRule {
    <#
    .SYNOPSIS

    .DESCRIPTION

    .NOTES
        File Name  : Get-NsxVcdEdgeFirewallRule.ps1
        Author     : Markus Kraus
        Version    : 1.2
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
       Get-NsxVcdEdgeFirewallRule -Id <Edge Id>

    .PARAMETER Id
        Id

    .PARAMETER RuleId
        RuleId

    #>
        Param (
            [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Server")]
            [ValidateNotNullorEmpty()]
                [String] $Id,
            [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Server")]
            [ValidateNotNullorEmpty()]
                [Long] $RuleId
        )
        Process {

            if ($RuleId) {
                [XML]$Rules = Invoke-ApiCall -Uri "/network/edges/$Id/firewall/config/rules/$RuleId" -Method "Get"
                $Rules.firewallRule
            }
            else {
                [XML]$Rules = Invoke-ApiCall -Uri "/network/edges/$Id/firewall/config" -Method "Get"
                $Rules.firewall.firewallRules.firewallRule
            }


        }
    }
