$status = Get-NetAdapter | Select-Object Status
# Write-Output $status

if ( $status -like '*Up*') {
    Write-Host 'has netork'
    Copy-Item -Path C:\Users\bigsh\Desktop\Github\Server_Test\public\db.json C:\Users\bigsh\Desktop\Github\Server_Test\Back_up\db.json
    Rename-Item -Path "C:\Users\bigsh\Desktop\Github\Server_Test\Back_up\db.json" -NewName "db_$(Get-Date -f MM-dd-hh-mm-ss).json"
    
    # new data db
    node autoScratch.js
    Move-Item -Path C:\Users\bigsh\Downloads\db.json C:\Users\bigsh\Desktop\Github\Server_Test\public\db.json
    # #for heroku
    heroku login
    $wshell = New-Object -ComObject wscript.shell;
    $wshell.SendKeys("{ENTER}")
    # $myshell.sendkeys("{ENTER}")
    heroku git:remote -a dear-family-server
    git add .
    git commit -m "$($(Get-Date -f MM-dd-hh-mm-ss))"
    git push --force heroku

}
else {
    Write-Host 'no network'
    $text = '{"error":"no network"}'
    Write-Output $text
    $text | ConvertTo-Json -depth 2 | Out-File "C:\Users\bigsh\Desktop\Github\Server_Test\Back_up\db_$(Get-Date -f MM-dd-hh-mm-ss)_noNet.json"
    # Out-File $text -FilePath "C:\Users\bigsh\Desktop\Github\Server_Test\db_$(Get-Date -f MM-dd-hh-mm-ss)_noNet.json"
}
# Copy-Item -Path C:\Users\bigsh\Desktop\Github\Server_Test\public\db.json C:\Users\bigsh\Desktop\Github\Server_Test\Back_up\db.json
# Rename-Item -Path "C:\Users\bigsh\Desktop\Github\Server_Test\Back_up\db.json" -NewName "db_$(Get-Date -f MM-dd-hh-mm-ss).json"
# Move-Item -Path C:\Users\bigsh\Downloads\db.json C:\Users\bigsh\Desktop\Github\Server_Test\public\db.json


# #for github
# git add .
# git commit -m "$($(Get-Date -f MM-dd-hh-mm-ss))"
# git push --force








# #for heroku
# heroku git:remote -a dear-family-server
# git add .
# git commit -m "$($(Get-Date -f MM-dd-hh-mm-ss))"
# git push --force heroku