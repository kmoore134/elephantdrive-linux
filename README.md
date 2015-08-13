FreeBSD 10.1-RELEASE - amd64

Template for creating iocage plugin images, which can be added to AppCafe index
for FreeNAS / PC-BSD.

To create a new cage, do the following:

1. Fork and rename this repo. I.E. freebsd-10.1-amd64 -> kmoore134/plexmediaserver-freebsd-10.1-amd64

2. Clone the repo to your local box

3. Install the packages you want into the repo

(As root)

```
# mount -t devfs devfs <repo>/dev
# cp /etc/resolv.conf <repo>/resolv.conf
# pkg -c <repo> install multimedia/plexmediaserver
# rm -rf <repo>/var/cache (To remove package cache files)
# umount <repo>/dev
```

Next you edit the following files:
 <repo>/etc/rc.conf.local  - To set various options for enabling services
 <repo>/pbicage/service-configure  - Follow example to set location of config page

At this point you can add/commit new files in <repo>/usr/local and push. 

To test your new plugin try the following:

```
# iocage pull <user>/<repo> tag=<nickname> ip4_addr="<NIC>|<IP4>/24"
# iocage start <nickname>
```

Once you have a working plugin, you can get it listed in the official AppCafe
repo by submitting a pull request here:

https://github.com/pbi-cages/pbicage-index

