# CMS Team 23 - Local Environment. 
## Scotchbox w/ Wordpress preconfigured using WPDistillery w/ UnderStrap starter theme installed.


## Dependencies (Before running ```vagrant up```)

- Install [ScotchBox](https://box.scotch.io) (using [Vagrant](https://vagrantup.com) & [Virtualbox](https://virtualbox.org))
- Run Terminal Command - [Vagrant Hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater) (`vagrant plugin install vagrant-hostsupdater`)

## Setup
1. Currently there's an [issue](https://github.com/scotch-io/scotch-box/issues/296) related to [ScotchBox](https://github.com/scotch-io/scotch-box) that hinders Vagrant from mounting VirtualBox Shared folders. The solution is to install [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest) before running vagrant. This will install the correct vbguest package into the box:

```
vagrant plugin install vagrant-vbguest
vagrant vbguest
```

2. Run `vagrant up` from where your `Vagrantfile` is.

3. Done! You can now access your project at the local URL (http://jazzclubtownsville.local) or (http://192.168.33.10/)

## Alternate Startup

> Ensure You Have Nodejs and npm installed

> These Will Run: Vagrant Up, NPM Install, Gulp Watch

- On Linux Run: deployment.sh

- On Windows Run: deployment.bat

## Specs of Vagrant Box
### Scotch Box 3.5:
* Ubuntu 16.04!
* PHP 7!
* MySQL 5.7!
* NGNIX Option!
* Go lang in the box
* PHPUnit in the box
* Yarn


## Sources
- Scotchbox [box.scotch.io](https://box.scotch.io)
- WPDistillery [wpdistillery.org](https://wpdistillery.org/)