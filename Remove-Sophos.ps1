#requires -runasadministrator

Clear-Host

$Counter = 0
# Welcome banner
Write-Host "******************************" -ForegroundColor Magenta
Write-Host "** Sophos uninstall script. **" -ForegroundColor Magenta
Write-Host "******************************`n`n`n" -ForegroundColor Magenta
Write-Host "Informational messages are in Cyan" -ForegroundColor Cyan
Write-Host "Success messages are in Green" -ForegroundColor Green
Write-Host "Warning messages are in Yellow" -ForegroundColor Yellow
Write-Host "Error messages are in Red`n`n`n" -ForegroundColor Red

# Get a list of installed apps
Write-Host "Gathering installed applications..." -ForegroundColor Cyan
$Apps = Get-WmiObject win32_product

# Stop the Sophos AU service as advised by Sophos.
Write-Host "Stopping Sophos AutoUpdate Service" -ForegroundColor Cyan
try {
    Stop-Service -Name "Sophos AutoUpdate Service" -ErrorAction SilentlyContinue
    Write-Host "Successfully stopped the service`n" -ForegroundColor Green
}
catch {
    Write-Host "ERROR: Failed to stop the service.`n" -ForegroundColor Red
}

# Go through each of the apps in order and uninstall them.
ForEach ($App in $Apps)
    {
        switch ($App.Name)
            {
                "Sophos Patch Agent" 
                    {
                        Write-Host "Attempting to uninstall $($App.Name)" -ForegroundColor Cyan
                        try {
                            $App.Uninstall()
                            $Counter = 1
                            Write-Host "Confirming that the app is uninstalled..." -ForegroundColor Cyan
                            $Installed = Get-WmiObject win32_product | Where-Object {$_.Name -like $App.Name}
                            While ($Installed -and $Counter -lt 4) 
                                {
                                    Write-Host "App was not uninstalled, trying again... ($Counter)" -ForegroundColor Yellow
                                    $App.Uninstall()
                                    $Counter++
                                }

                            If ($Installed)
                                {
                                    Write-Host "ERROR: Unable to uninstall $App after $Counter times" -ForegroundColor Red
                                }

                            Write-Host "Successfully removed $($App.Name)" -ForegroundColor Green
                            $Counter =0
                        }
                        catch {
                            Write-Host "Error: Failed to remove $($App.Name)" -ForegroundColor Red
                        }
                    }
                "Sophos Compliance Agent" 
                {
                    Write-Host "Attempting to uninstall $($App.Name)" -ForegroundColor Cyan
                    try {
                        $App.Uninstall()
                        $Counter = 1
                        Write-Host "Confirming that the app is uninstalled..." -ForegroundColor Cyan
                        $Installed = Get-WmiObject win32_product | Where-Object {$_.Name -like $App.Name}
                        While ($Installed -and $Counter -lt 4) 
                            {
                                Write-Host "App was not uninstalled, trying again... ($Counter)" -ForegroundColor Yellow
                                $App.Uninstall()
                                $Counter++
                            }

                        If ($Installed)
                            {
                                Write-Host "ERROR: Unable to uninstall $App after $Counter times" -ForegroundColor Red
                            }

                        Write-Host "Successfully removed $($App.Name)" -ForegroundColor Green
                        $Counter =0
                    }
                    catch {
                        Write-Host "Error: Failed to remove $($App.Name)" -ForegroundColor Red
                    }
                }
                "Sophos Network Threat Protection" 
                {
                    Write-Host "Attempting to uninstall $($App.Name)" -ForegroundColor Cyan
                    try {
                        $App.Uninstall()
                        $Counter = 1
                        Write-Host "Confirming that the app is uninstalled..." -ForegroundColor Cyan
                        $Installed = Get-WmiObject win32_product | Where-Object {$_.Name -like $App.Name}
                        While ($Installed -and $Counter -lt 4) 
                            {
                                Write-Host "App was not uninstalled, trying again... ($Counter)" -ForegroundColor Yellow
                                $App.Uninstall()
                                $Counter++
                            }

                        If ($Installed)
                            {
                                Write-Host "ERROR: Unable to uninstall $App after $Counter times" -ForegroundColor Red
                            }

                        Write-Host "Successfully removed $($App.Name)" -ForegroundColor Green
                        $Counter =0
                    }
                    catch {
                        Write-Host "Error: Failed to remove $($App.Name)" -ForegroundColor Red
                    }
                }
                "Sophos System Protection" 
                {
                    Write-Host "Attempting to uninstall $($App.Name)" -ForegroundColor Cyan
                    try {
                        $App.Uninstall()
                        $Counter = 1
                        Write-Host "Confirming that the app is uninstalled..." -ForegroundColor Cyan
                        $Installed = Get-WmiObject win32_product | Where-Object {$_.Name -like $App.Name}
                        While ($Installed -and $Counter -lt 4) 
                            {
                                Write-Host "App was not uninstalled, trying again... ($Counter)" -ForegroundColor Yellow
                                $App.Uninstall()
                                $Counter++
                            }

                        If ($Installed)
                            {
                                Write-Host "ERROR: Unable to uninstall $App after $Counter times" -ForegroundColor Red
                            }

                        Write-Host "Successfully removed $($App.Name)" -ForegroundColor Green
                        $Counter =0
                    }
                    catch {
                        Write-Host "Error: Failed to remove $($App.Name)" -ForegroundColor Red
                    }
                }
                "Sophos Client Firewall" 
                {
                    Write-Host "Attempting to uninstall $($App.Name)" -ForegroundColor Cyan
                    try {
                        $App.Uninstall()
                        $Counter = 1
                        Write-Host "Confirming that the app is uninstalled..." -ForegroundColor Cyan
                        $Installed = Get-WmiObject win32_product | Where-Object {$_.Name -like $App.Name}
                        While ($Installed -and $Counter -lt 4) 
                            {
                                Write-Host "App was not uninstalled, trying again... ($Counter)" -ForegroundColor Yellow
                                $App.Uninstall()
                                $Counter++
                            }

                        If ($Installed)
                            {
                                Write-Host "ERROR: Unable to uninstall $App after $Counter times" -ForegroundColor Red
                            }

                        Write-Host "Successfully removed $($App.Name)" -ForegroundColor Green
                        $Counter =0
                    }
                    catch {
                        Write-Host "Error: Failed to remove $($App.Name)" -ForegroundColor Red
                    }
                }
                "Sophos Anti-Virus" 
                {
                    Write-Host "Attempting to uninstall $($App.Name)" -ForegroundColor Cyan
                    try {
                        $App.Uninstall()
                        $Counter = 1
                        Write-Host "Confirming that the app is uninstalled..." -ForegroundColor Cyan
                        $Installed = Get-WmiObject win32_product | Where-Object {$_.Name -like $App.Name}
                        While ($Installed -and $Counter -lt 4) 
                            {
                                Write-Host "App was not uninstalled, trying again... ($Counter)" -ForegroundColor Yellow
                                $App.Uninstall()
                                $Counter++
                            }

                        If ($Installed)
                            {
                                Write-Host "ERROR: Unable to uninstall $App after $Counter times" -ForegroundColor Red
                            }

                        Write-Host "Successfully removed $($App.Name)" -ForegroundColor Green
                        $Counter =0
                    }
                    catch {
                        Write-Host "Error: Failed to remove $($App.Name)" -ForegroundColor Red
                    }
                }
                "Sophos Remote Management System" 
                {
                    Write-Host "Attempting to uninstall $($App.Name)" -ForegroundColor Cyan
                    try {
                        $App.Uninstall()
                        $Counter = 1
                        Write-Host "Confirming that the app is uninstalled..." -ForegroundColor Cyan
                        $Installed = Get-WmiObject win32_product | Where-Object {$_.Name -like $App.Name}
                        While ($Installed -and $Counter -lt 4) 
                            {
                                Write-Host "App was not uninstalled, trying again... ($Counter)" -ForegroundColor Yellow
                                $App.Uninstall()
                                $Counter++
                            }

                        If ($Installed)
                            {
                                Write-Host "ERROR: Unable to uninstall $App after $Counter times" -ForegroundColor Red
                            }

                        Write-Host "Successfully removed $($App.Name)" -ForegroundColor Green
                        $Counter =0
                    }
                    catch {
                        Write-Host "Error: Failed to remove $($App.Name)" -ForegroundColor Red
                    }
                }
                "Sophos Management Communication System" 
                {
                    Write-Host "Attempting to uninstall $($App.Name)" -ForegroundColor Cyan
                    try {
                        $App.Uninstall()
                        $Counter = 1
                        Write-Host "Confirming that the app is uninstalled..." -ForegroundColor Cyan
                        $Installed = Get-WmiObject win32_product | Where-Object {$_.Name -like $App.Name}
                        While ($Installed -and $Counter -lt 4) 
                            {
                                Write-Host "App was not uninstalled, trying again... ($Counter)" -ForegroundColor Yellow
                                $App.Uninstall()
                                $Counter++
                            }

                        If ($Installed)
                            {
                                Write-Host "ERROR: Unable to uninstall $App after $Counter times" -ForegroundColor Red
                            }

                        Write-Host "Successfully removed $($App.Name)" -ForegroundColor Green
                        $Counter =0
                    }
                    catch {
                        Write-Host "Error: Failed to remove $($App.Name)" -ForegroundColor Red
                    }
                }
                "Sophos AutoUpdate" 
                {
                    Write-Host "Attempting to uninstall $($App.Name)" -ForegroundColor Cyan
                    try {
                        $App.Uninstall()
                        $Counter = 1
                        Write-Host "Confirming that the app is uninstalled..." -ForegroundColor Cyan
                        $Installed = Get-WmiObject win32_product | Where-Object {$_.Name -like $App.Name}
                        While ($Installed -and $Counter -lt 4) 
                            {
                                Write-Host "App was not uninstalled, trying again... ($Counter)" -ForegroundColor Yellow
                                $App.Uninstall()
                                $Counter++
                            }

                        If ($Installed)
                            {
                                Write-Host "ERROR: Unable to uninstall $App after $Counter times" -ForegroundColor Red
                            }

                        Write-Host "Successfully removed $($App.Name)" -ForegroundColor Green
                        $Counter =0
                    }
                    catch {
                        Write-Host "Error: Failed to remove $($App.Name)" -ForegroundColor Red
                    }
                }
                "Sophos SafeGuard components" 
                {
                    Write-Host "Attempting to uninstall $($App.Name)" -ForegroundColor Cyan
                    try {
                        $App.Uninstall()
                        $Counter = 1
                        Write-Host "Confirming that the app is uninstalled..." -ForegroundColor Cyan
                        $Installed = Get-WmiObject win32_product | Where-Object {$_.Name -like $App.Name}
                        While ($Installed -and $Counter -lt 4) 
                            {
                                Write-Host "App was not uninstalled, trying again... ($Counter)" -ForegroundColor Yellow
                                $App.Uninstall()
                                $Counter++
                            }

                        If ($Installed)
                            {
                                Write-Host "ERROR: Unable to uninstall $App after $Counter times" -ForegroundColor Red
                            }

                        Write-Host "Successfully removed $($App.Name)" -ForegroundColor Green
                        $Counter =0
                    }
                    catch {
                        Write-Host "Error: Failed to remove $($App.Name)" -ForegroundColor Red
                    }
                }
                "Sophos Health" 
                {
                    Write-Host "Attempting to uninstall $($App.Name)" -ForegroundColor Cyan
                    try {
                        $App.Uninstall()
                        $Counter = 1
                        Write-Host "Confirming that the app is uninstalled..." -ForegroundColor Cyan
                        $Installed = Get-WmiObject win32_product | Where-Object {$_.Name -like $App.Name}
                        While ($Installed -and $Counter -lt 4) 
                            {
                                Write-Host "App was not uninstalled, trying again... ($Counter)" -ForegroundColor Yellow
                                $App.Uninstall()
                                $Counter++
                            }

                        If ($Installed)
                            {
                                Write-Host "ERROR: Unable to uninstall $App after $Counter times" -ForegroundColor Red
                            }

                        Write-Host "Successfully removed $($App.Name)" -ForegroundColor Green
                        $Counter =0
                    }
                    catch {
                        Write-Host "Error: Failed to remove $($App.Name)" -ForegroundColor Red
                    }
                }
                "Sophos Heartbeat" 
                {
                    Write-Host "Attempting to uninstall $($App.Name)" -ForegroundColor Cyan
                    try {
                        $App.Uninstall()
                        $Counter = 1
                        Write-Host "Confirming that the app is uninstalled..." -ForegroundColor Cyan
                        $Installed = Get-WmiObject win32_product | Where-Object {$_.Name -like $App.Name}
                        While ($Installed -and $Counter -lt 4) 
                            {
                                Write-Host "App was not uninstalled, trying again... ($Counter)" -ForegroundColor Yellow
                                $App.Uninstall()
                                $Counter++
                            }

                        If ($Installed)
                            {
                                Write-Host "ERROR: Unable to uninstall $App after $Counter times" -ForegroundColor Red
                            }

                        Write-Host "Successfully removed $($App.Name)" -ForegroundColor Green
                        $Counter =0
                    }
                    catch {
                        Write-Host "Error: Failed to remove $($App.Name)" -ForegroundColor Red
                    }
                }                
            }
    }

Write-Host "Attempting to uninstall Sophos Endpoint Defense" -ForegroundColor Cyan
        try {
            start-process "C:\Program Files\Sophos\Endpoint Defense\uninstall.exe"
            Write-Host "Successfully removed Sophos Endpoint Defense" -ForegroundColor Green
        }
        catch {
            Write-Host "Error: Failed to remove Sophos Endpoint Defense" -ForegroundColor Red
        }
