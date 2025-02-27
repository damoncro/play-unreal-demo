[System.Environment]::SetEnvironmentVariable('JAVA_HOME','C:\Program Files\Android\Android Studio\jre')
[System.Environment]::SetEnvironmentVariable('ANDROID_HOME',"$env:LOCALAPPDATA\Android\Sdk")
[System.Environment]::SetEnvironmentVariable('NDKROOT',"$env:LOCALAPPDATA\Android\Sdk\ndk\23.0.7599858")

$curDir = (Get-Item .).FullName
cmd.exe /c "C:\Program Files\Epic Games\UE_4.27\Engine\Build\BatchFiles\RunUAT.bat" `
    BuildCookRun `
    -utf8output `
    -platform=Android `
    -cookflavor=ASTC `
    -clientconfig=Development `
    -serverconfig=Development `
    -project="$curDir/CronosPlayUnrealDemo.uproject" `
    -noP4 -nodebuginfo -allmaps `
    -cook -build -stage -prereqs -pak -archive `
    -archivedirectory="$curDir\archive"
