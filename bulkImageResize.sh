#! /bin/bash

# Create the directories
if [ "$1" = "-create" ]; then
  mkdir ./input
  mkdir ./output
  mkdir ./output/fullSize
  mkdir ./output/thumbnails
  exit 0
fi

# Remove the directories
if [ "$1" = "-remove" ]; then
  rm -rf ./input
  rm -rf ./output
  rm -rf ./output/fullSize
  rm -rf ./output/thumbnails
  exit 0
fi

# Ensure the directories have been created
if [ ! -d ./input ] | [ ! -d ./output ]; then
  echo "Please make sure the required directories have been created. Refer to the readme!"
  exit 1
fi

# Proceed with resizing all of the images in 'input'
# First, create all of the large size images
echo "Optimizing full size images..."
imgp -cmp ./input

echo "Copying full size images to output..."
mv ./input/*_IMGP.jpg ./output/fullSize

# Next, create all of the thumbnails
echo "Creating optimized thumbnails..."
imgp -cmpx 400x0 ./input

echo "Copying thumbnails to output..."
mv ./input/*_IMGP.jpg ./output/thumbnails
