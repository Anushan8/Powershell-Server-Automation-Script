# Import required modules
Import-Module ActiveDirectory

# Store user name into variables
$firstname = Read-Host -Prompt "Please enter your first name"
$lastname = Read-Host -Prompt "Please enter your last name"
$password = Read-Host -Prompt "Please enter the new password"

# Output user information
echo "`nYour full name is $firstname $lastname"
echo "Your new password is $password"

# Convert the password to a secure string
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force

# Define the user account's Distinguished Name (DN) or find it by UPN
$user = Get-ADUser -Filter {GivenName -eq $firstname -and Surname -eq $lastname}

# If user is found, reset password
if ($user) {
    Set-ADAccountPassword -Identity $user -NewPassword $securePassword -Reset
    echo "Password reset successfully for $firstname $lastname"
} else {
    echo "User not found!"
}
