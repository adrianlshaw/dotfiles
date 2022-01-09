set -x DOCKER_HOST unix:///run/user/1000/docker.sock
set -x SSH_AUTH_SOCK "/run/user/1000/gnupg/S.gpg-agent.ssh"
set -x DOCKER_HOST "unix:///run/user/1000/docker.sock"
set -x PATH "$PATH:/home/user/bin"
