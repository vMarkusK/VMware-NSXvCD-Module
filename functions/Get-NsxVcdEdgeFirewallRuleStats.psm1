Function Get-NsxVcdEdgeFirewallRuleStats {
    <#
    .SYNOPSIS

    .DESCRIPTION

    .NOTES
        File Name  : Get-NsxVcdEdgeFirewallRuleStats.ps1
        Author     : Markus Kraus
        Version    : 1.2
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
       Get-NsxVcdEdgeFirewallRuleStats -Id <Edge Id> -RuleId <Rule Id>

    .PARAMETER Id
        Id

    .PARAMETER RuleId
        RuleId

    #>
        Param (
            [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Server")]
            [ValidateNotNullorEmpty()]
                [String] $Id,
            [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Server")]
            [ValidateNotNullorEmpty()]
                [Long] $RuleId
        )
        Process {

            [XML]$Stats = Invoke-ApiCall -Uri "/network/edges/$Id/firewall/statistics/$RuleId" -Method "Get"
            $Stats.firewallRuleStats

        }
    }
