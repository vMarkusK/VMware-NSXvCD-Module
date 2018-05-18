Function Get-NsxVcdEdgeDetails {
    <#
    .DESCRIPTION
        Returnes Details of the Edge Gatway.

    .NOTES
        File Name  : Get-NsxVcdEdgeDetails.ps1
        Author     : Markus Kraus
        Version    : 1.1
        State      : Ready

    .LINK
        https://mycloudrevolution.com/

    .EXAMPLE
        Get-NsxVcdEdgeDetails -Id EdgeId

    .EXAMPLE
        Get-NsxVcdEdge | Get-NsxVcdEdgeDetails | ft -AutoSize

    .PARAMETER Id
        Id of the Edge Gateway

        Note:
        You can list all Ids of your edges by: 'Get-NsxVcdEdge | select Name, datacenterName, Id'

    #>
        Param (
            [Parameter(Mandatory=$True, ValueFromPipelineByPropertyName=$True, ValueFromPipeline=$True, HelpMessage="Id of the Edge Gateway")]
            [ValidateNotNullorEmpty()]
                    [String] $Id
        )
        Process {

            [XML]$EdgeDetails = Invoke-NsxVcdApiCall -Uri "/network/edges/$Id" -Method "Get"

            $EdgeDetails.edge
        }
    }
