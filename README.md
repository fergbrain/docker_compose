# docker_compose

This is full listing of Docker containers I use.

## LXC
This is run on a single Docker LXC (within Proxmox):
*  4 CPUs
*  8 GB RAM
*  32 GB HDD

Data is primarily served via NFS (`/etc/fstab`):
```
jupiter.ferg.ferguson.pw:/srv/media     /mnt/media      nfs     rw,hard,intr,rsize=8192,wsize=8192,timeo=14,nolock      0       0
```

### LXC Settings:
* Image: Debian 11 Standard (via standard Proxmox Templates)

* Unprivileged Container: No
* Protection: No
* Features:
  * mount=nfs
  * nesting=1

## Special note(s):

### overseerr > transmission-openvpn

To enable openVPN, add the following to `/etc/pve/lxc/<idnum>.conf`:

```
lxc.cgroup2.devices.allow: c 10:200 rwm
lxc.hook.autodev: sh -c "modprobe tun; cd ${LXC_ROOTFS_MOUNT}/dev; mkdir net; mknod net/tun c 10 200; chmod 0666 net/tun"
```
Source: https://forum.proxmox.com/threads/pve-7-openvpn-lxc-problem-cannot-open-tun-tap-dev.103081/#post-443875
