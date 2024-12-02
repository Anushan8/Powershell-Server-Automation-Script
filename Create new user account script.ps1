#import required modules
import ActiveDirectory 


# Store user name into veriable 
$firstname = Read-Host -Prompt "Please entry your first name"
$lastname = read-host -Prompt "Please enter your last name" 
$password = read-host -Prompt "Please enter your password" 


#Output user information 
echo " "
echo "Your full name is $firstname $lastname" 
echo "Your password is $password" 

#Specify where to store user account
$OUpath = "OU=PowershellUsers,DC=mynet,DC=local"

#Convert the password secure string
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force

#Create new user account

New-ADUser -name "$firstname $lastname" -GivenName $firstname -Surname $lastname -UserPrincipalName "$firstname.$lastname" -Path $OUpath  -AccountPassword $securePassword -ChangePasswordAtLogon $True -Enabled $True 

