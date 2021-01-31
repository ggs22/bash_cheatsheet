# Ubuntu bash cheatsheet
General bash commands

## Mount a usb drive
list all drives
```bash
sudo lsblk
```

output:
find the usb drive (check before and after plugging the usb drive if needed)
```bash
sda      8:0    0 931.5G  0 disk
├─sda1   8:1    0    37M  0 part /boot/efi
└─sda2   8:2    0 931.5G  0 part /
sdb      8:16   0 931.5G  0 disk
└─sdb1   8:17   0 931.5G  0 part # <--- !
sr0     11:0    1  1024M  0 rom
```

then you can mount it using:
```bash
mount -t ntfs /dev/sdb1 /media/usb_drive

#then to unmount
umount /media/usb_drive
```

## Git
Ubuntu: in order to show the branch name in the prompt add the following in ~/.bashrc
```bash
parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi

```

...and comment out the following:

```bash
# *** Note that this section has to be replaces ***
#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt
```

## ssh agent activation
https://unix.stackexchange.com/questions/351725/why-eval-the-output-of-ssh-agent
```bash
eval $(ssh-agent)
ssh-add <path_to_private_key>

# force the host fingerprint in the known hosts file (caution, be sure to trust the host)
ssh-keyscan -t <type> <hostname.com> >> ~/.ssh/known_hosts
```

## change file encoding
```bash
file -i <filename> # gives current file encoding
iconv options -f <from-encoding> -t <to-encoding> inputfile(s) -o outpufile # convert file encoding
iconv -l # list all supported encodings
```
