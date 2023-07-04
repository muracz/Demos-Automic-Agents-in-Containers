#!/bin/sh
terminate() {
echo $0: trapped signal
if [ ! -z "$PID" ]; then
echo $0: will kill agent
kill $PID
fi
echo $0: exiting
 exit 0
 }

echo $0: will trap SIGINT and SIGTERM
trap 'kill ${!}; terminate' INT TERM

echo "1. adopt agent configuration"
mv ucxjxxx.ori.ini ucxjlx6.ini
sed -i "s/^name.*=.*/name=$automic_global_name/g" ucxjlx6.ini
sed -i "s/^system.*=.*/system=$automic_global_system/g" ucxjlx6.ini
sed -i "s/^MsgToStdout.*=.*/MsgToStdout=$automic_misc_msgtostdout/g" ucxjlx6.ini
sed -i "s/^connection.*=.*/connection=$automic_tcpip_connection/g" ucxjlx6.ini
sed -i "s/^keyPassword.*=.*/keyPassword=$automic_authorization_keypassword/g" ucxjlx6.ini
sed -i "s#^trustedCertFolder.*=.*#trustedCertFolder=../trustedcert#g" ucxjlx6.ini
sed -i "s#^initialPackage.*=.*#initialPackage=./package#g" ucxjlx6.ini
#sed -i "/^\[VARIABLES\].*/a UC_EX_IP_ADDR=$automic_variables_uc_ex_ip_addr" ucxjlx6.ini
#sed -i "/^\[VARIABLES\].*/a UC_EX_IP_PORT=$automic_variables_uc_ex_ip_port" ucxjlx6.ini
sed -i "/^\[VARIABLES\].*/a UC_EX_JOB_MD_IP_ADDR=$automic_variables_uc_ex_job_md_ip_addr" ucxjlx6.ini
echo "2. create user"
useradd -m agentuser
echo agentuser:agentpw | chpasswd

echo "3. start agent"
./ucxjlx6 
#./ucxjlx6 &
#PID=$!
#wait $PID