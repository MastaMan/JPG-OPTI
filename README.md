# Image Converter and Optimizer

This repository contains a simple batch script for Windows that automates the conversion, resizing, and optimization of images.

## Features

- Converts `.png` and `.hdr` files to `.jpg`
- Optional resizing to a maximum width of 2048 pixels (preserving aspect ratio)
- JPEG quality control (default is 85, recommended is 95)
- Strips metadata and applies progressive compression using `jpegoptim`
- Simple command-line interface with user prompts
- Automatically opens the output folder when done

## Requirements

Place the following tools inside the `ENGINE` folder:

- `convert.exe` (from ImageMagick)
- `jpegoptim.exe`
- *(optional)* `optipng.exe` — if PNG optimization is needed

## Usage

1. Copy your `.jpg` or `.png` files into the root folder.
2. Run the `START_OPTIMIZE.BAT` script.
3. Enter the desired JPEG quality (0–100).
4. Choose whether to resize images to a maximum width of 2048px.
5. Processed images will appear in the `OUTPUT` folder.

## Example

```cmd
> optimize.bat

Quality (0-100): 95  
Resize to max width 2048px? (y/n): y

```

## Output
- All converted and optimized .jpg files will be stored in the `OUTPUT` folder.
- Original .png and .hdr files are deleted after processing.
- If resizing is enabled, images wider than `2048px are scaled down proportionally.
- Metadata is stripped and images are saved in progressive JPEG format for better web performance.

## License
This project is free to use, modify, and distribute.  
__Note__: All .exe utilities used by this script (such as *convert.exe*, *jpegoptim.exe*, and *optipng.exe*) are developed and maintained by third-party developers.  
This script simply automates their usage and does not redistribute or modify those executables.
