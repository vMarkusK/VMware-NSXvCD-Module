Function Get-NsxVcdEdge {
    <#
    .DESCRIPTION
        Returnes Edge Gatways.

    .NOTES
        File Name  : Get-NsxVcdEdge.ps1
        Author     : Markus Kraus
        Version    : 1.2
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
        Get-NsxVcdEdge

    .EXAMPLE
        Get-NsxVcdEdge -Name <Edge Name>

    .EXAMPLE
        Get-NsxVcdEdge | select Name, datacenterName, Id | ft -AutoSize

    #>
        Param (
            [Parameter(Mandatory=$False, ValueFromPipelineByPropertyName=$True, ValueFromPipeline=$True, HelpMessage="Name of the Edge Gateway")]
            [ValidateNotNullorEmpty()]
                    [String] $Name
        )
        Process {

            [XML]$Edges = Invoke-ApiCall -Uri "/network/edges" -Method "Get"

            if ($Name) {
                $Edges.pagedEdgeList.edgePage.edgeSummary | Where-Object {$_.name -like "$Name"}
            }
            else {
                $Edges.pagedEdgeList.edgePage.edgeSummary
            }

        }
    }
