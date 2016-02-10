Windows tricks
==============

### DOS shell tricks

* Create symbolic links for a target: `mklink {symlink} {real path}`
* recursively delete a directory: `rmdir {heregoesthedirname} /s`

### changing the user home folder

* change the user `home` folder location in windows: [See this article][1].
* user home folder key location: `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList`

### assorted tricks

* To export all putty configs: `regedit /e "%userprofile%\desktop\putty.reg" HKEY_CURRENT_USER\Software\SimonTatham`

[1]: <http://www.sevenforums.com/tutorials/87555-user-profile-change-default-location.html>
