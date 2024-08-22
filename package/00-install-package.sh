docker -v
if [ "$?" -ne 0 ]; then
    # docker install
    sudo apt update
    curl https://get.docker.com | sh
    sudo usermod -aG docker $USER
fi

docker -v
if [ "$?" -ne 0 ]; then
    echo "ERROR: failed install docker"
    exit 1
fi

# docker start
sudo systemctl start docker
sudo systemctl enable docker

docker-compose -v
if [ "$?" -ne 0 ]; then
    # docker compose install
    sudo curl -L https://github.com/docker/compose/releases/download/v2.29.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
else

fi

docker-compose -v
if [ "$?" -ne 0 ]; then
    echo "ERROR: failed install docker-compose"
    exit 1
fi