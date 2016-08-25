# Raspberry Pi Hello Cross Compile

A special Raspberry Pi Hello World project to demo cross compiling via Docker

* * *

## Usage

Note: These instructions were written for a Mac. Yes a Mac. You perform these steps on a Mac - not a Pi.

To cross compile you need to use a special Docker image that I created. To do that you will need to __[install Docker](https://docs.docker.com/engine/installation/)__.  Once you have done that, do the following:

	mkdir ~/raspberry

	cd ~/raspberry
	
	git clone https://github.com/mitchallen/pi-hello-cross-compile.git --depth=1 hello
	
    docker run -it -v ~/raspberry/hello:/build mitchallen/pi-cross-compile

The first time this runs it will take a while to download the docker image. But once it is cached, subsequent runs should go quickly.

When the run is finished you should find a binary that will only run on a Raspberry Pi located at: __~/raspberry/hello/bin/hello__. It's up to you to figure out how to load it onto your Pi.

* * *

## Makefile

This project contains a Makefile that expects to find the Raspberry Pi Cross Compiler tools located at __/pitools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-gcc__. The tools themselves can be found at [https://github.com/raspberrypi/tools.git](https://github.com/raspberrypi/tools.git).

To put the tools in the correct location (__pitools__), the docker image was created using this command:

    git clone --progress --verbose https://github.com/raspberrypi/tools.git --depth=1 pitools

To cross compile using __gcc__ the Makefile refers to the __gcc__ compiler with this line:

    CC=/pitools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-gcc

For other tools in that folder, browse [here](https://github.com/raspberrypi/tools/tree/master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin).

To get a better sense of how things work, view the Makefile in the root of this repo.

* * *
 
## Repo(s)

* [bitbucket.org/mitchallen/pi-hello-cross-compile.git](https://bitbucket.org/mitchallen/pi-hello-cross-compile.git)
* [github.com/mitchallen/pi-hello-cross-compile.git](https://github.com/mitchallen/pi-hello-cross-compile.git)

* * *

## Contributing

In lieu of a formal style guide, take care to maintain the existing coding style.
Add unit tests for any new or changed functionality. Lint and test your code.

* * *

## Version History

#### Version 0.1.4 release notes

* Restructured Makefile and project structure

#### Version 0.1.3 release notes

* Updated hello message with newlines for easier reading in terminal window

#### Version 0.1.2 release notes

* Added cd command to sample usage

#### Version 0.1.1 release notes

* Added a placeholder so bin folder will be created when cloned.

#### Version 0.1.0 release notes

* Initial release

