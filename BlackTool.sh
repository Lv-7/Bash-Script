#! /bin/bash

echo -e "\e[34m  1] Nmap version scan \e[0m"
echo -e "\e[34m  2] Dir brute \e[0m"
echo -e "\e[34m  3] Staus code \e[0m"
echo -e "\e[34m  4] FTP brute force  \e[0m"
echo -e "\e[34m  5] SSH brute force \e[0m"
echo -e "\e[34m  6] Joomscan \e[0m"
echo -e "\e[34m  7] Nikto vulnscan  \e[0m"
echo -e "\e[34m  8] Skipfish \e[0m"
echo -e "\e[34m 9]file finder  \e[0m "
echo
read  -p  " Enter the options :  " options

echo 

read  -p  " Enter the ip address  && if you try 9th one you don't need enter ip just move on : " ip

case "$options" in
    1 )
        echo -e "\e[32m wait few min and select  nmap scan  method \e[0m"
        echo
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
        
    ;;
    
    2 )
        echo "dir brute passlist "
        echo
        echo "1] directory brute force with common list "
        echo "2] dir brute force with directory-list-2.3-medium.txt "
        echo
        echo -e "Enter the options : \c"
        read go
        
        if [ $go == 1 ]
        then
            gobuster dir -u http://$ip/ -w /usr/share/wordlists/dirb/common.txt -t 20
        elif [ $go == 2 ]
        then
            gobuster dir -u http://$ip/	-w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -t 15
        fi
        
    ;;
    
    3 )
        echo "curl response code "
        
        echo "web page status code "
        curl -I http://$ip/
        
    ;;
    
    4 )
        echo " ftp brute"
        
        echo "ftp brute force  default username [ admin ]"
        hydra -t 1 -l admin -P /usr/share/wordlists/rockyou.txt -vV $ip ftp
        
    ;;
    
    5 )
        echo "ssh  bruteforce "
        
        echo "ssh brute force default username [ root ]"
        hydra -s 22 -v -V -l root -P /usr/share/wordlists/rockyou.txt -t 8 $ip ssh
        
    ;;
    
    6 )
        echo " Joomscan http "
        
        joomscan -u http://$ip/
        
    ;;
    
    7 )
        echo " nikto Vulnscan "
        
        nikto -h http://$ip/
        
    ;;
    
    8 )
        echo  "skipfish  "
        
        skipfish -o vulnerbles  http://$ip/
        
    ;;
    
    9 )
        echo " just enter the file name and this will find the file have read and write permisson or not : "
        echo
        echo -e "Enter the file name : \c"
        read file
        
        if [ -e $file ]
        then
            if [ -w $file ] && [ -r $file ]
            then
                echo "you have a file with write & read  permission"
                echo -e "\e[93m `ls -la $file` \e[m"
                cat $file
                echo
            fi
        else
            echo "you don't have file"
    fi ;;
    
    
    default )
    echo "error" ;;
    
esac