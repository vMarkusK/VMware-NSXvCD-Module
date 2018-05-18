Function Get-NsxVcdEdgeFirewallRuleStats {
    <#
    .DESCRIPTION
        Returnes the Stats of the Firewall Rule of the Edge Gatway.

    .NOTES
        File Name  : Get-NsxVcdEdgeFirewallRuleStats.ps1
        Author     : Markus Kraus
        Version    : 1.2
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
       Get-NsxVcdEdgeFirewallRuleStats -Id EdgeId -RuleId FirewallRuleId

    .EXAMPLE
       Get-NsxVcdEdge | where {$_.name -like EdgeName} | Get-NsxVcdEdgeFirewallRuleStats -RuleId FirewallRuleId

    .PARAMETER Id
        Id of the Edge Gateway

        Note:
        You can list all Ids of your edges by: 'Get-NsxVcdEdge | select Name, datacenterName, Id'

    .PARAMETER RuleId
        RuleId of the Firewall Rule

    #>
        Param (
            [Parameter(Mandatory=$True, ValueFromPipelineByPropertyName=$True, ValueFromPipeline=$True, HelpMessage="Id of the Edge Gateway")]
            [ValidateNotNullorEmpty()]
                [String] $Id,
            [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="RuleId of the Firewall Rule")]
            [ValidateNotNullorEmpty()]
                [Long] $RuleId
        )
        Process {

            [XML]$Stats = Invoke-NsxVcdApiCall -Uri "/network/edges/$Id/firewall/statistics/$RuleId" -Method "Get"
            $Stats.firewallRuleStats

        }
    }
