#!/bin/sh 
echo "1. adopt agent configuration"
mv ucxjcitx.ori.ini ucxjcitx.ini
sed -i "s/^name.*=.*/name=$automic_global_name/g" ucxjcitx.ini
sed -i "s/^system.*=.*/system=$automic_global_system/g" ucxjcitx.ini
sed -i "s/^logging.*=.*/logging=$automic_global_logging/g" ucxjcitx.ini
sed -i "s/^connection.*=.*/connection=$automic_tcpip_connection/g" ucxjcitx.ini
sed -i "s/^keyPassword.*=.*/keyPassword=$automic_authorization_keypassword/g" ucxjcitx.ini

sed -i "s#^trustedCertFolder.*=.*#trustedCertFolder=../trustedcert#g" ucxjcitx.ini

echo "2. start agent $automic_global_name"
java -Xrs -Xmx1G -jar ucxjcitx.jar