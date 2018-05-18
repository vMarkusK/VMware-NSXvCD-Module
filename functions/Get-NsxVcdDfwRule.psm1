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
            [Switch] $layer2Sections
    )
    Process {

        [xml]$DfwConfig = Invoke-ApiCall -Uri "/network/firewall/globalroot-0/config?vdc=$OrgVdcId" -Method "Get"

        if ($layer3Sections) {
            if ($RuleId) {
                [Array]$DfwReport = $DfwConfig.firewallConfiguration.layer3Sections.section.rule | Where-Object {$_.Id -eq $RuleId}
            }
            else {
                [Array]$DfwReport = $DfwConfig.firewallConfiguration.layer3Sections.section.rule
            }

        }
        elseif ($layer2Sections) {
            if ($RuleId) {
                [Array]$DfwReport = $DfwConfig.firewallConfiguration.layer2Sections.section.rule | Where-Object {$_.Id -eq $RuleId}
            }
            else {
                [Array]$DfwReport = $DfwConfig.firewallConfiguration.layer2Sections.section.rule
            }

        }
        else {
            if ($RuleId) {
                [Array]$DfwReport = $DfwConfig.firewallConfiguration.layer3Sections.section.rule  | Where-Object {$_.Id -eq $RuleId}
                [Array]$DfwReport += $DfwConfig.firewallConfiguration.layer2Sections.section.rule | Where-Object {$_.Id -eq $RuleId}
            }
            else {
                [Array]$DfwReport = $DfwConfig.firewallConfiguration.layer3Sections.section.rule
                [Array]$DfwReport += $DfwConfig.firewallConfiguration.layer2Sections.section.rule
            }

        }

        $DfwReport
    }
}
