# ==============================================================================
# Open Typography Foundation — Docker Build & Push Automation
# Run as: .\build_and_push.ps1 -Tag "3.0.0"
# ==============================================================================

param(
    [string]$ImageName = "golamrabbiii/open-fonts",
    [string]$Tag = "3.0.0"
)

$ErrorActionPreference = "Stop"

Set-Location "$PSScriptRoot\.."

Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "  Building Docker Image: $ImageName:$Tag and :latest" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan

docker build -t "$ImageName`:$Tag" -t "$ImageName`:latest" .

Write-Host "`nTesting container locally..." -ForegroundColor Yellow
$containerId = docker run -d -p 8085:80 "$ImageName`:latest"
Start-Sleep -Seconds 3

$status = curl.exe -s -o $null -w "%{http_code}" http://localhost:8085/
if ($status -eq "200") {
    Write-Host "[OK] Container verified running and returning HTTP 200!" -ForegroundColor Green
} else {
    Write-Host "[WARN] Health check returned HTTP status: $status" -ForegroundColor Yellow
}
docker stop $containerId | Out-Null
docker rm $containerId | Out-Null

Write-Host "`nPushing to Docker Hub..." -ForegroundColor Yellow
docker push "$ImageName`:$Tag"
docker push "$ImageName`:latest"

Write-Host "`n✅ Successfully built and pushed $ImageName to Docker Hub!" -ForegroundColor Green
