# Donwload, extract & move respective Ioncube Loader .so file accordingly
cd /tmp
sudo  wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
sudo  tar xzf ioncube_loaders_lin_x86-64.tar.gz
cd ioncube
if [ -e "ioncube_loader_lin_5.6.so" ]; then sudo cp -a ioncube_loader_lin_5.6.so /usr/lib/php/20131226/ioncube.so; fi
if [ -e "ioncube_loader_lin_7.0.so" ]; then sudo cp -a ioncube_loader_lin_7.0.so /usr/lib/php/20151012/ioncube.so; fi
if [ -e "ioncube_loader_lin_7.1.so" ]; then sudo cp -a ioncube_loader_lin_7.1.so /usr/lib/php/20160303/ioncube.so; fi
if [ -e "ioncube_loader_lin_7.2.so" ]; then sudo cp -a ioncube_loader_lin_7.2.so /usr/lib/php/20170718/ioncube.so; fi
if [ -e "ioncube_loader_lin_7.3.so" ]; then sudo cp -a ioncube_loader_lin_7.3.so /usr/lib/php/20180731/ioncube.so; fi
if [ -e "ioncube_loader_lin_7.4.so" ]; then sudo cp -a ioncube_loader_lin_7.4.so /usr/lib/php/20190902/ioncube.so; fi
if [ -e "ioncube_loader_lin_8.0.so" ]; then sudo cp -a ioncube_loader_lin_8.0.so /usr/lib/php/20200930/ioncube.so; fi
if [ -e "ioncube_loader_lin_8.1.so" ]; then sudo cp -a ioncube_loader_lin_8.1.so /usr/lib/php/20210902/ioncube.so; fi
if [ -e "ioncube_loader_lin_8.2.so" ]; then sudo cp -a ioncube_loader_lin_8.2.so /usr/lib/php/20220829/ioncube.so; fi

# Create ioncube.ini & copy it to respective php module folder
sudo  cat <<EOT >> ioncube.ini
; configuration for php ioncube module
; priority=10
zend_extension=ioncube.so
ioncube.enable=1
EOT
sudo  xargs -n 1 cp -v ioncube.ini<<<"/etc/php/5.6/mods-available/ /etc/php/7.0/mods-available/ /etc/php/7.1/mods-available/ /etc/php/7.2/mods-available/ /etc/php/7.3/mods-available/ /etc/php/7.4/mods-available/ /etc/php/8.0/mods-available/ /etc/php/8.1/mods-available/ /etc/php/8.2/mods-available/"

# Enable Ioncube Loader & restart all php-fpm
phpenmod ioncube
if [ $(dpkg-query -W -f='${Status}' php5.6-fpm 2>/dev/null | grep -c "ok installed") -eq 1 ]; then sudo service php5.6-fpm restart; fi
if [ $(dpkg-query -W -f='${Status}' php7.0-fpm 2>/dev/null | grep -c "ok installed") -eq 1 ]; then sudo service php7.0-fpm restart; fi
if [ $(dpkg-query -W -f='${Status}' php7.1-fpm 2>/dev/null | grep -c "ok installed") -eq 1 ]; then sudo service php7.1-fpm restart; fi
if [ $(dpkg-query -W -f='${Status}' php7.2-fpm 2>/dev/null | grep -c "ok installed") -eq 1 ]; then sudo service php7.2-fpm restart; fi
if [ $(dpkg-query -W -f='${Status}' php7.3-fpm 2>/dev/null | grep -c "ok installed") -eq 1 ]; then sudo service php7.3-fpm restart; fi
if [ $(dpkg-query -W -f='${Status}' php7.4-fpm 2>/dev/null | grep -c "ok installed") -eq 1 ]; then sudo service php7.4-fpm restart; fi
if [ $(dpkg-query -W -f='${Status}' php8.0-fpm 2>/dev/null | grep -c "ok installed") -eq 1 ]; then sudo service php8.0-fpm restart; fi
if [ $(dpkg-query -W -f='${Status}' php8.1-fpm 2>/dev/null | grep -c "ok installed") -eq 1 ]; then sudo service php8.1-fpm restart; fi
if [ $(dpkg-query -W -f='${Status}' php8.2-fpm 2>/dev/null | grep -c "ok installed") -eq 1 ]; then sudo service php8.2-fpm restart; fi
cd /root
