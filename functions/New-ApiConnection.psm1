Function New-ApiConnection {
    <#
    .SYNOPSIS

    .DESCRIPTION

    .NOTES
        File Name  : New-ApiConnection.ps1
        Author     : Markus Kraus
        Version    : 1.0
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE

    .PARAMETER Name
        Name

    #>
        Param (
            [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Server")]
            [ValidateNotNullorEmpty()]
                [String] $Server,
            [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Credential")]
            [ValidateNotNullorEmpty()]
                [PSCredential] $Credential
        )
        Process {

            $Username = $Credential.UserName
            $Password = $Credential.GetNetworkCredential().Password
            $BasicAuth =  $([Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$($Username):$($Password)")))

            #region: Login
            $Uri = "https://$Server/api/sessions"
            $Authorization = 'Basic {0}' -f $BasicAuth
            $Headers =  @{'accept' = 'application/vnd.vmware.vcloud.session+xml;version=30.0'; 'Authorization' = $Authorization}
            $ResponseHeaders = $null
            $Login = Invoke-WebRequest -Uri $Uri -Headers $Headers -Method Post

            #region: Cleanup Confidential Data
            Clear-Variable -Name BasicAuth, Authorization, Headers, Username, Password
            #endregion

            $Global:ApiConnection = [pscustomobject]@{

                Server = $Server
                Authorization = [String]$Login.Headers.'x-vcloud-authorization'

            }

        }
    }
