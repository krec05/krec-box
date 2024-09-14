# Test whether the script was started as administrator or not.
function Test-Administrator
{
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    return (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

# Get the name of the base box from the Vagrantfile.
function Get-UsedBaseBox
{
    foreach ($vagrantfileLine in Get-Content .\Vagrantfile)
    {
        if ($vagrantfileLine -and $vagrantfileLine.Contains('config.vm.box = '))
        {
            return ($vagrantfileLine -split '"')[1]
        }
    }
}

# Check whether the base box already exists locally.
function Test-BaseBoxExists($baseBox)
{
    $vagrantBoxes = @(vagrant box list)
    foreach ($vbox in $vagrantBoxes)
    {
        if ( $vbox.Contains($baseBox))
        {
            return $true;
        }
    }
    return $false;
}

# Check whether the KrecBox was started successfully and save the log.
function Test-VagrantUpOutput($log)
{
    Write-Host 'Write log to vagrant.log'
    Remove-Item "vagrant.log"
    $log | Out-File -Append -FilePath "vagrant.log"

    if ( $log[-2].Contains("failed=0"))
    {
        # zero failure > exit
        Write-Host 'Start the KrecBox was successful ...'
    }
    else
    {
        # non zero failures > print log and stay
        foreach ($logItem in $log)
        {
            Write-Host $logItem
        }
        Write-Host '#####'
        Write-Host 'Starting the KrecBox was not successful. Please take a look at the vagrant.log file and press any key to continue...'
        $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }
}

# read base box name of local Vagrantfile
$baseBox = Get-UsedBaseBox
Write-Host "Used Base Box: $baseBox"

if (Test-BaseBoxExists $baseBox)
{
    # base box exists locally, run with provision
    Write-Host 'Starting with "vagrant up --provision"'
    $log = @(vagrant up --provision)
    Write-Host 'Finishing with "vagrant up --provision"'

    Test-VagrantUpOutput $log
}
else
{
    # base box do not exists locally, run without provision, but admin priviledge
    if (Test-Administrator)
    {
        Write-Host 'Starting with "vagrant up"'
        $log = @(vagrant up)
        Write-Host 'Finishing with "vagrant up"'

        Test-VagrantUpOutput $log
    }
    else
    {
        Write-Host '#####'
        Write-Host 'To start the KrecBox initially, the PowerShell script startKrecBox.ps1 must be started as administrator.'
        Write-Host -NoNewLine 'Press any key to continue...';
        $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }
}