dd if=/dev/zero of=/var/swap.file count=2048 bs=1M
chmod go= /var/swap.file
mkswap /var/swap.file
echo "/var/swap.file swap swap defaults 0 0" >> /etc/fstab
swapon -a
