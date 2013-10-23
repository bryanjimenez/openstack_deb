# first unmount any logical volumes (this may not be nessecary in gentoo but it can't hurt to run it)
umount <path to your logical volume>
# repeat for each logical volume you have

# then deactivate any logical volumes
lvchange -a n <path to your logical volume>
# repeat for each logical volume you have 
