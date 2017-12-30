# FORUM APP

This application simulates a little forum app with:

* User (sign in | sign up | sign out);
* Topic (list | search | create | update | delete);
* Posts (create | delete);

## Application stack:

The application is divided in two parts:

* Backend;
* Frontend;

### Backend

The backend stack is:

* Ruby (2.4.2) / Rails (5.1) / Devise;
* PostgreSQL;
* Elasticsearch;

The Rails application was tested using `RSpec`;

**PS:** The backend API can be accessed [here](https://github.com/lucasmedeirosleite/forum-api/blob/master/README.md)

### Frontend

The frontend stack is:

* ReactJS;
* React Router;
* Redux;
* ReduxForm;
* ReduxPromise;
* Axios (for http requests to the backend);

The frontend was tested using `Jest`;

#### Running locally

##### Installing Dependencies

If you're a **Linux** user, follow the steps bellow:

1. install [Docker for Linux][docker-linux].


If you're a **macOS** user, follow the steps bellow:

1. install [VirtualBox][virtual-box];
2. install [Docker Compose][docker-compose] using Homebrew, `brew update` and `brew install docker-compose`.
This command will install `docker`, `docker-machine` and `docker-compose`;
3. run `docker-machine create default --driver virtualbox --virtualbox-memory "5000"`
4. you will need to `eval $(docker-machine env)` everytime, so you can configure that in the `.zshrc` or `.bashrc`;
5. install [NFS for Docker Machine][docker-machine-nfs] and follow its installation instructions.


If you're a **Windows** user, follow the steps bellow:

1. install [Docker for Windows][docker-windows];
2. install [VirtualBox][virtual-box];
3. install [Docker Machine][docker-machine];
4. run `docker-machine create default --driver virtualbox --virtualbox-memory "5000"`
5. you will need to `eval $(docker-machine env)` everytime, so you can configure that in the `.zshrc` or `.bashrc`;


###### Set up GitHub

1. Make sure your SSH key is configured to your GitHub account;
2. If **not**, [follow this tutorial][gh-generating-ssh-keys].


###### Profit

**Attention**
Some steps bellow does not apply to **Linux** or **Windows** users:

❌ Linux: 3, 5, 6 steps
❌ Linux and Windows: 6 step

1. clone the repository: `git clone --recursive git@github.com:lucasmedeirosleite/forum-app.git`
2. `cd forum-app`
3. check your virtual machine ip with `docker-machine ip`
4. replace REACT_APP_API_HOST value at `forum-webapp/.env` with this `http://${MACHINE_IP}:3000` or `localhost://3000` for Linux users
5. `docker-machine start`
6. activate NFS: `docker-machine-nfs default`
7. Run `docker-compose up` ⚠️
8. drink a ☕️ or 🍺, according to your preference
9. The forum app will be available at `http://${MACHINE_IP}:4000` or at `localhost://4000` for Linux users

##### Suggestions

###### Running Docker without sudo on Linux
1. Create the `docker` group.
`$ sudo groupadd docker`

2. Add your user to the docker group.
`$ sudo usermod -aG docker $USER`

3. Log out and log back in so that your group membership is re-evaluated.
4. Verify that you can run docker commands without `sudo`.
`$ docker run hello-world`

##### Running tests

###### Backend tests

`docker-compose run api bin/rspec spec`

###### Frontend tests

`docker-compose run web yarn spec`

##### Reindexing Elasticsearch

`docker-compose run api bin/rails c`

`Topic.reindex`

[docker-linux]: https://docker.github.io/engine/installation/
[docker-macos]: https://docs.docker.com/docker-for-mac/
[docker-windows]: https://docs.docker.com/docker-for-windows/

[virtual-box]: https://www.virtualbox.org/wiki/Downloads

[docker-machine]: https://docs.docker.com/machine/install-machine/
[docker-machine-nfs]: https://github.com/adlogix/docker-machine-nfs

[docker-compose]: https://docs.docker.com/compose/install/

[gh-generating-ssh-keys]: https://help.github.com/articles/generating-ssh-keys/
