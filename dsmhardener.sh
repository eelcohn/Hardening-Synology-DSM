#/bin/sh
patch /etc/ssh/sshd_config < sshd_config.patch
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

# If the Apache2.2 package is installed, stop it
if [ synoservicecfg --status pkgctl-Apache2.2 -eq 0 ] 
  synoservice --stop pkgctl-Apache2.2
fi

# If the Apache2.4 package is installed, stop it
if [ synoservicecfg --status pkgctl-Apache2.4 -eq 0 ] 
  synoservice --stop pkgctl-Apache2.4
fi

# If the WebStation package is installed, restart it
if [ synoservicecfg --status pkgctl-WebStation -ne 255 ] 
  synoservice --restart pkgctl-WebStation
else
  synoservice --restart nginx
fi

# If the Apache2.2 package is installed, start it
if [ synoservicecfg --status pkgctl-Apache2.2 -eq 3 ] 
  synoservice --start pkgctl-Apache2.2
fi

# If the Apache2.4 package is installed, start it
if [ synoservicecfg --status pkgctl-Apache2.4 -eq 3 ] 
  synoservice --start pkgctl-Apache2.4
fi
