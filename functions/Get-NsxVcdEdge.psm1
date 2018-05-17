Function Get-NsxVcdEdge {
    <#
    .DESCRIPTION
        Returnes Edge Gatways.

    .NOTES
        File Name  : Get-NsxVcdEdge.ps1
        Author     : Markus Kraus
        Version    : 1.3
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
        Get-NsxVcdEdge

    .EXAMPLE
        Get-NsxVcdEdge -Name <Edge Name>

    .EXAMPLE
        Get-NsxVcdEdge -OrgVdcName <Edge OrgVdc Name>

    .EXAMPLE
        Get-NsxVcdEdge | select Name, datacenterName, Id | ft -AutoSize

    .PARAMETER Name
        Name of the Edge Gateway

    .PARAMETER OrgVdcName
        OrgVdc Name of the Edge Gateway

    #>
        Param (
            [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Name of the Edge Gateway")]
            [ValidateNotNullorEmpty()]
                [String] $Name,
            [Parameter(Mandatory=$False, ValueFromPipeline=$False, HelpMessage="Name of the OrgVdc")]
            [ValidateNotNullorEmpty()]
                [String] $OrgVdcName
        )
        Process {

            [XML]$Edges = Invoke-ApiCall -Uri "/network/edges" -Method "Get"

            if ($Name) {
                $Edges.pagedEdgeList.edgePage.edgeSummary | Where-Object {$_.name -like "$Name"}
            }
            elseif ($OrgVdcName) {
                $Edges.pagedEdgeList.edgePage.edgeSummary | Where-Object {$_.datacenterName -like "$OrgVdcName"}
            }
            else {
                $Edges.pagedEdgeList.edgePage.edgeSummary
            }

        }
    }
