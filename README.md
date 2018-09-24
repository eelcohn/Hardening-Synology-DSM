# Hardening-Synology-DSM

A collection of patches for hardening Synology DSM.

These patches come with ABSOLUTELY NO WARRANTY WHATSOEVER! Incorrect usage may result in a broken disk station! Don't say I didn't warn you :-)
That said, you can use these patches to harden DSM6.1

## Hardening sshd

By default sshd on DSM does not explicitly disables SSH Protocol v1, and does not explcitly disable root access. The following patch file will harden sshd:
```
sshd_config.patch
```

## 4096-bit certificates with SHA512 hashes

DSM by default creates 2048-bit certificates with a SHA256 hash, but ideally we'd want the certificates to be 4096-bits with SHA512 hash. The following patch files change the default settings to 4096-bits certificates with SHA512 hashes:
```
mkcert.patch
ca.cfg.patch
server.cfg.patch
openssl.cnf.patch
```

## Enable OCSP Stapling for the WebServer package

DSM does not support OCSP stapling by default. The following patch files will enable OCSP stapling:
```
OCSPStaple.mustache
ca.crt.cfg.patch
nginx.mustache.patch
server.crt.cfg.patch
```

## Use 4096-bit Diffie Hellmann parameters

By default DSM uses 2048-bit Diffie Hellmann parameters. These patches will set the default DH parameter bitsize to 4096-bit:
```
SSLProfile.patch
mkdhparam.conf.patch
mkdhparam.patch
nginx.conf.patch
```
