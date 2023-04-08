#!/bin/bash

# Configure Go
export GOPATH=/root/go && \
export PATH=${GOPATH}/bin:/usr/local/go/bin:$PATH && \
export GOBIN=$GOROOT/bin && \
mkdir -p ${GOPATH}/src ${GOPATH}/bin && \
export GO111MODULE=auto && \

go install github.com/tomnomnom/fff@latest
go install github.com/hakluke/hakrawler@latest
go install github.com/tomnomnom/hacks/tojson@latest
go install github.com/sensepost/gowitness@latest
go install github.com/shenwei356/rush@latest
go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install github.com/hakluke/hakcheckurl@latest
go install github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
go install github.com/root4loot/rescope@latest
go install github.com/tomnomnom/gron@latest
go install github.com/tomnomnom/hacks/html-tool@latest
go install github.com/projectdiscovery/chaos-client/cmd/chaos@latest
go install github.com/tomnomnom/gf@latest
go install github.com/tomnomnom/qsreplace@latest
go install github.com/owasp-amass/amass/v3/...@master
go install github.com/ffuf/ffuf@latest
go install github.com/tomnomnom/assetfinder@latest
go install github.com/gwen001/github-subdomains@latest
go install github.com/dwisiswant0/cf-check@latest
go install github.com/tomnomnom/hacks/waybackurls@latest
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install github.com/tomnomnom/anew@latest
go install github.com/projectdiscovery/notify/cmd/notify@latest
go install github.com/daehee/mildew/cmd/mildew@latest
go install github.com/m4dm0e/dirdar@latest
go install github.com/tomnomnom/unfurl@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/gwen001/github-endpoints@latest
go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/bp0lr/gauplus@latest
go install github.com/lc/subjs@latest
go install github.com/KathanP19/Gxss@latest
go install github.com/jaeles-project/gospider@latest
go get github.com/cgboal/sonarsearch/cmd/crobat
go install github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest
go install github.com/hahwul/dalfox/v2@latest
go install github.com/d3mondev/puredns/v2@latest
go install github.com/Josue87/resolveDomains@latest
go install github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest
go install github.com/Josue87/gotator@latest
go install github.com/tomnomnom/hacks/kxss@latest
go install github.com/003random/getJS@latest
go install github.com/deletescape/goop@latest
go install github.com/tomnomnom/meg@latest
go install github.com/takshal/freq@latest
go install github.com/j3ssie/sdlookup@latest
#go install github.com/signedsecurity/sigurlfind3r/cmd/sigurlfind3r@latest
go install github.com/hueristiq/hqurlfind3r/v2/cmd/hqurlfind3r@latest
go install github.com/chromedp/chromedp@latest
go install github.com/ferreiraklet/airixss@latest
go install github.com/ferreiraklet/nilo@latest
go install github.com/hakluke/hakip2host@latest
go install github.com/ferreiraklet/scopein@latest
go install github.com/hakluke/haktldextract@latest
go install github.com/trickest/mksub@latest
go install github.com/KathanP19/Gxss@latest

#cp /root/go/bin/* /usr/bin

echo -e "\nInstall Tools\n"


mkdir /root/nuclei-custom-templates && \
wget https://gitcode.net/mirrors/projectdiscovery/nuclei-templates/-/raw/v7.0.2/subdomain-takeover/detect-all-takeovers.yaml -O /root/nuclei-custom-templates/m4cddr-takeovers.yaml

git clone https://github.com/devanshbatham/ParamSpider.git /opt/ParamSpider && \
pip3 install -r /opt/ParamSpider/requirements.txt

dir="/root/Programs/"

mkdir -p /root/.gf
mkdir -p /root/Programs/
mkdir -p /root/Lists/
mkdir -p /root/.config/notify/
mkdir -p /root/.config/amass/
mkdir -p /root/.config/nuclei/
mkdir -p /root/Companies

pip3 install uro
pip3 install bhedak
pip3 install dnsgen

wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/XSS/XSS-OFJAAAH.txt -O /root/Lists/XSS-OFJAAAH.txt
wget https://raw.githubusercontent.com/s0md3v/Arjun/master/arjun/db/params.txt -O /root/Lists/params.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-large-directories-lowercase.txt -O /root/Lists/raft-large-directories-lowercase.txt
wget https://raw.githubusercontent.com/devanshbatham/ParamSpider/master/gf_profiles/potential.json -O /root/.gf/potential.json
wget https://wordlists-cdn.assetnote.io/data/automated/httparchive_apiroutes_2022_03_28.txt -O /root/Lists/httparchive_apiroutes_2022_03_28.txt
wget https://github.com/danielmiessler/SecLists/blob/master/Discovery/Web-Content/raft-large-files.txt -O /root/Lists/raft-large-files.txt
wget https://github.com/danielmiessler/SecLists/blob/master/Discovery/Web-Content/raft-large-words-lowercase.txt -O /root/Lists/raft-large-words-lowercase.txt
wget https://github.com/danielmiessler/SecLists/blob/master/Discovery/DNS/subdomains-top1million-110000.txt -O /root/Lists/subdomains-top1million-110000.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/subdomains-top1million-5000.txt -O /root/Lists/subdomains-top1million-5000.txt
wget https://raw.githubusercontent.com/trickest/resolvers/main/resolvers.txt -O /root/Lists/resolvers.txt

