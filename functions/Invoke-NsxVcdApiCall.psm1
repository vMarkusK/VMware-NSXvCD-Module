Function Invoke-NsxVcdApiCall {
    <#
    .DESCRIPTION
        Helper Function to call the vCloud Director API.

    .NOTES
        File Name  : Invoke-NsxVcdApiCall.ps1
        Author     : Markus Kraus
        Version    : 1.1
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
        Invoke-NsxVcdApiCall -Uri "/network/edges/$Id/nat/config" -Method "Get"

    .PARAMETER Server
        FQDN of the vCloud Director Instance

    .PARAMETER Authorization
        API Authorization String

    .PARAMETER Uri
        API Uri

    .PARAMETER Accept
        Accept Header fot the API Call

    .PARAMETER Method
        Method of the API Call

    #>
        Param (
            [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="FQDN of the vCloud Director Instance")]
            [ValidateNotNullorEmpty()]
                [String]$Server = $Global:ApiConnection.Server,
            [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="API Authorization String")]
            [ValidateNotNullorEmpty()]
                [String]$Authorization = $Global:ApiConnection.Authorization,
            [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="API Uri")]
            [ValidateNotNullorEmpty()]
                [String]$Uri,
            [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Accept Header fot the API Call")]
            [ValidateNotNullorEmpty()]
                [String]$Accept = "application/*+xml",
            [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Method of the API Call")]
            [ValidateNotNullorEmpty()]
            [ValidateSet("Get","Post","Put")]
                [String]$Method,
            [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Body of the API Call")]
            [ValidateNotNullorEmpty()]
                [XML]$Body
        )
        Process {

            #region: RESTful API Call
            if ($Body -and $Method -eq "Post") {
                $FullUri = "https://" + $Server + $Uri
                $Headers =  @{'accept' = $Accept +';version=' + $Global:ApiConnection.ApiVersion;'Content-type' = 'application/xml';'Accept-Language' = 'en';'x-vcloud-authorization' = $Authorization}
                [XML]$Return = Invoke-RestMethod -uri $FullUri -Method $Method -Headers $Headers -Body $Body
            }
            else {
                $FullUri = "https://" + $Server + $Uri
                $Headers =  @{'accept' = $Accept +';version=' + $Global:ApiConnection.ApiVersion;'Content-type' = 'application/xml';'Accept-Language' = 'en';'x-vcloud-authorization' = $Authorization}
                [XML]$Return = Invoke-RestMethod -uri $FullUri -Method $Method -Headers $Headers
            }
            #edregion

            $Return
        }
    }
