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
       Get-NsxVcdEdgeFirewallRule -Id EdgeId


    .EXAMPLE
        Get-NsxVcdEdge | Get-NsxVcdEdgeFirewallRule | ft -AutoSize

    .PARAMETER Id
        Id of the Edge Gateway

        Note:
        You can list all Ids of your edges by: 'Get-NsxVcdEdge | select Name, datacenterName, Id'

    .PARAMETER RuleId
        RuleId of the Firewall Rule

    .PARAMETER OutputXML
        Output the result as XML

    #>
        Param (
            [Parameter(Mandatory=$True, ValueFromPipelineByPropertyName=$True, ValueFromPipeline=$True, HelpMessage="Id of the Edge Gateway")]
            [ValidateNotNullorEmpty()]
                [String] $Id,
            [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="RuleId of the Firewall Rule")]
            [ValidateNotNullorEmpty()]
                [Long] $RuleId,
            [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Display Rules as XML")]
            [ValidateNotNullorEmpty()]
                [Switch] $OutputXML
        )
        Process {

            if ($RuleId) {
                [XML]$Rules = Invoke-NsxVcdApiCall -Uri "/network/edges/$Id/firewall/config/rules/$RuleId" -Method "Get"
                if ($OutputXML) {
                    $Rules | Format-XML
                }
                else {
                    $Rules.firewallRule
                }

            }
            else {
                [XML]$Rules = Invoke-NsxVcdApiCall -Uri "/network/edges/$Id/firewall/config" -Method "Get"
                if ($OutputXML) {
                    $Rules.firewall.firewallRules | Format-XML
                }
                else {
                    $Rules.firewall.firewallRules.firewallRule
                }
            }

        }
    }
