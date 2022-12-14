# Scripting exercises
## Set-ProperCapitalisation

Write a function that takes a string as input. It returns that same string, but with the first letter after every space in upper case, and all other in lower case.

It would look something like this:

![Screenshot](img-Scripting_exercises/image1.png)


[Solution](Scripting_solutions/Set_ProperCapitalisation_1.ps1)
## IP-address to subnetmask

Given an IP-address in dotted decimal form, and a subnetmask in the same dotted decimal form, give the network address and broadcast address for that network. For example:

```PowerShell
$IP = "192.168.15.25"
$SNMask = "255.255.224.0"

Calculate-NetworkAddress -IP $ip -SubnetMask $SNMask
Calculate-BroadcastAddress -IP $ip -SubnetMask $SNMask
```

Would yield:

![Screenshot](img-Scripting_exercises/image2.png)

You can assume all the IP and subnetmask are always entered correctly, so no extra spaces and exactly three dots.


[Solution](Scripting_solutions/IP_address_to_subnetmask_1.ps1)
## Reformatting the subnetmask

In the old days we wrote a subnetmask in dotted decimal form, e.g. "255.255.240.0", but that has two disadvantages:
* It’s easy to write mistakes like "255.255.241.0"
* It’s not that nice when using IPv6 (or the F-key on all our keyboards will wear out very soon)

The alternative is, of course, using the /-notation, where the number behind the slash is the number of one’s in the subnetmask.

So let’s write a function to recalculate dotted decimal to the number-form, and vice versa.

The function takes two optional parameters. If the subnetmask is given, the numberform is calculated. If the subnetmask is not given, it is calculated based on the numberform.

Example:

![Screenshot](img-Scripting_exercises/image3.png)

An optional parameter looks like this:

```PowerShell
Function Recalculate-Subnetmask($Subnetmask = "",$Numberform = 0)
{
```


[Solution](Scripting_solutions/Reformatting_the_subnetmask_1.ps1)
## Extra time

An exam starts at 8:30. For most students it ends at 11:45. Some students are allowed to work a quarter of the time longer, because they have dyslexia.

When must the dyslexic students hand in their exam?


[Solution](Scripting_solutions/Extra_time_1.ps1)
## Convert-function

Ask the user for a number of degrees in Fahrenheit. Using a function, you calculate the temperature in Celsius. Show the result as xx °C.

The formula for degrees Celsius is (Fahrenheit -32)*5/9.


[Solution](Scripting_solutions/Convert_function_1.ps1)
## Removing files

Remove from a folder (and subfolder) all files that haven’t been written to in the last 10 days. Use the –WhatIf parameter.

You can store the path to the folder in a variable.

Try this in two ways; once with a script, and once in one large pipeline.


[Solution](Scripting_solutions/Removing_files_1.ps1)
## Subfoldersizes

Show for a folder the size of all subfolders.

Show the size in kilobytes, and start the name of the folder 20 characters later. For example:

![Screenshot](img-Scripting_exercises/image4.png)


[Solution](Scripting_solutions/Subfoldersizes_1.ps1)
## Kill overusing notepads

Start a lot of notepads. Copy and paste loads of text into some, to make them use additional CPU. Now kill all notepads that use more than the average amount of CPU.

Don’t fall into the trap of copying and pasting text. Create a ever increasing file using PowerShell:
* Write a short text and multiply it by 20. Store in a variable.
* Create a new file.
* Now do the following ten times:
	* Append the text-variable to the file
	* Open the file in notepad
	* Multiply the text-variable by 2

You may increase these numbers and explore the limits of your hard drive and system.


[Solution](Scripting_solutions/Kill_overusing_notepads_1.ps1)

Next up is killing the notepads that use most CPU. Try using a pipe-string first, and then using a foreach-loop.

[Solution](Scripting_solutions/Kill_overusing_notepads_2.ps1)

## Input sanitation - numbers

Write a function to sanitize input. Parameters are a message and optional minimum (default 1) and maximum (default 100) values. The function will only allow an integer between the minimum and maximum values.

Use this function to ask for the following values:
* The total amount of points.
* The number of courses the student took.

Calculate the average, and show as "The average result is XX,XX".


[Solution](Scripting_solutions/Input_sanitation___numbers_1.ps1)
## Input sanitation – text

