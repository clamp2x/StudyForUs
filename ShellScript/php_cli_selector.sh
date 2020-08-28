#!/bin/bash
 
# Copyright (C) 2020 Study For Us HOSTING (https://hosting.studyforus.com)
# Changing PHP cli version via jailkit for each users.
# This script is able to use only on ispconfig
# Version information : 0.1 (Proto type)
# License : The MIT License (MIT)


# 호스팅 정보 입력받기
echo -e "Enter Client number : "
read cn
echo -e "Enter Web number : "
read wn

# PHP 버전 선택
fMenu()
{
  echo "PHP cli version changer for ispconfig "
  echo ""
  echo "0. PHP 7.0"
  echo "1. PHP 7.1"
  echo "2. PHP 7.2"
  echo "3. PHP 7.3"
  echo "4. PHP 7.4"
}

while :
do
  fMenu
  echo ""
  echo ""
  echo -n "Select PHP version number : "
  read phpversion
  case "$phpversion" in
    "0" ) echo "0. PHP 7.0"
          php7.0
  esac
done


# php 버전이 설치 되어 있나 확인
if [ ! -f /usr/bin/$phpversion ]; then
  echo "There is not php version to change."
  echo "Start to copy php version to change."
  jk_init -c /etc/jailkit/jk_init.ini -f -k -j /var/www/clients/client1/web1 $phpversion
fi

# php altenative 버전 삭제
rm /var/www/client%cn/web$wn/etc/alternatives/php

# php 버전 변경
ln -s /usr/bin/$phpversion /var/www/client%cn/web$wn/etc/alternatives/php

# 완료.
echo "php cli version has been changed."
