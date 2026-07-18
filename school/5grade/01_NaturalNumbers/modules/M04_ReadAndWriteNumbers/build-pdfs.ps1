$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$LatexDir = Join-Path $ScriptDir "Latex"
$OutputDir = Join-Path $ScriptDir "outputs"
$ModuleName = Split-Path $ScriptDir -Leaf
$ModuleCode = $ModuleName.Split("_")[0]

if (-not (Get-Command xelatex -ErrorAction SilentlyContinue)) {
    throw "xelatex is not installed or is not available in PATH."
}

if (-not (Test-Path -LiteralPath $LatexDir -PathType Container)) {
    throw "LaTeX directory not found: $LatexDir"
}

New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null

$MainFiles = @(
    Get-ChildItem -LiteralPath $LatexDir -Filter "main-*.tex" -File |
        Sort-Object Name
)

if ($MainFiles.Count -eq 0) {
    throw "No main-*.tex files found in $LatexDir"
}

Push-Location $LatexDir
try {
    foreach ($MainFile in $MainFiles) {
        & xelatex -interaction=nonstopmode -halt-on-error $MainFile.Name
        if ($LASTEXITCODE -ne 0) {
            throw "XeLaTeX failed while building $($MainFile.Name)"
        }

        $SourcePdf = [System.IO.Path]::ChangeExtension($MainFile.FullName, ".pdf")
        $Variant = $MainFile.BaseName -replace "^main-", ""
        $OutputPdf = Join-Path $OutputDir "$ModuleCode-$Variant.pdf"

        Copy-Item -LiteralPath $SourcePdf -Destination $OutputPdf -Force
        Write-Host "Built $OutputPdf"
    }
}
finally {
    Pop-Location
}

Write-Host "All $ModuleCode PDFs are in $OutputDir"

