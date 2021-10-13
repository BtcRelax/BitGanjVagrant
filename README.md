# BitGanjVargant
 
node1 - Web server: Apache + php

node2 - DB Server:mysql  Ver 15.1 Distrib 10.3.24-MariaDB, for Linux (x86_64) 

node3 - NGinx 

To debug PHP, use port mapping. For example:
ssh www -R 9004:localhost:9004 -N


# Windows 11 issue

1. Enter this command:
```bcdedit /set hypervisorlaunchtype off```

2. Some report this command was needed also:
```DISM /Online /Disable-Feature:Microsoft-Hyper-V```

3. Enter this command:
```shutdown -s -t 2```

Source: https://forums.virtualbox.org/viewtopic.php?f=25&t=97412