#!/bin/bash

rsync -aAXv /* /tank/\!backup/storage/ --exclude={/tank/*,/downloads/*,/var/www/*,/var/www.ORIGINAL/*,/dev/*,/proc/*,/sys/*,/tmp/*,/run/*,/mnt/*,/media/*,/lost+found}