curl -L http://cpanmin.us | perl - App::cpanminus && \
git clone https://github.com/fwaeytens/dnsenum.git /opt/dnsenum/ && \
    chmod +x /opt/dnsenum/dnsenum.pl && \
    ln -s /opt/dnsenum/dnsenum.pl /usr/bin/dnsenum && \
    cpanm String::Random --force && \
    cpanm Net::IP --force && \
    cpanm Net::DNS --force && \
    cpanm Net::Netmask --force && \
    cpanm XML::Writer --force

git clone https://github.com/tomnomnom/gf.git /opt/gf && \
go build /opt/gf/main.go && \
mv main gf && \
chmod +x gf && \
mv gf /usr/bin/ && \
echo '/opt/gf/gf-completion.bash' >> /root/.bashrc && \
cp -r /opt/gf/examples/ /root/.gf

git clone https://github.com/1ndianl33t/Gf-Patterns /opt/Gf-Patterns && \
mv /opt/Gf-Patterns/*.json /root/.gf

git clone https://github.com/GerbenJavado/LinkFinder.git /opt/LinkFinder && \
pip3 install -r /opt/LinkFinder/requirements.txt && \
python3 /opt/LinkFinder/setup.py install

git clone https://github.com/codingo/Interlace.git /opt/Interlace && \
pip3 install -r /opt/Interlace/requirements.txt && \
python3 /opt/Interlace/setup.py install

git clone https://github.com/0x240x23elu/JSScanner.git /opt/JSScanner && \
pip3 install -r /opt/JSScanner/requirements.txt

git clone https://github.com/m4ll0k/SecretFinder.git /opt/SecretFinder && \
pip3 install -r /opt/SecretFinder/requirements.txt

git clone https://github.com/m4ll0k/BBTz.git /opt/BBTz

pip install git-dumper

git clone https://github.com/RUB-NDS/CORStest.git /opt/CORStest

git clone https://github.com/guelfoweb/knock.git /opt/knock && \
pip3 install -r /opt/knock/requirements.txt && \
python3 /opt/knock/setup.py install

git clone https://github.com/s0md3v/Photon.git /opt/Photon && \
pip3 install -r /opt/Photon/requirements.txt

git clone https://github.com/screetsec/Sudomy.git /opt/Sudomy && \
pip3 install -r /opt/Sudomy/requirements.txt

git clone https://github.com/vortexau/dnsvalidator.git /opt/dnsvalidator && \
pip3 install -r /opt/dnsvalidator/requirements.txt && \
python3 /opt/dnsvalidator/setup.py install

git clone https://github.com/blechschmidt/massdns.git /opt/massdns && \
cd /opt/massdns && \
make && \
cp bin/massdns /usr/bin/

git clone https://github.com/maurosoria/dirsearch.git /opt/dirsearch && \
pip3 install -r /opt/dirsearch/requirements.txt && \
python3 /opt/dirsearch/setup.py install

git clone https://github.com/xnl-h4ck3r/knoxnl.git /opt/knoxnl && \
python3 /opt/knoxnl/setup.py install

git clone https://github.com/xnl-h4ck3r/xnLinkFinder.git /opt/xnLinkFinder && \
python3 /opt/xnLinkFinder/setup.py install

# git clone https://github.com/mswell/dotfiles.git /opt/dotfiles && \
# bash /opt/dotfiles/setup/ubuntu/base.sh && \
# bash /opt/dotfiles/setup/ubuntu/devel.sh && \
# bash /opt/dotfiles/setup/ubuntu/apps.sh && \
# bash /opt/dotfiles/setup/ubuntu/fonts.sh && \
# bash /opt/dotfiles/setup/ubuntu/terminal.sh && \
# bash /opt/dotfiles/setup/copy_dots.sh

git clone https://github.com/xnl-h4ck3r/waymore.git /opt/waymore && \
pip3 install -r /opt/waymore/requirements.txt


mkdir -p /opt/Nuclei-Templates-Collection/ && \
go install github.com/xm1k3/cent@latest && \
cent init && \
cent -p /opt/Nuclei-Templates-Collection/ -k