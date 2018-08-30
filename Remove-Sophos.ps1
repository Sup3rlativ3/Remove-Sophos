#requires -runasadministrator

# Housekeeping
Clear-Host
$Counter = 0

# Welcome banner
Write-Host "******************************" -ForegroundColor Magenta
Write-Host "** Sophos uninstall script. **" -ForegroundColor Magenta
Write-Host "******************************`n`n`n" -ForegroundColor Magenta

# This is just some added logic to the uninstall process wrapped as a function.
Function Remove-Sophos
    {
        Param ($Application)
        # Get Sophos services and stop them.
        $Service = Get-Service | Where-Object {$_.Name -like "*Sophos*" -and $_.Status -like "Running"}
        try
            {
                Stop-Service $Service
            }
        catch
            {
                Write-Error "Unable to stop the service $($Service.Name)"
            }


                Write-Output "Attempting to uninstall $($Application.Name)"
                                try 
                                    {
                                        Uninstall-Package $Application.Name
                                        $Counter = 1
                                        Write-Verbose "Confirming that $($Application.Name) is uninstalled..."
                                        $Installed = Get-Package | Where-Object {$_.Name -like $Application.Name}
                                        While ($Installed -and $Counter -lt 4) 
                                            {
                                                Write-Warning "$($Application.Name) was not uninstalled, trying again... ($Counter)"
                                                Uninstall-Package $Application.Name
                                                $Counter++
                                            }

                                        If ($Installed)
                                            {
                                                Write-Error "ERROR: Unable to uninstall $($Application.Name) after $Counter times"
                                            }

                                        Else
                                            {
                                                Write-Output "Successfully removed $($Application.Name)"
                                                $Counter = 0
                                            }
                                    }
                                catch 
                                    {
                                        Write-Error "Error: Failed to remove $($Application.Name)"
                                    }
    } # End of the function

# Gather the installed Sophos components.
Write-Output "Gathering installed applications..."
$AppArray = Get-Package | Where-Object {$_.Name -like "*Sophos*"}

# Go through each of the apps in the order specified by Sophos and uninstall them.
ForEach ($App in $AppArray)
    {
        switch ($App.Name)
            {
                "Sophos Patch Agent" 
                    {
                        Remove-Sophos $App
                    }
                "Sophos Compliance Agent" 
                    {
                        Remove-Sophos $App
                    }
                "Sophos Network Threat Protection" 
                    {
                        Remove-Sophos $App
                    }
                "Sophos System Protection" 
                    {
                        Remove-Sophos $App
                    }
                "Sophos Client Firewall" 
                    {
                        Remove-Sophos $App
                    }
                "Sophos Anti-Virus" 
                    {
                        Remove-Sophos $App
                    }
                "Sophos Remote Management System" 
                    {
                        Remove-Sophos $App
                    }
                "Sophos Management Communication System" 
                    {
                        Remove-Sophos $App
                    }
                "Sophos AutoUpdate" 
                    {
                        Remove-Sophos $App
                    }
                "Sophos SafeGuard components" 
                    {
                        Remove-Sophos $App
                    }
                "Sophos Health" 
                    {
                        Remove-Sophos $App
                    }
                "Sophos Heartbeat" 
                    {
                        Remove-Sophos $App
                    }                
            }
    }

Write-Output "Attempting to uninstall Sophos Endpoint Defense"
        try {
            start-process "C:\Program Files\Sophos\Endpoint Defense\uninstall.exe"
            Write-Output "Successfully removed Sophos Endpoint Defense"
        }
        catch {
            Write-Error "Error: Failed to remove Sophos Endpoint Defense"
        }
