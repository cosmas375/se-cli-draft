# cli with completion

**Linux**
add to your ~/.bashrc following lines:
```
SE_FRONT_DIRECTORY=[absolute-path-to-repo]
export PATH="$PATH:$SE_FRONT_DIRECTORY/bin"
source "$SE_FRONT_DIRECTORY/bin/se-completion.sh"
```

**Mac**:
add to your ~/.zshrc following lines:
```
autoload bashcompinit
bashcompinit
autoload -Uz compinit && compinit
SE_FRONT_DIRECTORY=[absolute-path-to-repo]
export PATH=$PATH:$SE_FRONT_DIRECTORY/bin
source "$SE_FRONT_DIRECTORY/bin/se-completion.sh"
```
