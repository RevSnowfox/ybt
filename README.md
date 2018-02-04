# Youtube-dl Batch Tools (YBT)

Youtube-dl Batch Tools, or YBT is a small collection of related MS-DOS style batch files to ease the use of the popular command-line media ripper script [youtube-dl](http://youtube-dl.org/).

The v1 collection includes 3 batch files:
* ybt.bat (ytp – simple download helper)
* ybtp.bat (ytp **p** – playlist/user/channel download helper)
* ybtb.bat (ytp **b** – bulk download helper)

# Usage

You should put the batch files in the same directory as `youtube-dl.exe`. You can use Total Commander's command prompt or Windows' *Run...* function or `cmd.exe` to use them. Having `ffmpeg.exe` or `avconv.exe` in the same directory is not mandatory, but recommended for youtube-dl to be able to download higher quality videos with muxing.

Syntax:

`ybt YT_video_URL`

`ybtp YT_playlist_URL`

`ybtb text_file_with_URLs`

All three will ask for a format code, enter it according to youtube-dl expectations or just press Enter for a default choice. The default will try the following options:

*regular 1080p DASH video \[format 137] / best mp4 video equal to or under 1080p / regular 720p DASH video \[format 136] / best mp4 video equal to under 720p*

and

*regular AAC (m4a) sound \[format 140] / best AAC (m4a) sound / best sound*

# Notes

These batch files are intended to work with `youtube-dl.exe`, so they don't need neither Python nor the `youtube-dl` Python script. I tried to make these scripts run on anything from Windows XP to Windows 10, so they use only built-in commands and more-or-less universal batch tricks.

ybtp and ybtb will generate archive checklist files (`playlist.checklist.txt` or `(text_file).checklist.txt`), these are required for youtube-dl's archive skip function, so it will skip already downloaded videos. If you find a small `bell` file in the working directory when aborting/killing a batch job, you can delete it.

I know that these could be done in one single batch file and it could accept multiple parameters/take more user input, but I'm lazy to do it that way right now.

Enjoy.
