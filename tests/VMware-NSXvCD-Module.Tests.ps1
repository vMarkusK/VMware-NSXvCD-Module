$moduleRoot = Resolve-Path "$PSScriptRoot\.."
$moduleName = "VMware-NSXvCD-Module"

$EncryptedCred = "$env:LOCALAPPDATA\vscode-powershell\EncryptedNsxCred.clixml"
if (Test-Path -LiteralPath $EncryptedCred) {
    $Credentials = Import-CliXml $EncryptedCred
}
else {
    $Credentials = Get-Credential
    $Credentials | Export-CliXml "$env:LOCALAPPDATA\vscode-powershell\EncryptedNsxCred.clixml"
}

$NsxFqdn = "$env:LOCALAPPDATA\vscode-powershell\NsxFqdn.txt"
if (Test-Path -LiteralPath $NsxFqdn) {
    [String]$FQDN = Get-Content "$env:LOCALAPPDATA\vscode-powershell\NsxFqdn.txt"
}
else {
    [String]$FQDN = Read-Host -Prompt 'FQDN'
    $FQDN | Out-File -FilePath "$env:LOCALAPPDATA\vscode-powershell\NsxFqdn.txt"
}

Describe "General Code validation: $moduleName" {

    $scripts = Get-ChildItem $moduleRoot -Include *.ps1, *.psm1, *.psd1 -Recurse
    $testCase = $scripts | Foreach-Object {@{file = $_}}
    It "Script <file> should be valid powershell" -TestCases $testCase {
        param($file)

        $file.fullname | Should Exist
        $contents = Get-Content -Path $file.fullname -ErrorAction Stop
        $errors = $null
        $null = [System.Management.Automation.PSParser]::Tokenize($contents, [ref]$errors)
        $errors.Count | Should Be 0
    }

    It 'Script <file> should not have Errors in PSScriptAnalyzer analysis' -TestCases $testCase {
        param($file)

        $file.fullname | Should Exist
        $ScriptAnalyzerResults = Invoke-ScriptAnalyzer -Path $file.fullname -Severity Error
        $ScriptAnalyzerResults | Should BeNullOrEmpty

    }

    $modules = Get-ChildItem $moduleRoot -Include *.psd1 -Recurse
    $testCase = $modules | Foreach-Object {@{file = $_}}
    It "Module <file> can import cleanly" -TestCases $testCase {
        param($file)

        $file.fullname | Should Exist
        $error.clear()
        {Import-Module  $file.fullname } | Should Not Throw
        $error.Count | Should Be 0
    }
}

Describe "Module Function validation: $moduleName" {

    $modules = Get-ChildItem $moduleRoot -Include *.psd1 -Recurse
    Import-Module $modules -Global -Force
    if ($Global:ApiConnection) {
        Remove-Variable ApiConnection
    }

    It "Connect API" {
        New-ApiConnection -Server $FQDN -Credential $Credentials
        ($Global:ApiConnection).GetType().Name | Should -Be "PSCustomObject"
    }

    It "Get Edges" {
        [Array]$Edges = Get-NsxVcdEdge
        $Edges.Count | Should -BeGreaterThan 0
    }

    It "Get Edge Details" {
        [Array]$Edges = Get-NsxVcdEdge
        [Array]$EdgeDetails = Get-NsxVcdEdgeDetails -Id $($Edges.Id | Select-Object -First 1)
        $EdgeDetails.id | Should -Be $($Edges.Id | Select-Object -First 1)
        $EdgeDetails.Count | Should -BeGreaterThan 0
    }

    It "Get Edge Details with Pipe" {
        [Array]$EdgeDetails =  Get-NsxVcdEdge | Get-NsxVcdEdgeDetails
        $EdgeDetails.Count | Should -BeGreaterThan 0
    }

    It "Get Edge Firewall Rule" {
        [Array]$Edges = Get-NsxVcdEdge
        [Array]$EdgeFirewallRule = Get-NsxVcdEdgeFirewallRule -Id $($Edges.Id | Select-Object -First 1)
        $EdgeFirewallRule.Count | Should -BeGreaterThan 0
    }

    It "Get Edge Firewall Rule with Pipe" {
        [Array]$EdgeFirewallRule = Get-NsxVcdEdge | Get-NsxVcdEdgeFirewallRule
        $EdgeFirewallRule.Count | Should -BeGreaterThan 0
    }

    It "Get Edge Nat Rule with Pipe" {
        [Array]$EdgeNsxVcdEdgeNatRule = Get-NsxVcdEdge | Get-NsxVcdEdgeNatRule
        $EdgeNsxVcdEdgeNatRule.Count | Should -BeGreaterThan 0
    }
}
