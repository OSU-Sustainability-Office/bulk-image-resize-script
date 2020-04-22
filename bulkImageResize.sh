#! /bin/bash

# Create the directories
if [ "$1" = "-create" ]; then
  mkdir ./input
  mkdir ./output
  mkdir ./output/fullSize
  mkdir ./output/thumbnails
  exit 0
fi

# Remove the output directories
if [ "$1" = "-remove" ]; then
  rm -rf ./output
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
for file in ./output/fullsize/*; do # Removes the _IMGP from the filenames that imgp adds
    mv "$file" "${file/_IMGP/}"
done

# Next, create all of the thumbnails
echo "Creating optimized thumbnails..."
imgp -cmpx 400x0 ./input

echo "Copying thumbnails to output..."
mv ./input/*_IMGP.jpg ./output/thumbnails
for file in ./output/thumbnails/*; do # Removes the _IMGP from the filenames that imgp adds
    mv "$file" "${file/_IMGP/}"
done
