#/bin/sh
patch /usr/share/init/nginx.conf < nginx.conf.patch
patch /usr/share/init/mkdhparam.conf < mkdhparam.conf.patch
patch /usr/syno/bin/mkcert < mkcert.patch
patch /usr/syno/bin/mkdhparam < mkdhparam.patch
patch /usr/syno/etc/www/SSLProfile.json < SSLProfile.json.patch
patch /usr/syno/etc.defaults/www/SSLProfile.json < SSLProfile.json.patch
patch /usr/syno/etc/ssl/cfg.d/ca.cfg < ca.cfg.patch
patch /usr/syno/etc/ssl/cfg.d/ca.crt.cfg < ca.crt.cfg.patch
patch /usr/syno/etc/ssl/cfg.d/server.cfg < server.cfg.patch
patch /usr/syno/etc/ssl/cfg.d/server.crt.cfg < server.crt.cfg.patch
patch /etc/ssl/openssl.cnf < openssl.cnf.patch
patch /etc.defaults/ssl/openssl.cnf < openssl.cnf.patch
patch /usr/syno/share/nginx/nginx.mustache < nginx.mustache.patch
cp OCSPStapling /usr/syno/share/nginx/
/usr/syno/bin/mkdhparam 4096
synoservice --stop pkgctl-Apache2.2
synoservice --stop pkgctl-Apache2.4
synoservice --restart pkgctl-WebStation
synoservice --start pkgctl-Apache2.2
synoservice --start pkgctl-Apache2.4
