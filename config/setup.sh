sysctl -w fs.file-max=12000500
sysctl -w fs.nr_open=20000500
ulimit -n 4000000
sysctl -w net.ipv4.tcp_mem='10000000 10000000 10000000'
sysctl -w net.ipv4.tcp_rmem='1024 4096 16384'
sysctl -w net.ipv4.tcp_wmem='1024 4096 16384'
sysctl -w net.ipv4.ip_local_port_range='1025 65535'
sysctl -w net.core.rmem_max=16384
sysctl -w net.core.wmem_max=16384
sysctl -w net.ipv4.tcp_moderate_rcvbuf="0"
yes | apt-get update
yes | apt-get install elixir build-essential git gnuplot libtemplate-perl make erlang erlang-base libyaml-dev python3-pip libssl-dev autoconf
wget http://tsung.erlang-projects.org/dist/tsung-1.7.0.tar.gz
tar -xvf tsung-1.7.0.tar.gz
cd tsung-1.7.0/
./configure
make
make install
cd ..
echo "root soft nofile 4000000" >> /etc/security/limits.conf
echo "root hard nofile 4000000" >> /etc/security/limits.conf
echo 20000500 > /proc/sys/fs/nr_open
