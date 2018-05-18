#
# Modulmanifest für das Modul "VMware-NSXvCD-Module"
#
# Generiert von: Markus
#
# Generiert am: 4/26/2018
#

@{

# Die diesem Manifest zugeordnete Skript- oder Binärmoduldatei.
# RootModule = 'VMware-NSXvCD-Module.psm1'

# Die Versionsnummer dieses Moduls
ModuleVersion = '0.11.0'

# ID zur eindeutigen Kennzeichnung dieses Moduls
GUID = 'f28410b0-eebf-4194-a647-c5e5337f5cd9'

# Autor dieses Moduls
Author = 'Markus Kraus'

# Unternehmen oder Hersteller dieses Moduls
CompanyName = 'mycloudrevolution.com'

# Urheberrechtserklärung für dieses Modul
Copyright = '(c) 2018 Markus Kraus.'

# Beschreibung der von diesem Modul bereitgestellten Funktionen
# Description = ''

# Die für dieses Modul mindestens erforderliche Version des Windows PowerShell-Moduls
# PowerShellVersion = ''

# Der Name des für dieses Modul erforderlichen Windows PowerShell-Hosts
# PowerShellHostName = ''

# Die für dieses Modul mindestens erforderliche Version des Windows PowerShell-Hosts
# PowerShellHostVersion = ''

# Die für dieses Modul mindestens erforderliche Microsoft .NET Framework-Version
# DotNetFrameworkVersion = ''

# Die für dieses Modul mindestens erforderliche Version der CLR (Common Language Runtime)
# CLRVersion = ''

# Die für dieses Modul erforderliche Prozessorarchitektur ("Keine", "X86", "Amd64").
# ProcessorArchitecture = ''

# Die Module, die vor dem Importieren dieses Moduls in die globale Umgebung geladen werden müssen
# RequiredModules = @()

# Die Assemblys, die vor dem Importieren dieses Moduls geladen werden müssen
# RequiredAssemblies = @()

# Die Skriptdateien (PS1-Dateien), die vor dem Importieren dieses Moduls in der Umgebung des Aufrufers ausgeführt werden.
# ScriptsToProcess = @()

# Die Typdateien (.ps1xml), die beim Importieren dieses Moduls geladen werden sollen
# TypesToProcess = @()

# Die Formatdateien (.ps1xml), die beim Importieren dieses Moduls geladen werden sollen
# FormatsToProcess = @()

# Die Module, die als geschachtelte Module des in "RootModule/ModuleToProcess" angegebenen Moduls importiert werden sollen.
NestedModules = @('functions\New-ApiConnection.psm1',
                'functions\Invoke-ApiCall.psm1',
                'functions\Get-NsxVcdEdge.psm1',
                'functions\Get-NsxVcdEdgeDetails.psm1',
                'functions\Get-NsxVcdEdgeFirewallRule.psm1',
                'functions\Get-NsxVcdEdgeFirewallRuleDetails.psm1',
                'functions\Get-NsxVcdEdgeFirewallRuleStats.psm1',
                'functions\Get-NsxVcdEdgeNatRule.psm1',
                'functions\Enable-NsxVcdDfw.psm1',
                'functions\Get-NsxVcdDfwRule.psm1'
                )

# Aus diesem Modul zu exportierende Funktionen
FunctionsToExport = 'New-ApiConnection', 'Invoke-ApiCall', 'Get-NsxVcdEdge', 'Get-NsxVcdEdgeDetails', 'Get-NsxVcdEdgeFirewallRule', 'Get-NsxVcdEdgeFirewallRuleDetails', 'Get-NsxVcdEdgeFirewallRuleStats', 'Get-NsxVcdEdgeNatRule', 'Enable-NsxVcdDfw', 'Get-NsxVcdDfwRule'

# Aus diesem Modul zu exportierende Cmdlets
#CmdletsToExport = '*'

# Die aus diesem Modul zu exportierenden Variablen
#VariablesToExport = '*'

# Aus diesem Modul zu exportierende Aliase
#AliasesToExport = '*'

# Aus diesem Modul zu exportierende DSC-Ressourcen
# DscResourcesToExport = @()

# Liste aller Module in diesem Modulpaket
# ModuleList = @()

# Liste aller Dateien in diesem Modulpaket
# FileList = @()

# Die privaten Daten, die an das in "RootModule/ModuleToProcess" angegebene Modul übergeben werden sollen. Diese können auch eine PSData-Hashtabelle mit zusätzlichen von PowerShell verwendeten Modulmetadaten enthalten.
PrivateData = @{

    PSData = @{

        # 'Tags' wurde auf das Modul angewendet und unterstützt die Modulermittlung in Onlinekatalogen.
        Tags = @('VMware', 'vCloud', 'NSX', 'vCloudDirector', 'Automation', 'EdgeGateway', 'DFW')

        # Eine URL zur Lizenz für dieses Modul.
        LicenseUri = 'https://github.com/mycloudrevolution/VMware-NSXvCD-Module/blob/master/LICENSE'

        # Eine URL zur Hauptwebsite für dieses Projekt.
        ProjectUri = 'https://github.com/mycloudrevolution/VMware-NSXvCD-Module'

        # Eine URL zu einem Symbol, das das Modul darstellt.
        # IconUri = ''

        # 'ReleaseNotes' des Moduls
        #ReleaseNotes = 'https://github.com/mycloudrevolution/VMware-NSXvCD-Module/blob/master/ReleaseNotes.md'

    } # Ende der PSData-Hashtabelle

} # Ende der PrivateData-Hashtabelle

# HelpInfo-URI dieses Moduls
HelpInfoURI = 'http://vmware-nsxvcd-module.readthedocs.io/en/latest/'

# Standardpräfix für Befehle, die aus diesem Modul exportiert werden. Das Standardpräfix kann mit "Import-Module -Prefix" überschrieben werden.
# DefaultCommandPrefix = ''

}


