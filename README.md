# gif-image-dreamer
GIF creation utility based on Dhar's [image-dreamer](https://github.com/Dhar/image-dreamer) repo.

## What's it do?
Creates a variable amount of pictures based on customizable settings and creates looped and morphing GIFs from these.

Read the [Google Research blog post on "Inceptionism"](http://googleresearch.blogspot.ch/2015/06/inceptionism-going-deeper-into-neural.html) to learn more about how it works.

## Installation
 * Install [Vagrant](https://www.vagrantup.com/)
 * Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
 * Install [OpenSSH](http://sshwindows.sourceforge.net/download/)
 * Download this repo, extract contents to your Vagrant\bin folder, eg. C:\HashiCorp\Vagrant\bin
 * Open Windows Powershell (Start button -> type Powershell)
 * cd to your gif-image-dreamer folder, eg. `cd C:\HashiCorp\Vagrant\bin\gif-image-dreamer-master`
 * `vagrant up`
 * Go grab a coffee, this will take a while
 * `vagrant ssh`
 * Hit enter, then type "vagrant" as the password
 * Welcome to linux!
 * `cd /Vagrant`
 * `sudo apt-get imagemagick`

### Note
It is highly recommended you disable logging from pycaffe as it will clutter your screen with repetitive noise and make debugging harder. To do so, go to your root folder (hit `cd ..` if you are in the Vagrant folder) then type `cd home/vagrant/caffe/python/caffe` followed by `nano __init__.py`. Make sure the file looks like [this](http://i.imgur.com/QOcJMhQ.png), then hit Ctrl-X, Y, Enter. `cd /Vagrant` to head back.

## Usage
 * Copy any images you want to "dreamify" into the `gif-image-dreamer` directory
 * When in the vagrant directory (which corresponds to the `gif-image-dreamer` directory on windows), hit `sh deepdream.sh` for detailed instructions
 * Freak out!
 * Remember to move generated pictures to another folder before running the script again

## Credits
Thanks to [Dhar](https://github.com/Dhar) for the repo on which this is based.

Thanks to redditor senor_prickneck for an excellent [Newbie guide](http://www.reddit.com/r/deepdream/comments/3c2s0v/newbie_guide_for_windows/) which I've adapted to this repo.

Thanks to the great work of Google's [deepdream](https://github.com/google/deepdream/blob/master/dream.ipynb) team!

The Vagrant file and Vagrantbox are based on those provided by [Data Science Toolbox](http://datasciencetoolbox.org/).  Big thanks to them for providing the scientific Python bootstrap I needed to get this going!
