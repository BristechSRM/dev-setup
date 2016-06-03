# BristechSRM
 Bristech Speaker Management System

# Development Environment

## Local Installations
The development dependencies for this project come in the form of a [vagrant](https://www.vagrantup.com) box definition. Vagrant is essentially a way to manage virtual machines and can be downloaded from [here](https://www.vagrantup.com/downloads.html).

While vagrant manages virtual machines, it does not actually run them. For that you will need a virtual machine provider. Currently the project supports only [VirtualBox](https://www.virtualbox.org) as a provider. Download from [here](https://www.virtualbox.org/wiki/Downloads).

## Vagrant up
>Note: The default password for the vagrant user is `vagrant`

With the two dependencies installed you can now clone this repository and from base directory run `vagrant up`. This will pull a linux distro image and provision box with several scripts installing the necessary dependencies to build and run the project from vagrant. It'll take a while so feel free to pop to sainsburys for team cookies.

When vagrant up is complete, the vagrant user will be logged out. Log back in with the password `vagrant`. This is done because we are setting user groups for docker. These cannot be used until the user logs out and back in. 

### Initial User Configuration
In addition to configuration set as apart of vagrant up, there are some configuration settings that are custom for each user. To Ensure these are set, run `./firstUpConfig.sh` after your first vagrant up of the vagrant box (I.e. when creating a clean box, not when you bring up a suspended box).

### Windows Gotchas
1. Since the source code is hosted in windows and just mounted in unix, the files contain dos style newlines. You may have trouble running scripts from the box. Run `dos2unix <file>` from windows to fix.

### Configuring Vagrant
Vagrant can be configured from the `Vagrantfile` in the base directory of this project. Our configuration file can be seen in three sections.

1. #### Base image
 	Where the box is provisioned from. Hashicorp have a catalogue of images you can use [here](https://atlas.hashicorp.com/boxes/search). The default setup is a lightweight ubuntu desktop. If your machine is particularly light on resources you may want to switch to a headless version. The provision scripts have been written for ubuntu 14.04, they are unlikely to work at all for a non ubuntu distro and should be checked before switching version (see files in: `<repo>/scripts`).

2. #### Provider settings
	This is the virtualBox settings used when the box is spun up. Here you may want to increase/reduce RAM, video memory etc. [Click Here for more](https://www.vagrantup.com/docs/virtualbox/configuration.html)

3. #### Provision
	After the box is spun up it's provisioned from several scripts in `<repo>/scripts`. These are split into self-explanatory names and are not interdependent so can be commented out if from the `Vagrantfile` if unwanted (e.g. only doing backend development)

### What's inside the box

Once the box has spun up and is fully provisioned you can navigate to `/workspace` and see that the directory from which you ran the `vagrant up` command has been mounted. From here you will be able to build and run the project.

## Building backend

### Debugging

When debugging this app from Visual studio / On Windows / Possibly with mono develop (Not checked)
Because of its use of the network interfaces, you'll need to run Visual studio as administrator.
However the better solution is to do the following:

Open a command prompt as administrator and run the following command replacing username with your username

`netsh http ad urlacl url=http://*:9000/ user=username`

After running this command, you won't need to run visual studio as administrator again.

### Natively

#### Build
Run `build.sh` from the base directory of repository.

#### Run
Run the `.exe` that's been stuck in the `./build/output` directory with mono

e.g. `mono build/output/OwinCross.exe`

### In Docker

### Build
In base directory run `sudo docker build -t server .`

### Run
In base directory run `sudo docker run -t server --name server-instance-1`


## Building frontend
The front end is built using [Gulp](http://gulpjs.com/). The gulp configuration is in `front/gulpfile.js` and contains a number of task definitions.
Any task can be run independently with `gulp <task>`. The most fun ones are detailed below:

### Build
Get yourself to the `front` directory (the place to be) and run `gulp build` ( This will by default run all tests and lints).

### Run
From the `front` directory run `gulp watch`. This will start a server that will watch for file changes.
The server is a webpack-dev-server and run javascript files from in memory rather than the bundle produced.

### Other gulps
Testing and linting are available separately with `gulp test` and `gulp lint`