When creating workstation accounts in the domain, the name of the new workstation always has to start with L (laptop), W (workstation) or S (server). Sometimes users forget this. Make they can’t anymore by writing a function.

There are two ways of solving this problem. First is with a function that has two parameters: the type of computer, and the name. Make sure the users of the function can choose between the three different computer types.

The function would look something like this:

![Screenshot](img-Scripting_exercises/image5.png)


[Solution](Scripting_solutions/Input_sanitation_–_text_1.ps1)

Second way is simply allowing you users to input a name, and checking whether it starts with an approved letter.

This function would work like this:

![Screenshot](img-Scripting_exercises/image6.png)

[Solution](Scripting_solutions/Input_sanitation_–_text_2.ps1)
## Subfoldersizes version 2

Reuse the script you wrote earlier, but update it so you can call it with parameters.

The input parameters are:
* -Dir	name of a folder (obligated)
* -File 	name of a (log)file (not obligated)

Also write some help-information, and make sure the script can be run verbosely, to show information on what is going on.


[Solution](Scripting_solutions/Subfoldersizes_version_2_1.ps1)
## Stream redirection

There’s an entire help-page about stream redirection in PowerShell:

https://technet.microsoft.com/en-us/library/hh847746.aspx

Redirection is useful when you want to redirect certain parts of the output to a file. If you want to redirect all the output, you can use "Out-File" or "Tee-Object".

"Certain parts" are any of the following options:
* Success output
* Errors
* Warning messages
* Verbose output
* Debug messages

These can be redirected with the old DOS-styled " > ". Do note that in PowerShell versions 1 and 2, only success output and errors were supported. The other options were included since v3.
* The "Get-Item" cmdlet can take an array as input. Get the following three items:
	* C:
	* Nothing
	* C:
* Redirect all output to a file (using >)
* Redirect only the success-output to a file
* Redirect only the errors to a file
* Redirect only the warnings to a file
* Redirect the errors to the success output
* Redirect the errors to the success output, and redirect this output to a file
* Use the parameter –ErrorVariable to redirect the error differently
* Store the result of the original Get-Item in a variable
* Redirect the error stream to the success-stream, and store this output in a variable


[Solution](Scripting_solutions/Stream_redirection_1.ps1)
## Countdown timer

Make a script that shows a countdown timer. It will run in 100 steps, each step will take 0.25 to 0.5 seconds (use Start-Sleep for this).

The first ten steps the text in the box will show "Just starting". Up to 25 the text is "Fully started", and then "Doing the work" until step 75. The final 25 steps are "Finishing up".


[Solution](Scripting_solutions/Countdown_timer_1.ps1)

## Replace special characters

Write a function that has a string as input, and returns the same string but with all special characters ("ë") replaced by normal characters ("e").

Hints:
- "-replace" is case insensitive. "-creplace" is case sensitive.
- The following two variables will prove rather usefull:

```PowerShell
$special = "ŠŽšžŸÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðñòóôõöùúûüýÿ"
$normal  = "SZszYAAAAAACEEEEIIIIDNOOOOOUUUUYaaaaaaceeeeiiiidnooooouuuuyy"
```

[Solution](Scripting_solutions/Replace_special_characters.ps1)


## Max length

Write a function that takes in two parameters (first name and last name) and a switch ("is teacher"). It generates an accountname that satisfies the following:

- if teacher:
	- "firstname.lastname"
	- if above is longer than 20 characters: "first letter of firstname.last name"
	- if still longer than 20 characters: take first 18 characters of last name
- if student:
	- the same, but "lastname.firstname"

[Solution](Scripting_solutions/Generate_account_name.ps1)


## Showing file sizes

The size of a file is stored in the length-property, and always shown as bytes. First, write a function that accepts a number of bytes as input, and outputs a nicely formatted size in kb, MB, GB, … whichever is more appropriate.


[Solution](Scripting_solutions/Showing_file_sizes_1.ps1)

That’s a start, but wouldn’t it be nice if this was the default output, and not the outcome of transition of the value through a function.

