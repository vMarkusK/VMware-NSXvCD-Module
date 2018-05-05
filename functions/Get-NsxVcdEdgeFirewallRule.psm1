Function Get-NsxVcdEdgeFirewallRule {
    <#
    .SYNOPSIS

    .DESCRIPTION

    .NOTES
        File Name  : Get-NsxVcdEdgeFirewallRule.ps1
        Author     : Markus Kraus
        Version    : 1.1
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
       Get-NsxVcdEdgeFirewallRule -Id <Edge Id>

    .PARAMETER Id
        Id

    #>
        Param (
            [Parameter(Mandatory=$True, ValueFromPipeline=$False, HelpMessage="Server")]
            [ValidateNotNullorEmpty()]
                    [String] $Id
        )
        Process {

            $Rules = (Get-NsxVcdEdgeDetails -Id 0f6f7f4e-d425-4e05-a6c4-426760abedcd).features.firewall.firewallRules.firewallRule

            $Rules
        }
    }
