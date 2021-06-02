#! /bin/bash



echo -e "\e[34m 1]fast $ tcp scan \e[0m"
echo -e "\e[34m 2]Script/version/ scan \e[0m"
echo -e "\e[34m 3]Udp scan \e[0m"
echo -e "\e[34m 4]Os detection \e[0m"
echo -e "\e[34m 5]Gather page titles from HTTP services \e[0m"
echo -e "\e[34m 6]Get HTTP headers of web services \e[0m"
echo -e "\e[34m 7]Find web apps from known paths \e[0m"
echo -e "\e[34m 8]Informaton about ip  \e[0m"
echo -e "\e[34m 9]All port scan \e[0m"
echo -e "\e[34m 10]Smp enumretion \e[0m"
echo
echo -e "Enter the options : \c"
read option

read  -p  " Enter the ip address   : " ip

if [ $option == 1 ]
then
    nmap -sT $ip -vv
elif [ $option == 2 ]
then
    nmap -sC -sV $ip -vv
elif [ $option == 3 ]
then
    nmap -sU $ip -vv
elif [ $option == 4 ]
then
    nmap -O $ip -vv
elif [ $option == 5 ]
then
    nmap –script=http-title $ip -vv
elif [ $option == 6 ]
then
    nmap –script=http-headers $ip -vv
elif [ $option == 7 ]
then
    nmap –script=http-enum $ip -vv
    
elif [ $option == 8 ]
then
    nmap –script=asn-query,whois,ip-geolocation-maxmind $ip -vv
elif [ $option == 9 ]
then
    nmap -p- $ip -vv
    
elif [ $option == 10 ]
then
    nmap --script smb-enum-shares.nse -p445 $ip -vv
else
    echo "select 1 to 10 numbers to scan "
fi