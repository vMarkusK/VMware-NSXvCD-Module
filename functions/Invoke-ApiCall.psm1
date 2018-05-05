Function Invoke-ApiCall {
    <#
    .SYNOPSIS

    .DESCRIPTION

    .NOTES
        File Name  : Invoke-ApiCall.ps1
        Author     : Markus Kraus
        Version    : 1.1
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE

    .PARAMETER Server
        Server

    .PARAMETER Authorization
        Authorization

    .PARAMETER Uri
        Uri

    .PARAMETER Accept
        Accept

    .PARAMETER Method
        Method

    #>
        Param (
            [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Server")]
            [ValidateNotNullorEmpty()]
                [String]$Server = $Global:ApiConnection.Server,
            [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Authorization")]
            [ValidateNotNullorEmpty()]
                [String]$Authorization = $Global:ApiConnection.Authorization,
            [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Authorization")]
            [ValidateNotNullorEmpty()]
                [String]$Uri,
            [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Authorization")]
            [ValidateNotNullorEmpty()]
                [String]$Accept = "application/*+xml",
            [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Authorization")]
            [ValidateNotNullorEmpty()]
            [ValidateSet("Get","Post")]
                [String]$Method
        )
        Process {

            $FullUri = "https://" + $Server + $Uri
            $Headers =  @{'accept' = $Accept +';version=' + $Global:ApiConnection.ApiVersion;'Content-type' = 'application/xml';'Accept-Language' = 'en';'x-vcloud-authorization' = $Authorization}
            [XML]$Return = Invoke-RestMethod -uri $FullUri -Method $Method -Headers $Headers

            $Return
        }
    }
