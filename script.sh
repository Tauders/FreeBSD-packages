echo 'Install and update pkg (pakage manager)'
echo '----------------------------------'
env ASSUME_ALWAYS_YES=YES pkg bootstrap
pkg update
echo '----------------------------------'
echo 'Install packages'
echo '----------------------------------'
pkg install -y mc qpopper ntp mutt apache24 samba42 xorg wireshark opera isc-dhcp43-server bind910
echo '----------------------------------'
