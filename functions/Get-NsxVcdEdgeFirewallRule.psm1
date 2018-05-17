Function Get-NsxVcdEdgeFirewallRule {
    <#
    .DESCRIPTION
        Returnes the of the Firewall Rules of the Edge Gatway.

    .NOTES
        File Name  : Get-NsxVcdEdgeFirewallRule.ps1
        Author     : Markus Kraus
        Version    : 1.2
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
       Get-NsxVcdEdgeFirewallRule -Id <Edge Id>


    .EXAMPLE
        Get-NsxVcdEdge | Get-NsxVcdEdgeFirewallRule | ft -AutoSize

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
            [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="RuleId of the Firewall Rule")]
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
