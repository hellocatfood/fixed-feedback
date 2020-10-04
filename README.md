# Fixed Feedback

Fixed Feedback is a collection of two scripts for applying a video feedback effect onto statitc images. This effect is typically achieved by using video synthesiser and plugging the output into one of its inputs, creating an endless repetition of an image.

The rationale behind these scripts is that typically the resolution video synths output is Standard Definition (SD/720x480) or constrained to the size of the screen. If you need high resolution images the output from these video synths might not be appropriate.

These scripts work by taking an iput image (ideally one with transparent areas) and layering x copies of it. `fixedfeedback.sh` simply merges x copies, and `fixedfeedback_key.sh` first attempts to remove the dominant colour in an image and then merge x copies of the image.

These scripts are really slow, especially if you use large images or long/big gifs. Any ImageMagick experts that can improve it please do!

This script was first [created in 2015](https://gist.github.com/hellocatfood/9587f1d83ad1e15bcf8a) and used in [this video](https://www.youtube.com/watch?v=6Jrw2XproUg). This update adds ability to process animated gifs.

Input file

![example image](https://media.giphy.com/media/WoXtslW4ptgtYjRVXz/giphy.gif) 

Output file

![example image](https://media.giphy.com/media/jR06ub8jXk4ejsIhOo/giphy.gif)

## Dependencies

ImageMagick (version 6 used, not tested on 7)

## Usage.

`./fixedfeedback.sh inputimage.png 10`

Replace inputimage with your input image. Using 10 will layer 10 copies of image. The file will be saved in the directory containing the script

## Notes
