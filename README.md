# Arcade (Lincoln build of Arches) #

This repo contains the Lincoln customisations for the arches project. To get started clone this repository and be sure to include the sub modules:
```
git clone git@github.com:k-int/arches-lincoln.git && git submodule update --init --recursive
```

The repo has a develop branch with the idea that this will follow the gitflow methods and 
be merged onto master for deployment to test before being pushed through to live.

## Notes ##
The file at `lincoln/lincoln/settings.py` should contain the settings that are global to the lincoln project and that do not change
whether in dev, test or live. If you need to add deployment specifics please use `lincoln/lincoln/settings_local.py` which should not
be checked into version control.

## Development ##
Open a terminal in the root of this repo and then:
```
docker-compose up
```

### Troubleshooting ###
As the files within this repo are mounted into docker directly, you may need to grant some privileges in order to allow your current,
none-privileged, user and the docker use to change files simultaneously.

On my ubuntu install the docker user is a none standard one (I think because I've had both docker and now docker-ce installed at some point)
of 165536 but it is usually root I think.
In order to allow docker access I changed the group ownership to the docker group, granted group privileges and made those sticky.
```
chown -R :165536 .
chmod -R g+rwxs .
```

### CSS Development ###
The CSS used in the Lincoln project is compiled from SCSS located in the `scss` folder. There is a gulp file setup in the root that sees to it that changes
are watched and css files replaced. To start that process, you need to install npm and then gulp as a global. Then in the root of this dir type:
```
gulp
```

Any changes should be reflected automatically in the css files wihthin the lincoln project.

## Deployment ##
Deploying updates to test and live should now be much more straight forward. There is a dedicated docker-compose file for test,
and one will follow for live. This means the docker compose command now needs to be called with the `-f` flag. The process should now be:

- Stop the services: `docker-compose -f docker-compose-test.yml down`
- Pull changes for the current branch (ideally master or dedicated test branch):
    `git pull && git submodule update --init --recursive`
- Start the services: `docker-compose -f docker-compose-test.yml up`
