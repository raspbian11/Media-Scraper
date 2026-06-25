Run the bat file in CMD with the following arguments
copy.bay {SOURCE} {DESTINATION} {TYPE}

SOURCE --------------
literally just the souce folder. there can be subfolders

DESTINATION -----------------
Its the destination of where you want the copid files to go

TYPE----------
DO NOT USE "." before file type, simply just mp3 or jpg
-all_immage = scans for all immage file types
-all_video = scans for all video types
-all_audio = scans for all audio types

EXAMPLE
copy.bat C:/Users/Raspbian11/Music/ C:/Users/Raspbian11/extract mp3

IF THERE IS NO DESTINATION FILE SPECIFIED IT WILL MAKE A NEW DIRECTORY CALLED DEST
