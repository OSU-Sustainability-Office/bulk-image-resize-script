# bulk-image-resize-script
This script performs a bulk image resize for the Energy Dashboard. It will create two versions of the same image (full and thumbnail) and optimize for web.

## Dependencies

Before running the script, ensure you have the `imgp` tool installed.

 - Debian Linux: Refer to [https://github.com/jarun/imgp](https://github.com/jarun/imgp).
 - MacOS: Refer to [https://github.com/jarun/homebrew-imgp](https://github.com/jarun/homebrew-imgp).

This script was developed and tested on Mac OS X Catalina. It should be compatible with Linux (or a Bash emulator), but I'm not guaranteeing compatibility! :)

## Usage

  1. Clone this github repo
  2. Run the script - `./bulkImageResize -create` to create the input and output directories.
  3. Copy the images you wish to resize to the `input` directory.
  4. Run the script - `./bulkImageResize` to resize!
  5. Optionally, you can delete the input and output directories recursively with `./bulkImageResize -remove`.
