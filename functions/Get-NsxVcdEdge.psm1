Function Get-NsxVcdEdge {
    <#
    .DESCRIPTION
        Returnes all Edge Gatways.

    .NOTES
        File Name  : Get-NsxVcdEdge.ps1
        Author     : Markus Kraus
        Version    : 1.1
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
        Get-NsxVcdEdge

    .EXAMPLE
        Get-NsxVcdEdge | select Name, datacenterName, Id | ft -AutoSize

    #>
        Param (

        )
        Process {

            [XML]$Edges = Invoke-ApiCall -Uri "/network/edges" -Method "Get"

            $Edges.pagedEdgeList.edgePage.edgeSummary
        }
    }
