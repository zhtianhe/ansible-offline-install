#!/bin/bash
export Sname=$(readlink -f $0)
export Spath=$(dirname ${Sname})
export Sroot=$(dirname ${Spath})
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64:$LD_LIBRARY_PATH    
set -e
set +x
#安装系统依赖
sudo yum install -y python-dateutil gcc gcc-c++ bison flex readline-devel zlib-devel tcl wget  unzip xz  make gmake automake libtool libtool texinfo
sudo yum install -y python-devel  openssl-devel libffi-devel 

#######################################
#   旧版本需要安装部分 
#######################################
if [ $? = "0" ]; then
    echo "安装:autoconf-2.69"	
    tar xvf autoconf-2.69.tar.xz
    cd autoconf-2.69
    ./configure  && make && make install    

else
    echo "系统依赖安装失败"
    exit 1
fi
if [ $? = "0" ]; then
    echo "安装:libffi-3.4.2"
    ${Spath}	
    tar xvf libffi-3.4.2.tar.bz2
    cd libffi-3.4.2
    ./autogen.sh
    ./configure  && make && make install
else
    echo "安装:autoconf-2.69 失败"	
    exit 1
fi

if [ $? = "0" ]; then
    echo "安装:Python-2.7.18.tar.xz"
    ${Spath}	
    tar xvf Python-2.7.18.tar.xz
    cd Python-2.7.18    
    ./configure  && make && make install
else
    echo "安装:libffi-3.4.2 失败"
    exit 1
fi

#######################################
#   必须安装部分
#######################################
if [ $? = "0" ]; then
    echo "安装setuptools"
    ${Spath}
    unzip setuptools-41.1.0.zip
    cd setuptools-41.1.0
    python setup.py install
else
    echo "安装:Python-2.7.18 失败"	
    exit 1
fi
if [ $? = "0" ]; then   
    echo "安装pycrypto"
    ${Spath}
    tar -xzf pycrypto-2.6.1.tar.gz 
    cd pycrypto-2.6.1
    python setup.py install
else
    echo "setuptools安装失败"
    exit 1
fi
if [ $? = "0" ]; then   
    echo "安装PyYAML"
    ${Spath}
    tar -xzf PyYAML-5.1.tar.gz 
    cd PyYAML-5.1
    python setup.py install
else
    echo "pycrypto安装失败"
    exit 1
fi
if [ $? = "0" ]; then    
    echo 安装MarkupSafe
    ${Spath}
    tar -xzf MarkupSafe-1.1.1.tar.gz 
    cd MarkupSafe-1.1.1
    python setup.py  install
else
    echo "PyYAML安装失败"
    exit 1
fi
if [ $? = "0" ]; then    
    echo 安装Jinja2
    ${Spath}
    tar -xzf Jinja2-2.10.1.tar.gz 
    cd Jinja2-2.10.1
    python setup.py  install
else
    echo "MarkupSafe安装失败"
    exit 1
fi
if [ $? = "0" ]; then    
    echo 安装simplejson
    ${Spath}
    tar -xzf simplejson-3.16.0.tar.gz 
    cd simplejson-3.16.0
    python setup.py install
else
    echo "Jinja2安装失败"
    exit 1
fi
if [ $? = "0" ]; then    
    echo 安装pycparser
    ${Spath}
    tar -xzf pycparser-2.19.tar.gz
    cd pycparser-2.19
    python setup.py install
else
    echo "simplejson安装失败"
    exit 1
fi
if [ $? = "0" ]; then    
    echo 安装cffi
    ${Spath}
    tar -xzf cffi-1.12.3.tar.gz 
    cd cffi-1.12.3
    python setup.py install
else
    echo "pycparser安装失败"
    exit 1
fi
if [ $? = "0" ]; then    
    echo 安装ipaddress
    ${Spath}
    tar -xzf ipaddress-1.0.22.tar.gz 
    cd ipaddress-1.0.22
    python setup.py install
else
    echo "cffi安装失败"
    exit 1
fi
if [ $? = "0" ]; then    
    echo 安装six
    ${Spath}
    tar -xzf six-1.12.0.tar.gz 
    cd six-1.12.0
    python setup.py install
else
    echo "ipaddress安装失败"
    exit 1
fi
if [ $? = "0" ]; then    
    echo 安装asn1crypto
    ${Spath}
    tar -xzf asn1crypto-0.24.0.tar.gz 
    cd asn1crypto-0.24.0
    python setup.py install
else
    echo "six安装失败"
    exit 1
fi
if [ $? = "0" ]; then    
    echo 安装idna
    ${Spath}
    tar -xzf idna-2.8.tar.gz 
    cd idna-2.8
    python setup.py install
else
    echo "asn1crypto安装失败"
    exit 1
fi
if [ $? = "0" ]; then    
    echo 安装pyasn1
    ${Spath}
    tar -xzf pyasn1-0.4.5.tar.gz 
    cd pyasn1-0.4.5
    python setup.py install
else
    echo "idna安装失败"
    exit 1
fi
if [ $? = "0" ]; then    
    echo 安装PyNaCl
    ${Spath}
    tar -xzf PyNaCl-1.3.0.tar.gz 
    cd PyNaCl-1.3.0
    python setup.py install
else
    echo "pyasn1安装失败"
    exit 1
fi
if [ $? = "0" ]; then    
    echo 安装enum34
    ${Spath}
    tar xf enum34-1.1.8.tar.gz
    cd enum34-1.1.8
    python setup.py install
else
    echo "PyNaCl安装失败"
    exit 1
fi
if [ $? = "0" ]; then    
    echo 安装cryptography
    ${Spath}
    tar -xzf cryptography-2.6.1.tar.gz 
    cd cryptography-2.6.1
    python setup.py install
else
    echo "enum34安装失败"
    exit 1
fi
if [ $? = "0" ]; then    
    echo 安装bcrypt
    ${Spath}
    tar -xzf bcrypt-3.1.6.tar.gz 
    cd bcrypt-3.1.6
    python setup.py install
else
    echo "cryptography安装失败"
    exit 1
fi
if [ $? = "0" ]; then    
    echo 安装paramiko
    ${Spath}
    tar -xzf paramiko-2.4.2.tar.gz 
    cd paramiko-2.4.2
    python setup.py install
else
    echo "bcrypt安装失败"
    exit 1
fi
if [ $? = "0" ]; then    
    echo 安装ansible
    ${Spath}
    tar -xzf ansible-2.9.7.tar.gz 
    cd ansible-2.9.7/
    python setup.py install
else
    echo "paramiko安装失败"
    exit 1
fi
if [ $? = "0" ]; then 
    echo "ansible安装成功"
else
    echo "ansible安装失败"
    exit 1
fi

#修改配置
mkdir -p /etc/ansible/
cp examples/ansible.cfg /etc/ansible/
cp examples/hosts /etc/ansible/
sed -i.bak 's/#log_path/log_path/' /etc/ansible/ansible.cfg

# 查看ansible版本
ansible --version
