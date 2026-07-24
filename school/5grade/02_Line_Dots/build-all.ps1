$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ModulesDir = Join-Path $ScriptDir "modules"
$OutputDir = Join-Path (Join-Path $ScriptDir "output") "pdf"

$Modules = @(
    "M01_BasicGeometryObjects",
    "M02_SegmentMeasurement",
    "M03_LengthUnits",
    "M04_PointsOnSegment",
    "M05_BrokenLineAndPolygon",
    "M06_PolygonNamesAndDiagonals",
    "M07_EqualIntervals"
)

New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null

foreach ($Module in $Modules) {
    $ModuleDir = Join-Path $ModulesDir $Module
    $ModuleCode = $Module.Split("_")[0]

    & (Join-Path $ModuleDir "build-pdfs.ps1")
    if ($LASTEXITCODE -ne 0) {
        throw "Module build failed: $Module"
    }

    $ModuleOutputDir = Join-Path $ModuleDir "outputs"
    $ModulePdfs = @(Get-ChildItem -LiteralPath $ModuleOutputDir -Filter "$ModuleCode-*.pdf" -File)
    if ($ModulePdfs.Count -ne 12) {
        throw "Expected 12 PDFs for $ModuleCode, found $($ModulePdfs.Count)."
    }

    foreach ($Pdf in $ModulePdfs) {
        $OutputPdf = Join-Path $OutputDir $Pdf.Name
        Copy-Item -LiteralPath $Pdf.FullName -Destination $OutputPdf -Force
        Write-Host "Collected $OutputPdf"
    }
}

Write-Host "All 84 color and black-and-white PDFs built successfully."
