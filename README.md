# osu! Font Converter
Created for the game osu! to make skinning numbers a bit easier.
Creates transparent .png files for combo, default, and score numbers and characters provided a ttf or otf font.

## How to use?
Find a ttf or otf font you like. [Google Fonts](https://fonts.google.com/) has a wide variety of free fonts available to download.

Download and extract the [.zip from releases](https://github.com/VisMajorSpeedruns/osu-font-converter/releases/) and run the exe. (or download the source and install [Processing](https://processing.org/), then open one of the .pde files and run it from the processing IDE)

You will be prompted to select a ttf or otf font file. You can then select one of the modes at the bottom (selected modes are highlighted red) and adjust the settings of the font with the wasd or arrow keys.

The edges of the gray rectangles show where the edges of the created transparent .png files will be.

When you are ready, make sure the modes you want to export are selected (the default, combo, and score buttons above export. Again, red means they are selected), then hit the export button. The @2x png files will be in a folder called export in the base program directory.

## Questions nobody has asked

### Why doesn't it create the SD files?
People often want to re-color or add edge glow or other effects to their numbers. If you are creating a skin, it will be more efficient to do these things once to the HD files and then scale them down. If you only want the sd files, just make the size smaller before exporting and rename the files.

### Why Processing?
I'm familiar with it from other image manipulation projects.

### Do you plan to continue this project?
If it sounds useful to people and I can figure it out, I'd like to re-write this in p5.js as an app on a github page so people don't have to download anything to use it. This version probably won't be continued.

### Gee your code is messy
Yeah I didn't expect to release this until I was already almost done. Works though.
