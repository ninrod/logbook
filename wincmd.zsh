# export all putty configs.
regedit /e "%userprofile%\desktop\putty.reg" HKEY_CURRENT_USER\Software\SimonTatham

# create symbolic links for a target
mklink {symlink} {real path}

# recursively delete a directory
rmdir {heregoesthedirname} /s
