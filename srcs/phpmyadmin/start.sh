#start
#php-fpm7 -R -F
#nginx -g 'daemon off;'

#!/bin/sh
/usr/bin/supervisord -c /etc/supervisord.conf
