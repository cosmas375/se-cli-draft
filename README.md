# cli with completion

**Linux**
add to your ~/.bashrc following lines:
```
export PATH="$PATH:[path-to-repo]/bin"
source "[path-to-repo]/bin/se-completion.sh"
SE_FRONT_DIRECTORY=[absolute-path-to-repo]
```

**Mac**:
add to your ~/.zshrc following lines:
```
autoload bashcompinit
bashcompinit
autoload -Uz compinit && compinit
export PATH=$PATH:[path-to-repo]/bin
source "[path-to-repo]/bin/se-completion.sh"
SE_FRONT_DIRECTORY=[absolute-path-to-repo]
```
