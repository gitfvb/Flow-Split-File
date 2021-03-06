Function Count-Rows {
    
    param(
         [Parameter(Mandatory=$true)][string]$inputPath # file to split
        ,[Parameter(Mandatory=$false)][bool]$header = $true # file has a header?
    )

    # get the file object
    $file = Get-Item -Path $inputPath

    # initiate the streamreader
    $reader = New-Object System.IO.StreamReader($file.FullName, [System.Text.Encoding]::UTF8)

    # stream through the rows
    $i = 0
    while ( $reader.Peek() -ge 0 ) {
        $reader.ReadLine() > $null
        $i++
    }

    # close the streamreader
    $reader.Close()

    # subtract one, if there should be a header
    if ( $header ) {
        $i -= 1
    }

    # return the no of rows
    return [long]$i

}
