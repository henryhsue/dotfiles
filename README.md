My dotfiles:

* do not git checkout in this directory without first saving changes
* this directory contains original files linked to from ~/. 
* keep hhenry/.vimrc smaller for remotes

Requirements when starting on a new machine:

```
mkdir -p ~/Personal
mkdir -p ~/Work
```

Note: to remove ssh default, must remove the following from global ~/.gitconfig temporarily. There probably exists a better solution somewhere.

```
url.git@github.com:.insteadof https://github.com/
```

Note: using different gitconfig for work and personal
