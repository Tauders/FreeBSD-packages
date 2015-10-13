echo 'Install and update pkg (pakage manager)'
echo '----------------------------------'
env ASSUME_ALWAYS_YES=YES pkg bootstrap
pkg update
echo '----------------------------------'
echo 'Install packages'
echo '----------------------------------'
pkg install -y ca_root_nss mc qpopper ntp mutt apache24 samba42 x11/kde4 wireshark opera isc-dhcp43-server bind910
echo '----------------------------------'
echo 'Generate BIND "secret" key'
echo '----------------------------------'
rndc-confgen -a
echo '----------------------------------'
echo 'Change rc.conf'
echo '----------------------------------'
cat > /etc/rc.conf << EOF
hostname=""
firewall_enable="YES"
firewall_type="open"
firewall_logging="NO" 
gateway_enable="YES"
named_enable="NO"
natd_enable="NO"
inetd_enable="NO"
sendmail_enable="NO"
sendmail_submit_enable="NO"
sendmail_outbound_enable="NO"
sendmail_msp_queue_enable="NO"
sshd_enable="YES"
rpcbind_enable="NO"
nfs_client_enable="NO"
nfs_server_enable="NO"
rpc_lockd_enable="NO"
rpc_statd_enable="NO"
cron_enable="YES"
fusefs_enable="YES"
arpwatch_enable="NO"
diskprep_enable="NO"
dbus_enable="YES"
hald_enable="YES"
EOF
echo '----------------------------------'
echo 'Add config to .xinitrc'
echo '----------------------------------'
echo exec /usr/local/kde4/bin/startkde > ~/.xinitrc
echo '----------------------------------'
