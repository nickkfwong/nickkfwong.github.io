---
layout: post
title: "Notes: Powershell Cheatsheet"
date: "2020-03-06 16:36:21 +0800"
categories: notes cheatsheet powershell
---
### Process
  ```powershell
  # List Process #
  Get-Process | where { $_.ProcessName -match "pattern" }

  # Kill Process #
  Get-Process | where { $_.ProcessName -match "pattern" } | kill
  ```

## File
##### List Files
  ```powershell
  Get-ChildItem -Recurse -File -Include "pattern"
  ```
##### List Files by last write time
  ```Powershell
  Get-ChildItem | sort LastWriteTime -Descending
  ```
##### Remove Files - Keep 10 last updated
  ```Powershell
  Get-ChildItem | sort LastWriteTime -Descending | select -Skip 10 | Remove-Item -Force
  ```

#### Rename Files
  ```powershell
  Get-ChildItem -Recurse -File -Include "pattern" | Rename-Item -NewName { "$($_.Name).backup.$(Get-Date -Format 'yyyyMMdd')" }
  ```

###### Move Files
  ```powershell
  # Move from old_path to new_path #
  Move-Item -Path "old_location" -Destination "new_location"

  # Move files out of sub-directories #
  Get-ChildItem -Directory | Get-ChildItem -Recurse -Include *.mp4,*.avi,*.wmv | Move-Item . -Force
  ```

###### Copy Files
  ```powershell
  Copy-Item -Path "from_location" -Destination ${target_location}
  ```

#### Remove Directory
  ```
  Get-ChildItem -Directory | where { (Get-ChildItem $_ -Recurse | measure -Property Length -Sum -ErrorAction SilentlyContinue).Sum -LT 1000 }
  ```

###### Test Files
  ```powershell
  Test-Path "path"
  ```

###### Count File
  ```powershell
  Get-ChildItem | measure | select count

  Count
  -----
  177
  ```

#### Remove Directory
```
Get-ChildItem -Directory | where { (Get-ChildItem $_ -Recurse | measure -Property Length -Sum -ErrorAction SilentlyContinue).Sum -LT 1000 }
```

###### Get Directory Size #
- To measure size of each files, use `-Property Length`
- To sum all length, use `-Sum`

  ```powershell
  Get-ChildItem -Recurse | measure -Property Length -Sum

  Count             : 685
  Average           :
  Sum               : 350242145590
  Maximum           :
  Minimum           :
  StandardDeviation :
  Property          : Length
  ```

###### Get Directory Size in MB #
  ```powershell
  (Get-ChildItem -Recurse | measure -Property Length -Sum | select sum).Sum / 1MB

  334016.938772202
  ```

# Basics
- string/property

-- $_.prop
  ```powershell
  Get-Process | select -First 1 { $_.Id }

  17616
  ```

-- "$\_.prop" => concat of $\_.ToString() + '.prop'
  ```powershell
  Get-Process | select -First 1 { "$_.Id" }

  System.Diagnostics.Process (Adobe CEF Helper).Id
  ```

-- "$( $_.prop )" => evaluate expression within a double-quote string using $()
  ```powershell
  Get-Process | select -First 1 { "$($_.Id).TEXT.$(Get-Date -Format 'yyyyMMdd')" }

  17616.TEXT.20200312
  ```

- boolean
  ```powershell
  > "True"
  True

  > $True
  True

  > [bool]::TrueString
  True

  > "False" -eq [bool]::FalseString
  False
  ```


- Cast
  ```powershell
  [type] $object
  ```

- Function
- Invoke function from string
  ```
  &"function_name" arg1 arg2
  ```
- Invoke function
  ```
  function_name arg1 arg2
  ```

- Regex
  ```powershell
  "string" -match "pattern";
  $Matches.0 // [Hashtable]
  ```

- Web
  ```powershell
  # HTTP-GET #
  Invoke-RestMethod -Uri "uri" -Method GET

  # HTTP-POST #
  Invoke-RestMethod -Uri "uri" -Method POST

  # Upload file #
  Invoke-RestMethod -Uri "uri" -ContentType application/zip -InFile "filepath" -Method POST

  ```

- If
  ```powershell
  # If-Not #
  if(condition)
  if(-Not (condition))

  ```


  to read:
  http://woshub.com/powershell-get-folder-sizes/
