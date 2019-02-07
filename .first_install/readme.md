# First Installation of Arch Linux

***Note:*** These installation worked definitely for **UEFI** boot mode and should normally also work for **BIOS** boot mode, although I have not performed the latter myself. 

***Note:*** Although I do my best to keep those instructions up to date, the most up to date instructions will always be found on the arch wiki [installation guide](https://wiki.archlinux.org/index.php/Installation_guide).

## First Installation with bootable USB
* Download **the most recent** Arch Linux ISO [http://archlinux.org/download](http://archlinux.org/download) from a mirror **near you**, and create a USB flash drive.
* Start the computer using the USB drive
* Connect to the internet. A **wired** internet connection is definitely recommended. However, if this is not an option, type `wifi-menu` to select a wireless internet connection.
* Check your internet connection (e.g. `ping google.com`). Sometimes if you are one a work or university network, `ping` might not work. If you are sure you are connected to the internet though, you can proceed. 
* Set the clock right: `timedatectl set-ntp true`
* Check the boot mode: `ls /sys/firmware/efi/efivars`. If the directory does not exist, you are in traditional **BIOS** mode, else you are in **UEFI** mode. In the following, sections that are prepended with “**BIOS**” or “**UEFI**” should only be performed if you are in that mode.
* Check the partitions on your harddrive: `lsblk`. In this tutorial we assume `/dev/sda` is the disk to be partitioned.
* If the harddrive you want to install arch linux on is not emtpy: delete all partitions with `cfdisk`. Then reboot, as this ensures the partition tables will be updated.
* Check the hard drive partitions again with `lsblk` and create disk partitions with `cfdisk`. We will assume the hard drive to partition is at `/dev/sda`. If asked, select gpt partition table. Then
    * Create a first partition of `500M`. This will be used for the **UEFI** partition
    * Create a second partition of `8G`. This will be the swap partition.
    * Create a third partition of `30G`. This will be the root partition.
    * Create a fourth partition containing the rest of the disk space. This will be the home partition.
    * Finally, write the partition table to the hard drive and quit.
* Format the newly created partitions in the required format
    * Format the first partition:
        * **UEFI**: `mkfs.fat -F32 /dev/sda1`
        * **BIOS**: `mkfs.ext4 /dev/sda1`
    * Format the second partition as **SWAP**:
        * `mkswap /dev/sda2`
        * `swapon /dev/sda2`
    * Format the third partition as **EXT4**: `mkfs.ext4 /dev/sda3`
    * Format the fourth partition as **EXT4**: `mkfs.ext4 /dev/sda4`
* Mount the newly created partitions:
    * Mount root partition: `mount /dev/sda3 /mnt`
    * Mount home partition: 
        * `mkdir /mnt/home`
        * `mount /dev/sda4 /mnt/home`
    * **BIOS**: Mount boot partition: 
        * `mkdir /mnt/boot`
        * `mount /dev/sda1 /mnt/boot`
    * **BIOS**: Set the bootable flag on `/dev/sda1`
        * `cfdisk` -> `[ Type ]` -> `BIOS boot` -> `[ Write ]`
* Finally, install archlinux: `pacstrap -i /mnt base base-devel dialog`. When prompted choose all the default answers. We need dialog to have `wifi-menu` working after installation.
* Create fstab file: `genfstab -U /mnt >> /mnt/etc/fstab`
* Change root: `arch-chroot /mnt`
* Set the time zone: `ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime`
* Set the hardware clock: `hwclock --systohc`
* Set the locale:
    * edit `/etc/locale.gen` and uncomment the locale needed (e.g. `en_US.UTF-8 UTF-8` and `en_US.UTF-8 ISO`)
    * Generate the locales: `locale-gen`
    * Set your language `echo "LANG=en_US.UTF-8"  >> /etc/locale.conf`
* Set your hostname in `echo "<hostname>" >> /etc/hostname`
* Add matching entries to /etc/hosts
    * `127.0.0.1    localhost`
    * `::1          localhost`
    * `127.0.1.1    flaporte.private.ugent.be flaporte`
* Install networkmanager
    * `pacman -S networkmanager`
    * `systemctl enable NetworkManager` 
* **UEFI**: Install a bootloader
    * `pacman -S grub efibootmgr`
    * `mkdir /boot/efi`
    * `mount /dev/sda1 /boot/efi`
    * `grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi`
    * Generate config file for bootloader: `grub-mkconfig -o /boot/grub/grub.cfg`
    * Copy the generated config to a new folder:
        * `mkdir /boot/efi/EFI/BOOT`
        * `cp /boot/efi/EFI/GRUB/grubx64.efi /boot/efi/EFI/BOOT/BOOTX64.EFI`
    * Create a startup file:
        * `echo 'bcf boot add 1 fs0:\EFI\GRUB\grubx64.efi "bootloader"' > /boot/efi/startup.nsh`
* **BIOS** Install a bootloader
    * `pacman -S grub`
    * `grub-install --target=i386-pc /dev/sda
    * Generate config file for bootloader: `grub-mkconfig -o /boot/grub/grub.cfg`

* Create a root password: `passwd`
* Shutdown:
    * `exit`
    * `umount -R /mnt`
    * `shutdown now`
* Boot up into the newly setup root account

## Post Installation
The first thing to do after booting up into the root account is to make a new user and install the necessary packages:

* Create a new user: `useradd -m flaport`
* Create a password for the new user: `passwd flaport`
* Add `flaport` to the sudoers:
    * edit the sudoers file `visudo`
    * add the line `flaport ALL=(ALL) ALL`
* Optional: hide GRUB during boot (for single OS installations):
    * Update `/etc/default/grub` by adding (uncommenting) the following two lines:
        * `GRUB_TIMEOUT=0`
        * `GRUB_HIDDEN_TIMEOUT=0`
        * `GRUB_HIDDEN_TIMEOUT_QUIET=true`
    * Regenerate the grub config: `sudo grub-mkconfig -o /boot/grub/grub.cfg`
* Reboot and login as the newly created user
* Install git: `sudo pacman -S git`
* Download and install `arch_home`:
    * go to home folder: `cd ~`
    * the folder should still be empty apart from the hidden `.bash*` files. delete those: `rm .bash*`
    * initialize the home folder as an empty git repository: `git init .`
    * add this git repository (or your fork) as origin: `git remote add origin http://github.com/flaport/arch_home`
    * set up the master branch to track the master brach at origin: `git branch --set-upstream-to=origin/master master`
    * pull the repository: `git pull`
* Install the programs and packages: `source .first_install/first_install.sh`
