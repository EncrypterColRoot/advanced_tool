
#!/bin/bash

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # Sin color

# Banner
echo -e "${CYAN}  _____         _   ___                       _           "
echo -e "${CYAN} |_   _|__  ___| | | __|_ _  __ _ _ _  _ _ __| |_ ___ _ _ "
echo -e "${CYAN}   | |/ _ \/ _ \ | | _|| ' \/ _| '_| || | '_ \  _/ -_) '_|"
echo -e "${CYAN}   |_|\___/\___/_| |___|_||_\__|_|  \_, | .__/\__\___|_|  "
echo -e "${CYAN}                                    |__/|_|               "
echo -e "${WHITE}Created by https://t.me/Encrypt3rR00T${NC}"

# Verificar si se tienen privilegios de superusuario
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}Este script debe ejecutarse con privilegios de superusuario.${NC}" 
   exit 1
fi

# Función para instalar herramientas
function install_tools {
    echo -e "${GREEN}Instalando herramientas necesarias...${NC}"
    apt-get update
    apt-get install -y nmap nikto hydra sqlmap recon-ng metasploit-framework wireshark netcat john dnsenum lynis zphisher radare2 enum4linux binwalk cuckoo mobsf prowler firmwalker
    echo -e "${GREEN}Todas las herramientas han sido instaladas.${NC}"
}

# Mostrar el menú de opciones
function show_menu {
    echo -e "${GREEN}Seleccione una opción:${NC}"
    echo -e "${YELLOW}1) Network Scan (nmap)"
    echo -e "${YELLOW}2) Web Vulnerabilities Scan (nikto)"
    echo -e "${YELLOW}3) Brute Force Attack (hydra)"
    echo -e "${YELLOW}4) SQL Injection Test (sqlmap)"
    echo -e "${YELLOW}5) Information Gathering (recon-ng)"
    echo -e "${YELLOW}6) Exploitation Framework (metasploit)"
    echo -e "${YELLOW}7) Traffic Analysis (wireshark)"
    echo -e "${YELLOW}8) Port Enumeration (netcat)"
    echo -e "${YELLOW}9) Password Cracking (john the ripper)"
    echo -e "${YELLOW}10) DNS Enumeration (dnsenum)"
    echo -e "${YELLOW}11) Vulnerability Scan (lynis)"
    echo -e "${YELLOW}12) Phishing Attack (zphisher)"
    echo -e "${YELLOW}13) Reverse Engineering (radare2)"
    echo -e "${YELLOW}14) SMB Enumeration (enum4linux)"
    echo -e "${YELLOW}15) Binary Analysis (binwalk)"
    echo -e "${YELLOW}16) Malware Analysis (cuckoo)"
    echo -e "${YELLOW}17) Mobile App Analysis (mobSF)"
    echo -e "${YELLOW}18) Cloud Security Assessment (prowler)"
    echo -e "${YELLOW}19) IoT Pentesting (firmwalker)"
    echo -e "${YELLOW}20) Exit${NC}"
}

# Funciones para cada herramienta
function nmap_scan {
    echo -e "${BLUE}Enter the IP or range to scan: ${NC}"
    read target
    nmap -A $target
}

function nikto_scan {
    echo -e "${BLUE}Enter the URL to scan: ${NC}"
    read url
    nikto -h $url
}

function hydra_bruteforce {
    echo -e "${BLUE}Enter the target IP or URL: ${NC}"
    read target
    echo -e "${BLUE}Enter the service (ssh, ftp, etc): ${NC}"
    read service
    echo -e "${BLUE}Enter the path to the password dictionary: ${NC}"
    read wordlist
    hydra -L userlist.txt -P $wordlist $target $service
}

function sqlmap_injection {
    echo -e "${BLUE}Enter the URL to test: ${NC}"
    read url
    sqlmap -u $url --batch --dbs
}

function recon_ng_scan {
    recon-ng
}

function metasploit_exploit {
    msfconsole
}

function wireshark_analysis {
    wireshark &
}

function netcat_enum {
    echo -e "${BLUE}Enter the target IP or URL: ${NC}"
    read target
    nc -zv $target 1-65535
}

function john_crack {
    echo -e "${BLUE}Enter the hash file: ${NC}"
    read hashfile
    john $hashfile
}

function dns_enum {
    echo -e "${BLUE}Enter the domain to enumerate: ${NC}"
    read domain
    dnsenum $domain
}

function lynis_scan {
    lynis audit system
}

function zphisher_attack {
    zphisher
}

function radare2_reversing {
    echo -e "${BLUE}Enter the binary file: ${NC}"
    read binary
    r2 $binary
}

function enum4linux_scan {
    echo -e "${BLUE}Enter the target IP: ${NC}"
    read target
    enum4linux $target
}

function binwalk_analysis {
    echo -e "${BLUE}Enter the binary file: ${NC}"
    read binary
    binwalk $binary
}

function cuckoo_analysis {
    cuckoo
}

function mobsf_analysis {
    mobsf
}

function prowler_scan {
    prowler
}

function firmwalker_scan {
    echo -e "${BLUE}Enter the firmware to analyze: ${NC}"
    read firmware
    firmwalker $firmware
}

# Instalar herramientas necesarias si no están instaladas
install_tools

# Menú loop
while true; do
    show_menu
    read -p "Select an option [1-20]: " option
    case $option in
        1) nmap_scan ;;
        2) nikto_scan ;;
        3) hydra_bruteforce ;;
        4) sqlmap_injection ;;
        5) recon_ng_scan ;;
        6) metasploit_exploit ;;
        7) wireshark_analysis ;;
        8) netcat_enum ;;
        9) john_crack ;;
        10) dns_enum ;;
        11) lynis_scan ;;
        12) zphisher_attack ;;
        13) radare2_reversing ;;
        14) enum4linux_scan ;;
        15) binwalk_analysis ;;
        16) cuckoo_analysis ;;
        17) mobsf_analysis ;;
        18) prowler_scan ;;
        19) firmwalker_scan ;;
        20) echo -e "${RED}Exiting...${NC}" ; exit ;;
        *) echo -e "${RED}Invalid option!${NC}" ;;
    esac
done
