```bash
#!/bin/bash
OLDDIR=$(pwd)
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
set -e

#安装系统依赖
#yum install -y python-devel openssl-devel libffi-devel gcc gcc-c++

STLS=setuptools-41.1.0
if [ $? = "0" ]; then
    #安装setuptools
    unzip $STLS.zip
    cd $STLS
    python setup.py install
else
    echo "系统依赖安装失败"
    exit 1
fi

while read LINE
do
	if [[ "$LINE" == "#.*" ]];then
	    continue;
	fi
	echo " $OLDDIR $LINE install ... "
	if [ $? = "0" ]; then    
		#安装bcrypt
		cd $OLDDIR
		tar -xzf $LINE.tar.gz  
		cd $LINE
		python setup.py install
		
		LNAME=$LINE
	else
		echo "$LNAME安装失败"
		exit 1
	fi

	echo " $LINE install OK "

done <<'EOF'
pycrypto-2.6.1
PyYAML-5.1
MarkupSafe-1.1.1
Jinja2-2.10.1
simplejson-3.16.0
pycparser-2.19
cffi-1.12.3
ipaddress-1.0.22
six-1.12.0
asn1crypto-0.24.0
idna-2.8
pyasn1-0.4.5
PyNaCl-1.3.0
enum34-1.1.8
cryptography-2.6.1
bcrypt-3.1.6
paramiko-2.4.2
ansible-2.9.7
EOF



```
