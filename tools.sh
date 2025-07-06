clear
echo "Created For Cloud Bug Bounty Automation by NK"
sleep 4
sudo apt update -y
sudo apt upgrade -y
sudo apt install net-tools -y
sudo apt install neofetch -y
sudo apt install nload -y
sudo apt install htop -y
sudo apt install nmap -y
sudo apt install nano -y
sudo apt install tmux -y
sudo apt install git -y
sudo apt install build-essential -y
sudo apt install unzip -y
mkdir ~/Downloads
cp Paramspiderv3.zip ~/Downloads/
unzip ~/Downloads/Paramspiderv3.zip
mkdir ~/notify
mkdir ~/scripts
cp nk_priv8.zip ~/Downloads/
unzip ~/Downloads/nk_priv8.zip
cp error-based.yaml ~/scripts/
cp xss.yaml ~/scripts/
cd scripts
cp * ~/scripts/
touch ~/notify/results.txt
cd ~/Downloads
git clone https://github.com/blechschmidt/massdns.git
wget https://go.dev/dl/go1.24.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.24.3.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
cd massdns
make
sudo make install
cd ~
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
go install github.com/d3mondev/puredns/v2@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/tomnomnom/anew@latest
go install -v github.com/lc/gau/v2/cmd/gau@latest
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
sudo apt install python3 -y
sudo apt install python3-pip -y
sudo cp ~/go/bin/* /usr/local/bin/
nuclei -h
notify
cp provider-config.yaml ~/.config/notify/
