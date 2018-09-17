Function Add-NsxVcdDfwSecurityTagVM {
    <#
    .DESCRIPTION
        Add a VM to a Security Tag of the OrgVdc DFW.

    .NOTES
        File Name  : Add-NsxVcdDfwSecurityTagVM.ps1
        Author     : Markus Kraus
        Version    : 1.0
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
       Add-NsxVcdDfwSecurityTagVMs -SecurityTagId SecurityTagId -VmId

    .PARAMETER SecurityTagId
        Id (objectId) of the Security Tag

    .PARAMETER VmId
        Id (UUID) of the VM

    #>
    Param (
        [Parameter(Mandatory=$True, ValueFromPipeline=$True, HelpMessage="Id of the Security Tag")]
        [ValidateNotNullorEmpty()]
            [String][alias("objectId")]$SecurityTagId,
        [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Id (UUID) of the VM")]
        [ValidateNotNullorEmpty()]
            [String] $VmId
    )
    Process {

        [xml]$DfwSecurityTagVM = Invoke-NsxVcdApiCall -Uri "/network/services/securitytags/tag/$SecurityTagId/vm/$VmId" -Method "Put"

        Get-NsxVcdDfwSecurityTagVMs -SecurityTagId $SecurityTagId | Select-Object objectId, objectTypeName, name
    }
}
