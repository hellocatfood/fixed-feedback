#!/bin/bash

# applies a video feedback effect to still images.
# usage: ./fixedfeedback.sh input_image.png 10
# this would apply the feedback effect 10 times to the image.png image and 
# output the result as input_image_feedback.png

inputfile=$(basename -- "$1")
extension="${inputfile##*.}"

# get the dominant color in an image and remove it
color=$(convert \( $1 -coalesce -flatten -resize 1x1 \) -format "%[pixel:u.p{0,0}]" info:)

# fuzzy colour selection threshold. increase if no colours are removed
fuzz=42

loop=1

# copy the file to avoid overwriting/corrupting the original
convert $1 ${inputfile%.*}_feedback.miff

while [ $loop -le $2 ]
	do echo "loop $loop of $2" 
	convert \( ${inputfile%.*}_feedback.miff -fuzz $fuzz% -transparent $color -distort SRT  0.96,0 -modulate 100,101,102 -threshold 50% -negate \) \
		null: \
		\( ${inputfile%.*}_feedback.miff -fuzz $fuzz% -transparent $color \) \
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
