Function Get-NsxVcdEdge {
    <#
    .SYNOPSIS

    .DESCRIPTION

    .NOTES
        File Name  : Get-NsxVcdEdge.ps1
        Author     : Markus Kraus
        Version    : 1.0
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
        Get-NsxVcdEdge | select Name, datacenterName, Id

    .PARAMETER Name
        Name

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

            [XML]$Edges = Invoke-ApiCall -Uri "/network/edges" -Method "Get"

            $Edges.pagedEdgeList.edgePage.edgeSummary
        }
    }
