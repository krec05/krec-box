function Check-RunAsAdministrator {
    param([String]$VagrantPath)

    # get current user context
    $CurrentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())

    # check user is admin
    if ($CurrentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator))
    {
        Write-Host "Script is running with Administrator privileges!"
    }
    else
    {
        # create a new elevated process to start PowerShell
        $ElevatedProcess = New-Object System.Diagnostics.ProcessStartInfo "PowerShell";

        # specify the current script path and name as a parameter
        $ElevatedProcess.Arguments = "& '" + $Script:MyInvocation.MyCommand.Path + "' '$VagrantPath'"

        # set the process to elevated
        $ElevatedProcess.Verb = "runas"

        # start the new elevated process
        [System.Diagnostics.Process]::Start($ElevatedProcess)

        # exit from current process
        Exit
    }
}
# check if location parameter is given and set path for vagrant
$VagrantPath
if ($( $args.Count ) -lt 1)
{
    $VagrantPath = Get-Location
}
else
{
    $VagrantPath = $args[0]
}

# check if script is running as administrator, cause vagrant with provider hyper-v need to start as administrator
Check-RunAsAdministrator $VagrantPath

# go to vagrant path
Set-Location $VagrantPath

# start vagrant with provision
vagrant up --provision

# run vm gui
vmconnect.exe (Get-ComputerInfo).CSName KrecBox

Write-Host -NoNewLine 'Press any key to continue...';
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")