# Lean 4 Web

This is a web version of Lean 4. In contrast to the [Lean 3 web editor](https://github.com/leanprover-community/lean-web-editor), in this web editor, the Lean server is
running on a web server, and not in the browser.

## Security
Providing the use access to a Lean instance running on the server is a severe security risk. That is why we start the Lean server in a Docker container secured by gVisor.

## Build Instructions

We have set up the project on a Ubuntu Server 22.10.
Here are the installation instructions:

Install Docker:
https://docs.docker.com/engine/install/ubuntu/

To be able to run docker containers as a regular user,
add yourself to the `docker` group:
```
sudo groupadd docker
sudo usermod -aG docker ${USER}
newgrp docker
```
Install gVisor:
https://gvisor.dev/docs/user_guide/install/#install-from-an-apt-repository

To make sure that docker knows about gVisor, run these commands:
```
sudo runsc install
sudo systemctl reload docker
```

Install NPM (don't use `apt-get` since it will give you an outdated version of npm):
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
source ~/.bashrc
nvm install node npm
```

Install jq:
```
sudo apt-get install jq
```

Now, install `git` and clone this repository.
Navigate into the cloned repository and
run
```
npm install
npm run build
```

Now the server can be started using
```
PORT=8080 npm run production
```

To set the locations of SSL certificates, run
```
SSL_CRT_FILE=/path/to/crt_file.cer SSL_KEY_FILE=/path/to/private_ssl_key.pem npm run production
```

## Development Instructions

Install [npm](https://www.npmjs.com/) and clone this repository. Inside the repository, run
`npm install` to install dependencies, and
then `npm start`.
The project can be accessed via http://localhost:3000. (Internally, websocket requests to `ws://localhost:3000/`websockets will be forwarded to a Lean server running on port 8080.)
