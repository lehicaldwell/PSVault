<# 
.NAME
    Vault
#>
Import-Module Microsoft.PowerShell.SecretStore
Import-Module Microsoft.PowerShell.SecretManagement
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$PSVault                         = New-Object system.Windows.Forms.Form
$PSVault.ClientSize              = New-Object System.Drawing.Point(730,540)
$PSVault.text                    = "PSVault"
$PSVault.TopMost                 = $false
$PSVault.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#000000")

$Accounts                        = New-Object system.Windows.Forms.ListBox
$Accounts.text                   = "Accounts"
$Accounts.width                  = 305
$Accounts.height                 = 506
$Accounts.location               = New-Object System.Drawing.Point(9,10)
$Accounts.BackColor              = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")
$Accounts.ScrollAlwaysVisible    = $true

$UpdatePassword                 = New-Object system.Windows.Forms.TextBox
$UpdatePassword.multiline       = $false
$UpdatePassword.width           = 297
$UpdatePassword.height          = 20
$UpdatePassword.location        = New-Object System.Drawing.Point(327,215)
$UpdatePassword.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$UpdatePassword.BackColor       = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")

$Update                          = New-Object system.Windows.Forms.Button
$Update.text                     = "Update"
$Update.width                    = 60
$Update.height                   = 30
$Update.location                 = New-Object System.Drawing.Point(330,246)
$Update.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Update.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")

$CurrentPassword                 = New-Object system.Windows.Forms.TextBox
$CurrentPassword.multiline       = $false
$CurrentPassword.width           = 293
$CurrentPassword.height          = 20
$CurrentPassword.location        = New-Object System.Drawing.Point(332,17)
$CurrentPassword.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$CurrentPassword.BackColor       = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")

$Get                             = New-Object system.Windows.Forms.Button
$Get.text                        = "Get Current Password"
$Get.width                       = 167
$Get.height                      = 30
$Get.location                    = New-Object System.Drawing.Point(332,50)
$Get.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Get.ForeColor                   = [System.Drawing.ColorTranslator]::FromHtml("#000000")
$Get.BackColor                   = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")

$Remove                          = New-Object system.Windows.Forms.Button
$Remove.text                     = "Remove"
$Remove.width                    = 79
$Remove.height                   = 30
$Remove.location                 = New-Object System.Drawing.Point(627,50)
$Remove.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Remove.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")
$Remove.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#000000")

$CreateAccount                  = New-Object system.Windows.Forms.TextBox
$CreateAccount.multiline        = $false
$CreateAccount.width            = 298
$CreateAccount.height           = 20
$CreateAccount.location         = New-Object System.Drawing.Point(326,298)
$CreateAccount.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$CreateAccount.BackColor        = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")

$CreatePassword                 = New-Object system.Windows.Forms.TextBox
$CreatePassword.multiline       = $false
$CreatePassword.width           = 298
$CreatePassword.height          = 20
$CreatePassword.location        = New-Object System.Drawing.Point(326,322)
$CreatePassword.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$CreatePassword.BackColor       = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")

$AddAccount                      = New-Object system.Windows.Forms.Button
$AddAccount.text                 = "Create"
$AddAccount.width                = 60
$AddAccount.height               = 30
$AddAccount.location             = New-Object System.Drawing.Point(327,351)
$AddAccount.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$AddAccount.BackColor            = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")

$Exit                            = New-Object system.Windows.Forms.Button
$Exit.text                       = "Exit"
$Exit.width                      = 60
$Exit.height                     = 30
$Exit.location                   = New-Object System.Drawing.Point(646,486)
$Exit.Font                       = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Exit.ForeColor                  = [System.Drawing.ColorTranslator]::FromHtml("#d0021b")
$Exit.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")

$Generate1                       = New-Object system.Windows.Forms.Button
$Generate1.text                  = "Generate"
$Generate1.width                 = 92
$Generate1.height                = 30
$Generate1.location              = New-Object System.Drawing.Point(396,246)
$Generate1.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Generate1.BackColor             = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")

$Generate2                       = New-Object system.Windows.Forms.Button
$Generate2.text                  = "Generate"
$Generate2.width                 = 92
$Generate2.height                = 30
$Generate2.location              = New-Object System.Drawing.Point(396,352)
$Generate2.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Generate2.BackColor             = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")

$NumChars                        = New-Object system.Windows.Forms.TextBox
$NumChars.multiline              = $false
$NumChars.width                  = 38
$NumChars.height                 = 20
$NumChars.location               = New-Object System.Drawing.Point(499,251)
$NumChars.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Chars"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(544,251)
$Label1.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Label1.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "Account Name"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(631,298)
$Label2.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Label2.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "Password"
$Label3.AutoSize                 = $true
$Label3.width                    = 25
$Label3.height                   = 10
$Label3.location                 = New-Object System.Drawing.Point(631,322)
$Label3.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Label3.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")

$Label4                          = New-Object system.Windows.Forms.Label
$Label4.text                     = "New Password"
$Label4.AutoSize                 = $true
$Label4.width                    = 25
$Label4.height                   = 10
$Label4.location                 = New-Object System.Drawing.Point(631,215)
$Label4.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Label4.BackColor                = [System.Drawing.ColorTranslator]::FromHtml("#9b9b9b")

