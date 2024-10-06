


<#
Author: Samuel Valdez
Function: Install-ModuleIfNeeded

Description:
    Checks if a PowerShell module is installed and installs it if not already present.

Usage:
    1. Run the function:
        Install-ModuleIfNeeded -ModuleName "ModuleName"
    2. Specify the name of the module to check and install if necessary.

Parameters:
    - ModuleName (mandatory): The name of the PowerShell module to check and install if needed.

#>
function Install-ModuleIfNeeded {
    param (
        [string]$ModuleName
    )
    if (-not (Get-Module -ListAvailable -Name $ModuleName)) {
        try {
            Install-Module -Name $ModuleName -Scope CurrentUser -Force
            Write-Host "Module $ModuleName installed successfully." -ForegroundColor Green
        } catch {
            Write-Host "Failed to install module $ModuleName. Error: $_" -ForegroundColor Red
        }
    } else {
        Write-Host "Module $ModuleName is already installed." -ForegroundColor Yellow
    }
}


# Modules needed 

Install-ModuleIfNeeded -module 'Microsoft.Graph.Users' #https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/get-mguser?view=graph-powershell-1.0





<#
Author: Samuel Valdez
Function: Generate-Passphrase

Description:
    Generates a passphrase using a specified word list and number of words, appending a random number at the end.

Usage:
    1. Run the function:
        Generate-Passphrase -wordlist @("word1", "word2", "word3") -wordcount 4
    2. Provide a word list and specify the number of words to include in the passphrase.

Parameters:
    - wordlist (mandatory): An array of words to construct the passphrase.
    - wordcount (mandatory): Number of words to include in the passphrase.
    
#>
function Generate-Passphrase ([array]$wordlist, [int]$wordcount) {
    $passphrase = ""
    for ($i = 1; $i -le $wordcount; $i++){
        [int]$randomnumber = get-random -Minimum 0 -Maximum $wordlist.Length
        [string]$randomword = $wordlist[$randomnumber]
        [string]$randomnumber = get-random -Minimum 0 -Maximum 9
        $passphrase += [string]$randomword + $randomnumber + "-"
        
    }
    [string]$randomnumber = get-random -Minimum 0 -Maximum 1000
    $passphrase += $randomnumber
    return $passphrase.Trim()
}

# Word List
$wordsArray = @(
    "adventure", "beautiful", "discovery", "elephant", "fantastic",
    "happiness", "incredible", "joviality", "knowledge", "laughter",
    "magnitude", "notebooks", "opportunity", "perception", "questions",
    "realistic", "satisfaction", "tremendous", "understand", "victorious",
    "abundance", "celebrate", "diligence", "excellence", "fascinate",
    "generosity", "harmonious", "imagination", "journalism", "luminous",
    "meticulous", "narrative", "observation", "partnership", "questioning",
    "reflection", "serendipity", "transcendence", "universe", "vibrancy",
    "wonderful", "xylophone", "youthfulness", "zealously", "alternative",
    "courageous", "dedication", "enthusiasm", "foundation", "gratitude",
    "horizon", "inspiration", "juxtaposition", "knowledgeable", "legacy",
    "motivation", "nevertheless", "opulence", "possibility", "quintessential",
    "resilience", "sustainability", "transformation", "utilization", "vitality",
    "affectionate", "brilliance", "collaboration", "diversity", "evolution",
    "flexibility", "globalization", "humility", "innovation", "juxtapose",
    "leadership", "mindfulness", "nurturing", "originality", "perseverance",
    "quality", "respectful", "simplicity", "tenacity", "unwavering",
    "visionary", "wholesome", "yearning", "zealousness", "accountability",
    "breakthrough", "creativity", "determination", "engagement", "fellowship",
    "gratification", "humor", "integrity", "journey", "kindheartedness",
    "liberation", "motivation", "nobility", "opportunity", "patience"
)




