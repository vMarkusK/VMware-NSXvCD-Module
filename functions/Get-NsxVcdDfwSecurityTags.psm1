Function Get-NsxVcdDfwSecurityTags {
    <#
    .DESCRIPTION
        Returnes the Security tags of the OrgVdc DFW.

    .NOTES
        File Name  : Get-NsxVcdDfwSecurityTags.ps1
        Author     : Markus Kraus
        Version    : 1.0
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
       Get-NsxVcdDfwSecurityTags -OrgId OrgVdcId

    .EXAMPLE
       Get-NsxVcdDfwSecurityTags -OrgId OrgVdcId -OutputXML

    .EXAMPLE
        Get-NsxVcdDfwSecurityTags -OrgVdcId OrgVdcId | select objectId, name, description, vmCount

    .PARAMETER OrgVdcId
        Id of the OrgVdcId

    .PARAMETER OutputXML
        Output the result as XML

    #>
    Param (
        [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Id of the OrgVdc")]
        [ValidateNotNullorEmpty()]
            [String] $OrgVdcId,
        [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Display Rules as XML")]
        [ValidateNotNullorEmpty()]
            [Switch] $OutputXML
    )
    Process {

        [xml]$DfwSecurityTags = Invoke-NsxVcdApiCall -Uri "/network/services/securitytags/tag/scope/$OrgVdcId" -Method "Get"


        if ($OutputXML) {
            $DfwSecurityTags | Format-XML
        }
        else {
            $DfwSecurityTags.securityTags.securityTag
        }
    }
}
