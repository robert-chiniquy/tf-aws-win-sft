<powershell>
# Install ScaleFT Server Tools
# TODO: enrollment tokens
$installer_url = "https://dist.scaleft.com/server-tools/windows/v1.9.2/ScaleFT-Server-Tools-1.9.2.msi"
$installer_path = [System.IO.Path]::ChangeExtension([System.IO.Path]::GetTempFileName(), ".msi")
(New-Object System.Net.WebClient).DownloadFile($installer_url, $installer_path)
Write-Output (Get-Item($installer_path))
msiexec.exe /qb /I $installer_path
</powershell>