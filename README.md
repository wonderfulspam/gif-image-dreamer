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
 * Hit enter, then type `vagrant` as the password
 * Welcome to linux!
 * `cd /vagrant`
 * `sudo apt-get imagemagick`

### Note
It is highly recommended you disable logging from pycaffe as it will clutter your screen with repetitive noise and make debugging harder. To do so, go to your root folder (hit `cd ..` if you are in the Vagrant folder) then type `cd home/vagrant/caffe/python/caffe` followed by `nano __init__.py`. Make sure the file looks like [this](http://i.imgur.com/QOcJMhQ.png), then hit Ctrl-X, Y, Enter. `cd /vagrant` to head back.

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

Layers not included in any of the categories are listed as comments in `dreamifyArgs.py`. Simply uncomment them to include them when randomising patterns.

Use --animals to turn on animal shape layers
Use --noeyes to turn off layers that produce eye/button like shapes
Use --onlyanimals or --onlyeyes to only use animal or eye layers

| Name | Random | Animals | Eyes | Notes |
|------|:------:|:-------:|:----:|-------|
| conv1/7x7_s2 | | | | Very blurry |
| pool1/3x3_s2 | | | | Very grainy |
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
| inception_3b/1x1 | | | | Lots of dots and buttons |
| inception_3b/3x3 | | | | Similar but with a grainier almost mossy feel |
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
| inception_4b/1x1 | | | X | Round patterns with buttons |
| inception_4b/3x3 | | X | | As above but with dogs |
| inception_4b/3x3_reduce | | X | | More dogs |
| inception_4b/5x5 | | X | | Some glitchiness, traces of strange animals |
| inception_4b/5x5_reduce | | X | | Weird blowfish-like animal shapes |
| inception_4b/output | | X | | As above with swirling patterns |
| inception_4b/pool | | X | | Lots of dogs now |
| inception_4b/pool_proj | | X | | As above |
| inception_4c/1x1 | | | | Weird, round, fungus-like shapes and swirliness |
| inception_4c/3x3 | | | | Hints of animals and eyes, and snails |
| inception_4c/3x3_reduce | | X | | Some sort of blowfish-slug-bird amalgam appears |
| inception_4c/5x5 | | | X | Leaves some of the picture be but goes all in on eyes where it's applied |
| inception_4c/5x5_reduce | | | X | Fungus and some eyes. Traces of animals with legs |
| inception_4c/output | | X | | Getting some bird-like creatures with a sluggish appearance |
| inception_4c/pool | | X | | Dogs and slugs and feet |
| inception_4c/pool_proj | | X | | Blowfish dogs! |
| inception_4d/1x1 | | X | | Mostly birds, some dog faces too |
| inception_4d/3x3 | X | | | Buildings appear, only hints of animals |
| inception_4d/3x3_reduce | | X | | The blowfish birds are back |
| inception_4d/5x5 | | X | | Legs and sluggish creatures |
| inception_4d/5x5_reduce | | X | | As above |
| inception_4d/output | | | | Kind of glitchy, slightly animal-ish |
| inception_4d/pool | | X | | Dogs and birds up in here |
| inception_4d/pool_proj | | X | | Dogs, birds and ... pagodas? |
| inception_4e/1x1 | | X | | Getting dinosaur-like creatures and mines |
| inception_4e/3x3 | | | | Only hints of animals, not a very heavy effect |
| inception_4e/3x3_reduce | | X | | Porcupines |
| inception_4e/5x5 | | | | Indeterminable patterns, hints of animals |
| inception_4e/5x5_reduce | | | | As above |
| inception_4e/output | | | | And again |
| inception_4e/pool | | X | | Lots of animals, traces of buildings |
| inception_4e/pool_proj | | X | | As above |
| pool4/3x3_s2 | | X | | More subtle but definite animal shapes |
| inception_5a/1x1 | | X | | Glitchy porcupines |
| inception_5a/3x3 | | X | | Creatures are becoming reptilian |
| inception_5a/3x3_reduce | | X | | Animals less prominent, traces of buildings |
| inception_5a/5x5 | | | | Only hints of animals |
| inception_5a/5x5_reduce | | | | Same, slightly glitchier |
| inception_5a/output | | X | | The genetically modified reptilians have returned |
| inception_5a/pool | | X | | As above |
| inception_5a/pool_proj | | X | | Getting lots of birds now |
| inception_5b/1x1 | | X | | Subtle reptiles |
| inception_5b/3x3 | | X | | Reptiles now mutating into sharks |
| inception_5b/3x3_reduce | | X | | And back |
| inception_5b/5x5 | | | | Mostly glitchiness |
| inception_5b/5x5_reduce | | X | | Reptiles again |
| inception_5b/output | | | | Mostly glitchy |
| inception_5b/pool | | | | Animal-y shapes but mostly subtle |
| inception_5b/pool_proj | | X | | Birds and reptiles |
| pool5/7x7_s1 | | | | Glitchy etchings |


