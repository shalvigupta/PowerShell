$installerPath = $args[0]
$software = Get-WmiObject Win32_Product -Filter "Name like 'Notepad++'" | Select-Object -ExpandProperty Version
$installed = (Get-ItemProperty  $args[0]| Where { $_.DisplayName -contains $software }) -ne $null
$app = Get-WmiObject -Class Win32_Product | Where-Object { 
    $_.Name -match "Name like 'Notepad++'" 
}

     If(-Not $installed) {
	     Write-Host "'$software' is NOT installed.";
		 $app.Uninstall()
		 Start-Process -FilePath $args[0]
       } else {
	    Write-Host "'$software' is installed."
       }


