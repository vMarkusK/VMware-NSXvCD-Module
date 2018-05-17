Function New-ApiConnection {
    <#
    .DESCRIPTION
        Connects to the API of your vCloud Director instance. The Session is saved for further use.

    .NOTES
        File Name  : New-ApiConnection.ps1
        Author     : Markus Kraus
        Version    : 1.2
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
        New-ApiConnection -Server <Server FQDN> -Credential $Credential

    .PARAMETER Server
        FQDN of the vCloud Director Instance

    .PARAMETER Credential
        API Credentials for the vCloud Director Instance

        Note:
        Username needs to be: <User>@<Org> (Administrtator@system)

    #>
        Param (
            [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="FQDN of the vCloud Director Instance")]
            [ValidateNotNullorEmpty()]
                [String] $Server,
            [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="API Credentials for the vCloud Director Instance")]
            [ValidateNotNullorEmpty()]
                [PSCredential] $Credential
        )
        Process {

            #region: Buid BasicAuth
            $Username = $Credential.UserName
            $Password = $Credential.GetNetworkCredential().Password
            $BasicAuth =  $([Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$($Username):$($Password)")))
            #endregion

            #region: Api Versions
            $Uri = "https://$Server/api/versions"
            [xml]$Versions = Invoke-WebRequest -Uri $Uri -Method Get
            $LatestVersion = $Versions.SupportedVersions.VersionInfo | Where-Object {$_.deprecated -eq $false} | Select-Object -Last 1
            #endregion

            #region: Login
            $Uri = "https://$Server/api/sessions"
            $Authorization = 'Basic {0}' -f $BasicAuth
            $Headers =  @{'accept' = 'application/vnd.vmware.vcloud.session+xml;version=' + [String]$LatestVersion.Version ; 'Authorization' = $Authorization}
            $Login = Invoke-WebRequest -Uri $Uri -Headers $Headers -Method Post
            $LoginDate = Get-Date
            #endregion

            #region: Cleanup Confidential Data
            Clear-Variable -Name BasicAuth, Authorization, Headers, Username, Password
            #endregion

            #region: Build Connection Variable
            $Global:ApiConnection = [pscustomobject]@{

                Server = $Server
                Authorization = [String]$Login.Headers.'x-vcloud-authorization'
                LoginDate = [String]$LoginDate.ToString()
                ApiVersion = [String]$LatestVersion.Version
            }
            #endregion

            $Global:ApiConnection

        }
    }
