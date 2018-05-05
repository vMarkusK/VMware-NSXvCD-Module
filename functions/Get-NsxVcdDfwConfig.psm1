Function Get-NsxVcdDfwConfig {
    <#
    .SYNOPSIS

    .DESCRIPTION

    .NOTES
        File Name  : Get-NsxVcdDfwConfig.ps1
        Author     : Markus Kraus
        Version    : 0.1
        State      : Dev

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
       Get-NsxVcdDfwConfig

    .PARAMETER Server
        Server

    .PARAMETER Authorization
        Authorization

    #>
    Param (
        [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Server")]
        [ValidateNotNullorEmpty()]
            [String] $Server = $Global:ApiConnection.Server,
        [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Authorization")]
        [ValidateNotNullorEmpty()]
            [String] $Authorization = $Global:ApiConnection.Authorization
    )
    Process {

        [XML]$DfwConfig = Invoke-ApiCall -Uri "/firewall/globalroot-0/config" -Method "Get"

        $DfwConfig
    }
    }
