Function Enable-NsxVcdDfw {
    <#
    .SYNOPSIS

    .DESCRIPTION

    .NOTES
        File Name  : Enable-NsxVcdDfw.ps1
        Author     : Markus Kraus
        Version    : 1.0
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
       Enable-NsxVcdDfw

    .PARAMETER Server
        Server

    .PARAMETER Authorization
        Authorization

    .PARAMETER Id
        OrgVdc Id

    #>
    Param (
        [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Server")]
        [ValidateNotNullorEmpty()]
            [String] $Server = $Global:ApiConnection.Server,
        [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Authorization")]
        [ValidateNotNullorEmpty()]
            [String] $Authorization = $Global:ApiConnection.Authorization,
        [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Authorization")]
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