$PSVault.controls.AddRange(@($Accounts,$UpdatePassword,$Update,$Get,$Remove,$CreateAccount,$CreatePassword,$AddAccount,$Exit,$Generate1,$Generate2,$NumChars,$Label1,$CurrentPassword,$Label2,$Label3,$Label4))

$Accounts.Text = Get-AccountList
$Accounts.Add_KeyDown({  })
$Accounts.Add_KeyUp({  })
$Accounts.Add_MouseClick({  })
$Accounts.Add_Click({  })
$Get.Add_Click({ $GetOuput = Get-ServiceCreds -AccountName $Accounts.SelectedItem ; $CurrentPassword.Text = $GetOuput  })
$Remove.Add_Click({ Remove-ServiceCreds -AccountName $Accounts.SelectedItem })
$Update.Add_Click({ Set-ServiceCreds -AccountName $Accounts.SelectedItem -AccountSecret $UpdatePassword.Text})
$Generate1.Add_Click({ $NewString = New-RandomString  ; $UpdatePassword.Text = $NewString })
$Generate2.Add_Click({ $NewString = New-RandomString ; $CreatePassword.Text = $NewString  })
$AddAccount.Add_Click({ Add-ServiceCreds -AccountName $CreateAccount.Text -AccountSecret $CreatePassword.Text })
$Exit.Add_Click({$PSVault.Close()})

#region Logic 
#Remember to unlock the vault.

if ($PSVault -eq [System.Windows.Forms.DialogResult]::OK) {
    $SelectedAccout = $Accounts.SelectedItem
    $SelectedAccout
}
function Get-AccountList {
    $Listing = Get-SecretInfo -Vault LocalStore | Select-Object -ExpandProperty "Name"
    foreach ($L in $Listing) {
        [void] $Accounts.Items.Add("$L")
    }
}
function New-RandomString {
    Param (        
    )
    Begin {
        $GeneratedString = ""
        $i = 0
        $CharsBoxValue = $NumChars.Text
        if ($CharsBoxValue -ne "") {
            $CharsBoxValue = $NumChars.Text    
            $CharsInput = [int]$CharsBoxValue
            $CharactersLong = $CharsInput
        } else {
            $CharactersLong = 20
        }
    }
    Process {
        While ($i -ne $CharactersLong) {
            $i ++
            $Range = (32..126) | Get-Random | ForEach-Object {[char]$_}
            $GeneratedString = "$($GeneratedString)" + "$($Range)"
        }
    }
    End {
    Return $GeneratedString
    }
}
function Get-ServiceCreds {
    Param (
        [Parameter(Mandatory=$true)]
        [string]$AccountName
    )
    Begin {
        
    }
    Process {
        $TargetCred = Get-Secret -Name $AccountName -Vault "LocalStore" -AsPlainText 
    }
    End {
        Return $TargetCred
    }
}
function Set-ServiceCreds {
    Param (
        [Parameter(Mandatory=$true)]
        [string]$AccountName,
        [Parameter(Mandatory=$True)]
        [string]$AccountSecret
    )
    Begin { 
        
        #Check to make sure the account exists. 
        # If (!(AccountExists)) {Create-Popup}
    }
    Process {
        $DoesAccountExist = Get-Secret -Name $AccountName -Vault LocalStore -ErrorAction SilentlyContinue
        if (!($DoesAccountExist)) {
            # Create pop-up to state account does not exist. Use a function.
        }
        Set-Secret -Name $AccountName -Vault LocalStore -Secret $AccountSecret
        # Create pop-up to inform of success.
    }
    End {
        #Send Success or failure Based on If Account exists
        $UpdatePassword.text = ""
    }

}
function Add-ServiceCreds () {
    Param (
        [Parameter(Mandatory=$true)]
        [string]$AccountName,
        [Parameter(Mandatory=$True)]
        [string]$AccountSecret
    )
    Begin { 
        
    }
    Process {
        $DoesAccountExist = Get-Secret -Name $AccountName -Vault LocalStore -ErrorAction SilentlyContinue
        if ($DoesAccountExist) {
            #Add error pop-up
        }
        Set-Secret -Name $AccountName -Vault LocalStore -Secret $AccountSecret
    }
    End {
        $Accounts.Items.Clear()
        $CreateAccount.Text = ""
        $CreatePassword.Text = ""
        Get-AccountList
    }
}
function Remove-ServiceCreds {
    Param (
        [Parameter(Mandatory=$true)]
        [string]$AccountName
    )
    
    #$Verify = Confirm-Popup -Message "Are you sure you want to remove $ToRemove ? `n THIS CANNOT BE UNDONE!"
    if ($Verify){
        #Remove the account
    }
    # create popup to verify the user wants to remove this cred set.
    Remove-Secret -Name $AccountName -Vault LocalStore -Confirm:$false
    $Accounts.Items.Clear()
    Get-AccountList
}
function Unlock-PSVault {
    Param (
    )
    Begin {
        $CurrentUser = $Env:UserName
        $GetVaultPassword = Get-Credential -Message "Enter Vault Password" -UserName "$CurrentUser"
        $VaultPassword = $GetVaultPassword.Password
    }
    Process {
        Unlock-SecretVault -Name LocalStore -Password $VaultPassword
    }
    End {
        return $VaultPassword
    }
}
Unlock-PSVault
#Get-AccountList
[void] $PSVault.ShowDialog()
#endregion
