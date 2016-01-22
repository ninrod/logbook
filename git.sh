#### showing what branch is tracking what remote
git branch -vv (doubly verbose)

#### remote branch checkout.
# here 'remote_branch_name' doesn't exist locally and matches only one name on the remote
git checkout remote_branch_name
# or, as an alternative
git checkout -b localname origin/branchname
# or, even more verbose:
git branch --track experimental origin/experimental
git checkout experimental

#### seeing what changes are comming from upstream (diff)
git diff master..origin/master

#### git pretty format colors
git log --pretty=format:"%Credblah%Creset %Cgreenbluh%Creset %C(Yellow)lol%Creset %Cblueduh%Creset %C(magenta)lolmagenta%Creset %C(cyan)sdlkfjsdkfj%Creset %C(white)lollololzors%Creset"