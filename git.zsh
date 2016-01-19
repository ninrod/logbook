# showing what branch is tracking what remote
git branch -vv (doubly verbose)

### remote branch checkout.
# here 'remote_branch_name' doesn't exist locally and matches only one name on the remote
git checkout remote_branch_name
# or, as an alternative
git checkout -b localname origin/branchname

# seeing what changes are comming from upstream (diff)
git diff master origin/master