That is possible by updating the type data. You could read the page on the relevant cmdlet (https://technet.microsoft.com/en-us/library/hh849908.aspx), but Ed Wilson (https://blogs.technet.microsoft.com/heyscriptingguy/2012/10/16/easily-update-powershell-type-data-by-using-a-cmdlet/) also gives some background.


[Solution](Scripting_solutions/Showing_file_sizes_2.ps1)
## Saving credentials

There two ways of getting a credential from a user. The first is Get-Credential, but it’s also possible to have the user enter a password as secure string. This password can be saved, in an encrypted form, in a file.

Afterwards you can read the file to get the password. This means the script can be run by another user with a ‘common’ password that the user doesn’t have.

(This also means that if the other user knows what he is doing, he can use the file, and password, to login as the user he isn’t and do stuff he isn’t supposed to. But we’ll ignore this security risk for now.)
* Have the user enter a password with read-host, and save it in a variable
* Convert the securestring-variable to a form that can be saved in a file
* Write the converted form to a file

All this is only done once. The following command will be part of ‘the script that someone else will be running’.
* Save the username in a variable
* Read the password from the file
* Create a new "System.Management.Automation.PSCredential"-object
* Get a list of disk drives on another computer with the credentials.


[Solution](Scripting_solutions/Saving_credentials_1.ps1)

You can also store an entire credential in an XML-file. This has the advantage that whoever uses this credential doesn’t have to know the username.
* Have the user enter a credential
* Store the credential in an XML-file
* Load the credential from the XML-file
* Use the credential to attach a drive


[Solution](Scripting_solutions/Saving_credentials_2.ps1)

On a related note, your colleague made a file with his username and password in it. Read the file, and try to find the password.


[Solution](Scripting_solutions/Saving_credentials_3.ps1)


Better would be using the script documented here:


https://gist.github.com/davefunkel/415a4a09165b8a6027a297085bf812c5

And the following as well:

https://github.com/PSKeePass/PoShKeePass

## Create and show a list

In some scripts, user input is asked in the form of a list of items. The user then has to enter the number of one of the items in the list. A gridview would be a nice replacement for that type of selection. Create the following list:

![](img-Scripting_exercises/2018-09-19-15-44-39.png)

When a users chooses an option, you reply in kind. Note that you have to prevent the users from selecting multiple options, and make sure the code keeps on working when they click cancel, or close the box.

[Solution](Scripting_solutions/Create_and_show_list.ps1)

## Create random files

For the next exercise, we need two folders. Folder one has several files with a random name. Folder two has the same files, but also has some additional files.

In this exercise, we’ll create both folders.

Luckily, Hey Scripting Guy can tell us how to generate random strings (for the filenames):

https://blogs.technet.microsoft.com/heyscriptingguy/2015/11/05/generate-random-letters-with-powershell/

Let’s say the first folder has 20 files, and the second has those twenty and ten more.

The result should look like this (but with more folders):

![Screenshot](img-Scripting_exercises/image7.png)


[Solution](Scripting_solutions/Create_random_files_1.ps1)

## Files that are not in another folder

A dropfolder is used to drop cost declaration files. Normally you download them all, process them and delete the processed declarations from that folder. Last time you processed them however, you forgot to delete the processed declarations.

Now you want to avoid processing the same declaration twice. You could separate them based on the date on which they were created, but there is a very good reason why this doesn’t work in this case (but I forgot which it was).

So delete all files from a folder (called "FolderTwo") that are present in another folder (called "FolderOne"), but keep those files that don’t exist in the first folder.

[Solution](Scripting_solutions/Files_that_are_not_in_another_folder_1.ps1)

## The backupscript – the script

Write a script that does backups. It takes a csv with a number of folders and a destination as input. It then copies all the folders in the CSV to a subfolder in the destination. The CSV looks like the following:

![Screenshot](img-Scripting_exercises/image8.png)

Suppose I was to run this script on the 23th of May in 2017 with the above CSV and as destination "c:\tmp\Backup", the following folder would be created.

![Screenshot](img-Scripting_exercises/image9.png)

Note how a subfolder with the current date in the name is created. All existing folders in the CSV are copied, the non-existing are ignored.

Also, have the option to create a logfile. This logfile would look something like this.

![Screenshot](img-Scripting_exercises/image10.png)

Note how the date is shown in a convenient European style, and not in the annoying American style.

Finally, make sure you have a lot of verbose output…


[Solution](Scripting_solutions/The_backupscript_–_the_script_1.ps1)


