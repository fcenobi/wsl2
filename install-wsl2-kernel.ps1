#Per installare il kernel, eseguire quanto segue in una finestra di PowerShell, che imposterà anche 
#un'attività per verificare la presenza di kernel aggiornati e scaricarli automaticamente quando si 
#effettua l'accesso. Lo script deve essere eseguito solo una volta, quindi non è necessario salvarlo 
#in un file. Tutti i nuovi utenti aggiunti al sistema dopo la configurazione riceveranno anche la 
#configurazione delle istanze WSL2 per utilizzare il kernel personalizzato senza richiedere loro di 
#impostare le proprie attività pianificate.


Start-Process -Verb RunAs -FilePath powershell.exe -ArgumentList {
    Register-ScheduledJob -Name UpdateWSL2CustomKernel -Trigger (New-JobTrigger -AtLogOn) -ScheduledJobOption (New-ScheduledJobOption -RequireNetwork) -RunNow -ScriptBlock {
        function Get-IniContent ($filePath)
        {
            $ini = @{}
            switch -regex -file $FilePath
            {
                "^\[(.+)\]" # Section
                {
                    $section = $matches[1]
                    $ini[$section] = @{}
                    $CommentCount = 0
                }
                "^(;.*)$" # Comment
                {
                    $value = $matches[1]
                    $CommentCount = $CommentCount + 1
                    $name = "Comment" + $CommentCount
                    $ini[$section][$name] = $value
                }
                "(.+?)\s*=(.*)" # Key
                {
                    $name,$value = $matches[1..2]
                    $ini[$section][$name] = $value
                }
            }
            return $ini
        }

        function Out-IniFile($InputObject, $FilePath)
        {
            $outFile = New-Item -ItemType file -Path $Filepath -Force
            foreach ($i in $InputObject.keys)
            {
                if (!($($InputObject[$i].GetType().Name) -eq "Hashtable"))
                {
                    #No Sections
                    Add-Content -Path $outFile -Value "$i=$($InputObject[$i])"
                } else {
                    #Sections
                    Add-Content -Path $outFile -Value "[$i]"
                    Foreach ($j in ($InputObject[$i].keys | Sort-Object))
                    {
                        if ($j -match "^Comment[\d]+") {
                            Add-Content -Path $outFile -Value "$($InputObject[$i][$j])"
                        } else {
                            Add-Content -Path $outFile -Value "$j=$($InputObject[$i][$j])"
                        }

                    }
                    Add-Content -Path $outFile -Value ""
                }
            }
        }

        $latest = (Invoke-RestMethod -Uri https://api.github.com/repos/diddlesnaps/WSL2-Linux-Kernel/releases -UseBasicParsing)[0]
        $latest_version = [version]$latest.tag_name.Remove($latest.tag_name.IndexOf('-microsoft-snapd'))
        $current_version = [version](Get-Content $env:APPDATA/wsl2-custom-kernel-version.txt)
        if ($latest_version -gt $current_version) {
            $assets = $latest.assets | Where-Object {$_.name -Like '*-x86_64'}
            Invoke-WebRequest -Uri $assets.browser_download_url -OutFile $env:APPDATA/wsl2-custom-kernel
            if ($?) {
                Move-Item $env:APPDATA/wsl2-custom-kernel.tmp $env:APPDATA/wsl2-custom-kernel -Force
                $latest_version | Set-Content $env:APPDATA/wsl2-custom-kernel-version.txt
                $wslconfig = @{'wsl2'=@{'kernel'=''}}
                if (TestPath($env:USERPROFILE/.wslconfig)) {
                    $wslconfig = Get-IniContent $env:USERPROFILE/.wslconfig
                }
                $wslconfig.wsl2.kernel = "$env:APPDATA\wsl2-custom-kernel".Replace('\', '\\')
                Out-IniFile $wslconfig $env:USERPROFILE/.wslconfig
            }
        }
    }
}
