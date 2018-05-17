Function Get-NsxVcdEdgeFirewallRuleDetails {
    <#
    .DESCRIPTION
        Returnes Details of a Firewall Rule of the Edge Gatway.

    .NOTES
        File Name  : Get-NsxVcdEdgeFirewallRuleDetails.ps1
        Author     : Markus Kraus
        Version    : 0.5
        State      : Test

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
       Get-NsxVcdEdgeFirewallRuleDetails -Id <Edge Id> -RuleId <RuleId>


    .EXAMPLE
        Get-NsxVcdEdge | Get-NsxVcdEdgeFirewallRuleDetails -RuleId <RuleId>

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

            [XML]$Rule = Invoke-ApiCall -Uri "/network/edges/$Id/firewall/config/rules/$RuleId" -Method "Get"

            "Summary:"
            "--------"
            $Rule.firewallRule | Format-List

            "Source:"
            "-------"
            $Rule.firewallRule.source | Format-List

            "Destination:"
            "------------"
            $Rule.firewallRule.destination | Format-List

            "Application-Service:"
            "--------------------"
            $Rule.firewallRule.application.service | Format-List
        }
    }
