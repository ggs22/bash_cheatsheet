# Ubuntu bash cheatsheet
General bash commands & customization

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
```
then to unmount
```bash
umount /media/usb_drive
```

## Create a bootable drive using dd
```bash
sudo dd bs=4M if=path-to-the-ISO of=/dev/sdX status=progress && sync
```

#### Windows
see [https://www.linuxbabe.com/ubuntu/easily-create-windows-10-bootable-usb-ubuntu](https://www.linuxbabe.com/ubuntu/easily-create-windows-10-bootable-usb-ubuntu)

#### Ubuntu
see [https://averagelinuxuser.com/make-a-bootable-usb-drive-in-linux/](https://averagelinuxuser.com/make-a-bootable-usb-drive-in-linux/)
dd is the program name.

bs=4M means to use a block size of 4M, so the system will read and write the data in chunks of 4M. This option is simply meant to speed up the process.

if specifies the source to read. Simply put, this is an ISO file of the Linux image you download from the Linux distribution website.

path-to-the-ISO - path to the ISO file. For example, ~/Downloads/archlinux.iso

of specified the destination or where to write this ISO file. In other words, it is your USB drive. This is the most important part of the command, If you do mistake here, you can screw up your whole system. So, be very-very careful.

/dev/sdX means the name assigned to a device by your Linux system. It is some kind of analogy of disks C, D, E in Windows systems.

status=progress is not necessary. However, it is helpful because it will show you the progress during the writing process. Without this option, nothing will be printed on the terminal screen.

sync is actually another command, not an option. Sync clears the cache. Thanks to the && signs it will be executed as a chain with dd. This will make sure that all the data is written to the flash drive and nothing is left in the cache.

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

## Activate WSL autocomplete
