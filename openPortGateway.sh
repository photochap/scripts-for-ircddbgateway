#!/bin/bash

iptables -F
iptables -X

iptables -t filter -A INPUT -p tcp -i eth0 --dport 80 -j ACCEPT
iptables -t filter -A INPUT -p tcp -i eth0 --dport 443 -j ACCEPT
iptables -t filter -A INPUT -p udp -i eth0 --dport 30001 -j ACCEPT
iptables -t filter -A INPUT -p udp -i eth0 --dport 20001 -j ACCEPT
iptables -t filter -A INPUT -p udp -i eth0 --dport 30051 -j ACCEPT
iptables -t filter -A INPUT -p udp -i eth0 --dport 40000 -j ACCEPT
iptables -t filter -A INPUT -p udp -i eth0 --dport 30061:30065 -j ACCEPT

iptables -t filter -A INPUT -p udp -i eth0 --dport 54830 -j ACCEPT

iptables -A INPUT -i eth0 -p tcp --destination-port 3366 -j ACCEPT

iptables -t filter -A INPUT -p tcp -i wg0 --dport 10022 -j ACCEPT
iptables -t filter -A INPUT -p udp -i wg0 --dport 20010 -j ACCEPT
iptables -t filter -A INPUT -p udp -i wg0 --dport 20011 -j ACCEPT
iptables -t filter -A INPUT -p udp -i wg0 --dport 20012 -j ACCEPT
iptables -t filter -A INPUT -p udp -i wg0 --dport 55566 -j ACCEPT

iptables -A INPUT -i eth0 -p udp --destination-port 55566 -j DROP

iptables -A INPUT -p tcp -i eth0 --destination-port 10022 -j DROP
iptables -A INPUT -p udp -i eth0 --destination-port 20010 -j DROP
iptables -A INPUT -p udp -i eth0 --destination-port 20011 -j DROP
iptables -A INPUT -p udp -i eth0 --destination-port 20012 -j DROP
iptables -A INPUT -p udp -i eth0 --destination-port 55566 -j DROP
iptables -A INPUT -p udp -i eth0 --destination-port 22 -j DROP
iptables -A INPUT -p udp -i eth0 --destination-port 8080 -j DROP

iptables -L -v -n
