# bash
Serie of bash scripts

# Git
Ubuntu: in order to show the branch name in the prompt add the following in ~/.bashrc
```
# *** This has to be uncommented (?) ***
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

^
|
...
|
v

parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi

# *** Note that this section has to be raplaces ***
#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt
```

# ssh agent activation (for WSL)
https://unix.stackexchange.com/questions/351725/why-eval-the-output-of-ssh-agent
```
eval $(ssh-agent)
ssh-add <path_to_private_key>
```

# change file encodnig
```
file -i <filename> # gives current file enconding
iconv options -f <from-encoding> -t <to-encoding> inputfile(s) -o outpufile # convert file encoding
iconv -l # list all supported encodings
```
