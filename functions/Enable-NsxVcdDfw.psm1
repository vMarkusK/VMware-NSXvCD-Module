Function Enable-NsxVcdDfw {
    <#
    .DESCRIPTION
        Enables the Distributed Firewall for the OrgVdc.

    .NOTES
        File Name  : Enable-NsxVcdDfw.ps1
        Author     : Markus Kraus
        Version    : 0.2
        State      : Test

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
       Enable-NsxVcdDfw -Id OrgVdcId

    .PARAMETER Id
        Id of the OrgVdc

    #>
    Param (
        [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Id of the OrgVdc")]
        [ValidateNotNullorEmpty()]
            [String] $Id
    )
    Process {

        try {
            $Dfw = Invoke-ApiCall -Uri "/network/firewall/vdc/$Id" -Method "Post"

            Write-Host "Success" -ForegroundColor Green

        }
        catch {
            Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__ -ForegroundColor Red
            Write-Host "StatusDescription:" $_.Exception.Response.StatusDescription -ForegroundColor Red
        }

    }
    }
