#region ARRAYS
#strongly typed array
$array = "one", "two", "three" #Any sequence of comma separated values is an array
$array = 1, "two", (1/3) #Datatypes don’t need to be the same (but should)
$array = @(1, "two", (1/3)) #You can also explicitly create an array…

#Multi-dimensional array
$array[0]       # 1, 2 and 3 (seperate lines)
$array[1][2]    # six
$array[2]       # 7, but very bad programming 

#adding values
$array = "one","two","three"
$array
$array[0] # -> show first item

$array = 1,2,3     # 1,2,3
$array += 4        # 1,2,3,4
$array[4] = 5      # Next index: error
$array[7] = 6      # Skipping indexes: error
$array.Add(6)      # error 

#endregion

#string m
$string = "*="
$LongString = $string*20
$LongString
"$LongString"
" nr of characters: " + $LongString.length

#type operators
1000/3 -as [int] #display as integer (whole number)
1000/3 -is [int] #is this an integer?
(1000/3) -is [int]


#region IF ELSE SWITCH LOOP
$i = 11
if ($i -lt 10) {
    "smaller than 10"<# Action to perform if the condition is true #>
}
elseif ($i -lt 50) {
    "smaller than 50"<# Action when this condition is true #>
}
else {
    "larger than or equal to 50"
}

###switch statements
$i = 22
switch ($i) {
    1 {  #if $i is 1
        "one" #write one
    }
    5 {
        "five"
    }
    10 {
        "ten"
    }
    default {
        "default"
    }

}

###foreach loop
$procs = Get-Process
foreach($p in $procs){
    $p.ProcessName.ToUpper()
}

foreach($p in $procs){
    $p.Id.ToString()
}
#Combine them
foreach($p in $procs){
    ($p.ProcessName.ToUpper() + " " + $p.Id.ToString())
}

#get random number for var $i until $i is 15 or greater
$i = 0
while ($i -lt 15) {
    $i = Get-Random -Minimum 1 -Maximum 20
    Start-Sleep -Seconds 0.1
    Write-Host $i
}

#increase with +1 until $1 is 10 or higher
$i = 0
Do {
    $i++ #++ = +1 
    $i #write var value
} while ($i -lt 10) 

#for loop
#dotcomma: FOR ; WHILE ; DO # UNREADEABLE # MAKE READEABLE
$array = 1,2,3,'a','b','c'
for ($i = 0; $i -lt $array.Count; $i++) {
    $array[$i]
}

#readeable
$array = 1,2,3,'a','b','c'
$i = 0
while ($i -lt $array.Count) {
    $i++
    $i
}
#endregion