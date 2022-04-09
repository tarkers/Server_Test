Move-Item -Path C:\Users\bigsh\Desktop\Github\Server_Test\public\db.json C:\Users\bigsh\Desktop\Github\Server_Test\Back_up\db.json
Rename-Item -Path "C:\Users\bigsh\Desktop\Github\Server_Test\Back_up\db.json" -NewName "db_$(Get-Date -f MM-dd-hh-mm-ss).json"
# Move-Item -Path C:\Users\bigsh\Downloads\db.json C:\Users\bigsh\Desktop\Github\Server_Test\public\db.json
# new data db
node autoScratch.js
# #for github
git add .
git commit -m "$($(Get-Date -f MM-dd-hh-mm-ss))"
git push
# #for heroku
heroku git:remote -a dear-family-server
git add .
git commit -m "$($(Get-Date -f MM-dd-hh-mm-ss))"
git push --force heroku