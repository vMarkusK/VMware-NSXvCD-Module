Function Get-NsxVcdDfwSecurityTagVMs {
    <#
    .DESCRIPTION
        Returnes the Security Tag VMs of the OrgVdc DFW.

    .NOTES
        File Name  : Get-NsxVcdDfwSecurityTagVMss.ps1
        Author     : Markus Kraus
        Version    : 1.0
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
       Get-NsxVcdDfwSecurityTagVMs -SecurityTagId SecurityTagId

    .EXAMPLE
       Get-NsxVcdDfwSecurityTagVMs -SecurityTagId SecurityTagId -OutputXML

    .EXAMPLE
        Get-NsxVcdDfwSecurityTags -OrgVdcId OrgVdcId | Get-NsxVcdDfwSecurityTagVMs | select objectId, objectTypeName, name

    .PARAMETER SecurityTagId
        Id (objectId) of the Security Tag

    .PARAMETER OutputXML
        Output the result as XML

    #>
    Param (
        [Parameter(Mandatory=$True, ValueFromPipeline=$True, HelpMessage="Id of the Security Tag")]
        [ValidateNotNullorEmpty()]
            [alias("objectId")]$SecurityTagId,
        [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Display Rules as XML")]
        [ValidateNotNullorEmpty()]
            [Switch] $OutputXML
    )
    Process {

        [xml]$DfwSecurityTagVMs = Invoke-NsxVcdApiCall -Uri "/network/services/securitytags/tag/d0f19690-b44a-4c38-b57e-274ac8d84a5b:securitytag-13/vm" -Method "Get"


        if ($OutputXML) {
            $DfwSecurityTagVMs | Format-XML
        }
        else {
            $DfwSecurityTagVMs.basicinfolist.basicinfo
        }
    }
}
