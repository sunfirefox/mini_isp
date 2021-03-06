
IPT='/usr/sbin/iptables'

for a in `cat /proc/net/ip_tables_names`; do
${IPT} -F -t $a
${IPT} -X -t $a

if [ $a = nat ]; then
${IPT} -t nat -P PREROUTING ACCEPT
${IPT} -t nat -P POSTROUTING ACCEPT
${IPT} -t nat -P OUTPUT ACCEPT
elif [ $a = mangle ]; then
${IPT} -t mangle -P PREROUTING ACCEPT
${IPT} -t mangle -P INPUT ACCEPT
${IPT} -t mangle -P FORWARD ACCEPT
${IPT} -t mangle -P OUTPUT ACCEPT
${IPT} -t mangle -P POSTROUTING ACCEPT
elif [ $a = filter ]; then
${IPT} -t filter -P INPUT ACCEPT
${IPT} -t filter -P FORWARD ACCEPT
${IPT} -t filter -P OUTPUT ACCEPT
fi
done

