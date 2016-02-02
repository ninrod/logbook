Windows tricks
==============

### change the user `home` folder location in windows

* [See this article][1]. 
* `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList`

### export all putty configs.

```bat
regedit /e "%userprofile%\desktop\putty.reg" HKEY_CURRENT_USER\Software\SimonTatham
```

### create symbolic links for a target

```bat
mklink {symlink} {real path}
```

### recursively delete a directory

```bat
rmdir {heregoesthedirname} /s
```


[1]: <http://www.sevenforums.com/tutorials/87555-user-profile-change-default-location.html>
