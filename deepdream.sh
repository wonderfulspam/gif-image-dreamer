
EXTENSION="jpg"
RUNS="25"
ITERATIONS="10"
LAYER="inception_3b/output"
RANDOMISE="0"
OCTAVES=3
ANIMALS=0
EYES=1
NOGIFS=0
if [ $# -eq 0 ]
then
 clear
 echo ""
 echo ////////////////////////////////////////////////////////////////////////////////////////
 echo "                  Welcome to wonderfulspam's deep dream gif generator!"
 echo ////////////////////////////////////////////////////////////////////////////////////////
 echo ""
 echo ----------------------------------------------------------------------------------------
 echo DESCRIPTION
 echo ----------------------------------------------------------------------------------------
 echo This script generates a series of pictures and gifs using Google Deep Dream via the
 echo pycaffe implementation. It triggers a Python script based on Dhar\'s dreamify.py script
 echo as seen on https://github.com/Dhar/image-dreamer. Each picture is generated using the
 echo previous one as its source, running for a variable amount of iterations and octaves.
 echo ""
 echo Upon completion of the specified number of runs, three gifs are generated:
 echo '<filename>.gif         A simple gif from first to last image'
 echo 'loop_<filename>.gif    A patrol cycle gif that goes from first to last and back'
 echo "morph_<filename>.gif   As above but with one extra 'morph' frame in between each image"
 echo ""
 echo ----------------------------------------------------------------------------------------
 echo PARAMETERS
 echo ----------------------------------------------------------------------------------------
 echo 'COMMAND             DEFAULT               DESCRIPTION'
 echo '-e | --extension    jpg                   File extensions to look for'
 echo '-i | --iterations   10                    No of steps performed by deep dream per octave'
 echo '-l | --layer        inception_3b/output   Layer to use when processing image'
 echo '-o | --octaves      3                     No of octaves per image'
 echo '-r | --runs         25                    No of images to generate'
 echo ""
 echo ----------------------------------------------------------------------------------------
 echo FLAGS
 echo ----------------------------------------------------------------------------------------
 echo 'COMMAND             DESCRIPTION'
 echo '--random            Chooses a random layer for each image'
 echo '--animals           Includes layers that produce animal shapes (when random flag is on)'
 echo '--noeyes            Disables layers that produce eye shapes (when random flag is on)'
 echo '--nogifs            Skips creating gifs'
 echo ""
 echo ----------------------------------------------------------------------------------------
 echo EXAMPLES
 echo ----------------------------------------------------------------------------------------
 echo sh deepdream.sh -i 5 -o 2 -r 10
 echo '\tProduces 10 images with 5 iterations in 2 octaves using default layer'
 echo ""
 echo sh deepdream.sh -e png -l pool3/3x3_s2
 echo '\tLooks for png files, using a custom layer'
 echo ""
echo sh deepdream.sh --random --noeyes
 echo '\tUses random layers exluding animal and eye producing patterns'
 echo ""
 exit 0
fi
while [ $# -gt 0 ]
do
key="$1"

case $key in
    -e|--extension)
    EXTENSION="$2"
    shift # past argument
    ;;
    -i|--iterations)
    ITERATIONS="$2"
    shift # past argument
    ;;
    -l|--layer)
    LAYER="$2"
    shift # past argument
    ;;
    -o|--octaves)
    OCTAVES="$2"
    shift
    ;;
    -r|--runs)
    RUNS="$2"
    shift
    ;;
    --random)
    RANDOMISE="1"
    ;;
    --animals)
    ANIMALS=1
    ;;
    --noeyes)
    EYES=0
    ;;
    --nogifs)
    NOGIFS=1
    ;;
    *)
    echo Invalid parameter: "$1"
    exit 0
            # unknown option
    ;;
esac
shift # past argument or value
done
echo EXTENSION  = "${EXTENSION}"
echo ITERATIONS = "${ITERATIONS}"
echo LAYER = "${LAYER}"
echo OCTAVES = "${OCTAVES}"
echo RANDOMISE = "${RANDOMISE}"

for image in *.$EXTENSION
do
	i="0"
	mv $image $i$image
	while [ $i -lt $RUNS ]
	do
		j=$((i+1))
		echo dreamifyArgs.py "${i}" "${image}" "${ITERATIONS}"
		python dreamifyArgs.py $i$image $j$image $ITERATIONS $OCTAVES $LAYER $RANDOMISE $ANIMALS $EYES
		i=$((i+1))
	done
if [ $NOGIFS -eq 1 ]
then
 echo 'Skipping gifs. Done!'
else
 echo Creating gif ....
 convert %01d$image[0-$i] $image.gif
 echo Creating looped gif ....
 convert $image.gif -coalesce -duplicate 1,-2-1 -quiet -layers OptimizePlus -loop 0 loop_$image.gif
 echo Creating morphing looped gif ....
 convert -morph 1 loop_$image.gif morph_$image.gif
 echo Finished!
fi
done
