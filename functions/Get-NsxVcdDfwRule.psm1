Function Get-NsxVcdDfwRule {
    <#
    .DESCRIPTION
        Returnes the of the Firewall Rules the OrgVdc DFW.

    .NOTES
        File Name  : Get-NsxVcdDfwRule.ps1
        Author     : Markus Kraus
        Version    : 1.0
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
       Get-NsxVcdDfwRule -OrgId OrgVdcId -layer3Sections

    .EXAMPLE
       Get-NsxVcdDfwRule -OrgId OrgVdcId -layer2Sections

    .EXAMPLE
       Get-NsxVcdDfwRule -OrgId OrgVdcId -layer2Sections -RuleId 1234

    .PARAMETER OrgVdcId
        Id of the OrgVdcId

    .PARAMETER OutputXML
        Output the result as XML

    #>
    Param (
        [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Id of the OrgVdc")]
        [ValidateNotNullorEmpty()]
            [String] $OrgVdcId,
        [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Rule Id of the OrgVdc DFW")]
        [ValidateNotNullorEmpty()]
            [String] $RuleId,
        [Parameter(Mandatory=$True, ValueFromPipeline=$False, ParameterSetName='layer3Sections', HelpMessage="Display only layer3Sections")]
        [ValidateNotNullorEmpty()]
            [Switch] $layer3Sections,
        [Parameter(Mandatory=$True, ValueFromPipeline=$False, ParameterSetName='layer2Sections',HelpMessage="Display only layer2Sections")]
        [ValidateNotNullorEmpty()]
            [Switch] $layer2Sections,
        [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Display Rules as XML")]
        [ValidateNotNullorEmpty()]
            [Switch] $OutputXML
    )
    Process {

        [xml]$DfwConfig = Invoke-NsxVcdApiCall -Uri "/network/firewall/globalroot-0/config?vdc=$OrgVdcId" -Method "Get"

        if ($layer3Sections) {
            [Array]$DfwReport = $DfwConfig.firewallConfiguration.layer3Sections.section
        }
        elseif ($layer2Sections) {
            [Array]$DfwReport = $DfwConfig.firewallConfiguration.layer2Sections.section
        }
        else {
            [Array]$DfwReport = $DfwConfig.firewallConfiguration.layer3Sections.section
            [Array]$DfwReport += $DfwConfig.firewallConfiguration.layer2Sections.section
        }

        if ($OutputXML) {
            $DfwReport | Format-XML
        }
        elseif ($RuleId) {
            $DfwReport.rule | Where-Object {$_.Id -eq $RuleId}
        }
        elseif ($OutputXML -and $RuleId) {
            $DfwRuleFilter = $DfwReport.rule | Where-Object {$_.Id -eq $RuleId}
            $DfwRuleFilter | Format-XML
        }
        else {
            $DfwReport.rule
        }
    }
}
