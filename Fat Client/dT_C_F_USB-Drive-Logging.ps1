# Sleep for 3 seconds for the event to actually be available
start-sleep -seconds 3

# Get the most recent event with ID 105 ("Properties of user xxx were changed.")
$WindowsEvent=[xml]( get-winevent -FilterHashtable @{Logname='deviceTRUST/Admin';ID=105}  -MaxEvents 1| Foreach-Object{$_.ToXml()})

# Read all added properties from the selected event
$data = ($WindowsEvent.event.EventData | Select-Object -expand data | Where-Object{$_.name -eq "AddedProperties"}).'#text'

# Run script block if the content is not "None"
if($data -ne "None" -and $data -match "LOGICALDISK"){

    # Initialize loop variable
    $i=0

    # Run script block while data is found
    while($true){

        # If data is found in the selected line...
        if($data.Split([Environment]::NewLine)[$i]){

            # ... analyze the line for it's value type and store the value to the respective variable
            switch -wildcard ($data.Split([Environment]::NewLine)[$i].split("=")[0]){

                "*_PRODUCT_ID"{$ProductID = write-output $data.Split([Environment]::NewLine)[$i].split("=")[1]}
                "*_VENDOR_ID"{$VendorID = write-output $data.Split([Environment]::NewLine)[$i].split("=")[1]}
                "*_SERIALNUMBER"{$SerialNumber = write-output $data.Split([Environment]::NewLine)[$i].split("=")[1]}
                "*_TYPE"{$Type = write-output $data.Split([Environment]::NewLine)[$i].split("=")[1]}
                "*_BUSTYPE"{$BUSType = write-output $data.Split([Environment]::NewLine)[$i].split("=")[1]}

            }
    
        # If no data is found in the selected line...
        } else {

            # ... end script bock if no data is found
            break

        }

        # Count the loop variable up by 1
        $i++

    }

    # Configure the log folder
    $folder = "$env:SystemRoot\System32\LogFiles\deviceTRUST\"

    # Create the log folder if it does not exist
    if (!(Test-Path $folder)) {New-Item -Name "deviceTRUST" -Path "$env:SystemRoot\System32\LogFiles" -ItemType Directory}

    # Generate the log entry from the evaluated data
    $LogEntry = [ordered] @{
        "Date" = Get-Date
        "ComputerName" = $env:Computername
        "Product ID" = $ProductID
        "Vendor ID" = $VendorID
        "SerialNumber" = $SerialNumber
        "BUSType" = $BUSType
        "Type" = $Type
    }

    # Write the log entry to the csv log file
    New-Object PSObject -Property $LogEntry | Export-Csv -Path "$env:SystemRoot\System32\LogFiles\deviceTRUST\USBDeviceLog_$env:Computername.csv" -Append -NoTypeInformation

}