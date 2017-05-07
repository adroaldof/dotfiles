echo "###############################################################################"
echo "# We need sudo do start"
echo "###############################################################################"
sudo echo "I need your permission please"
sudo echo "Thanks. I'll begin the install now"

echo "###############################################################################"
echo "# Change Some Networks Configurations"
echo "###############################################################################"
# Add network configurations
echo 'auto lo:0' | sudo tee --append /etc/network/interfaces
echo 'iface lo:0 inet static' | sudo tee --append /etc/network/interfaces
echo 'address 10.10.10.10' | sudo tee --append /etc/network/interfaces
echo 'netmask 255.0.0.0' | sudo tee --append /etc/network/interfaces

# Restart network services
sudo service networking restart


echo "###############################################################################"
echo "# Install docker authentication file"
echo "###############################################################################"
sudo mkdir ~/.docker
sudo tee ~/.docker/config.json > /dev/null << EOF
{
    "auths": {
        "https://docker.bravi.com.br/v1/": {
            "auth": "YWRtaW46MTIz",
            "email": "$USER@bravi.com.br"
        },
        "https://docker-registry.bravi.com.br/v1/": {
            "auth": "YnJhdmktZGV2ZWxvcGVyOnNsZS1tZVctaVQ=",
            "email": "$USER@bravi.com.br"
        }
    }
}

EOF


echo "###############################################################################"
echo "# Install Bravi Goods"
echo "###############################################################################"
sudo tee ~/alias.sh > /dev/null << EOF
zshsrc () {
    source ~/alias.sh
}

update-alias () {
    if [ -d "/tmp/bravi-docs" ]; then
        (cd /tmp/bravi-docs && git pull)
    else
        (cd /tmp && git clone git@git.bravi.com.br:bravi-docs/bravi-docs.git)
    fi

    ls /tmp/bravi-docs/setup/alias/aliases
    cp /tmp/bravi-docs/setup/alias/aliases/* ~/aliases
    zshsrc
}

for f in ~/aliases/*; do
    source "$f";
done

EOF


echo "###############################################################################"
echo "# Source Bravi Aliases"
echo "###############################################################################" 
echo "source ~/alias.sh" >> $HOME/.zshrc

mkdir ~/aliases
source ~/alias.sh
update-alias
