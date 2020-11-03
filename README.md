# BitGanjVargant
 
node1 - Web server: Apache + php

node2 - DB Server:mysql  Ver 15.1 Distrib 10.3.24-MariaDB, for Linux (x86_64) 

node3 - NGinx 

To debug PHP, use port mapping. For example:
ssh www -R 9004:localhost:9004 -N