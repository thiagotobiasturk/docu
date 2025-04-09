# Cambia estas variables con tu información
$serverName = "DESKTOP-5V0E01L"
$databaseName = "ReportServer_Automatico"
$sqlUser = "usuario_sql"
$sqlPassword = "contraseña123"

# Ruta de rsconfig.exe (ajusta la versión si usas otra)
$rsconfigPath = "C:\Program Files\Microsoft SQL Server\150\Tools\Binn\rsconfig.exe"

# Comando para configurar la conexión
Start-Process -FilePath $rsconfigPath -ArgumentList "-c -s $serverName -d $databaseName -a SQL -u $sqlUser -p $sqlPassword" -Wait
