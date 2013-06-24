#!/bin/bash
zfsstat=`zpool status -x | awk '{print $4}'`

if [ $zfsstat != 'healthy' ]; then
     /bin/date > /tmp/zfs.stat
     echo >> /tmp/zfs.stat
     /bin/hostname >> /tmp/zfs.stat
     echo >> /tmp/zfs.stat
     /sbin/zpool status -x >> /tmp/zfs.stat
     cat /tmp/zfs.stat | /usr/bin/mail -s "`hostname`: ZFS zpool failure" acr@antoniocarlosribeiro.com
fi
