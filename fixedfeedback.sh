#!/bin/bash

# applies a video feedback effect to still images.
# usage: ./fixedfeedback_key.sh input_image.png 10
# this would apply the feedback effect 10 times to the image.png image and 
# output the result as input_image_feedback.png

inputfile=$(basename -- "$1")
extension="${inputfile##*.}"

loop=1

# copy the file to avoid overwriting/corrupting the original
convert $1 ${inputfile%.*}_feedback.miff

while [ $loop -le $2 ]
	do echo "loop $loop of $2" 
	convert \( ${inputfile%.*}_feedback.miff -distort SRT  1.01,0 -threshold 50% -negate \) \
		null: \
		\( ${inputfile%.*}_feedback.miff \) \
		-background none \
		-layers composite \
		${inputfile%.*}_feedback.miff

# uncomment to save each loop as a separate file
# useful for animating a still image
# convert ${inputfile%.*}_feedback.miff ${inputfile%.*}_feedback_loop_"$loop".$extension

loop=$(($loop + 1))

done

# save the final version of the file
convert ${inputfile%.*}_feedback.miff ${inputfile%.*}_feedback."$extension"

# clean up temporary files
rm ${inputfile%.*}_feedback.miff
