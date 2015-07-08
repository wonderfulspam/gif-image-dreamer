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

The Vagrant file and Vagrantbox are based on those provided by [Data Science Toolbox](http://datasciencetoolbox.org/).

## Layers
This is the default configuration of the layers used by the `--random` flag. See [this](http://hideepdreams.tumblr.com/post/123387228638/testing-layers-of-googles-deepdreams) excellent post for a breakdown of each layer.

| Name | Random | Animals | Eyes | Notes |
|------|:------:|:-------:|:----:|-------|
| conv1/7x7_s2 | | | | Very blurry |
| pool1/3x3_2 | | | | Very grainy |
| pool1/norm1 | | | | Like a cheap Photoshop filter |
| conv2/3x3 | | | | Some depth, vaguely reminiscent of dimples |
| conv2/3x3_reduce | X | | | Very heavy, colourful thin long lines |
| conv2/norm2 | | | | Like conv2/3x3 with more colours |
| pool2/3x3_s2 | | | | As above but even busier |
| inception_3a/1x1 | | | | Reasonably light with dots and squares |
| inception_3a/3x3 | X | | | Almost a 3D effect, small lines and variating patterns |
| inception_3a/3x3_reduce | | | | Very busy, rounded patterns and etched lines |
| inception_3a/5x5 | | | | Ladder-like patterns |
| inception_3a/5x5_reduce | | | | As above, with smaller patterns |
| inception_3a/output | | | X | Etched lines and buttons |
| inception_3a/pool | | | | Similar to pool2/3x3_s2 |
| inception_3a/pool_proj | | | | Etched squares and dots |
| pool3/3x3_s2 | X | | | Very trippy, small hints of animals |
| inception_3b/1x1 | | | Lots of dots and buttons |
| inception_3b/3x3 | | | Similar but with a grainier almost mossy feel |
| inception_3b/3x3_reduce | | | X | Ladders and circles |
| inception_3b/5x5 | X | | | Quite busy, rounded squares |
| inception_3b/5x5_reduce | X | | | As above but longer shapes |
| inception_3b/output | | | X | Lots of small dots/eyes/buttons and swirly lines |
| inception_3b/pool | | | X | Somewhere in between the two above |
| inception_3b/pool_proj | | | X | Busier than the above |
| inception_4a/1x1 | | | X | Lots of small buttons |
| inception_4a/3x3 | | | | Quite freaky, animals and eyeballs are starting to appear |
| inception_4a/3x3_reduce | | X | | Definite animal faces |
| inception_4a/5x5 | | | | Weird, almost glitchy |
| inception_4a/5x5_reduce | | | | Hints of animals, still glitchy |
| inception_4a/output | | X | | More animal faces |
| inception_4a/pool | | X | | Approaching bad trip territory |
| inception_4a/pool_proj | | | | Quite intricate patterns, only hints of animals |

Remaining patterns to come.
