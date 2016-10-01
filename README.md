# youtube-dl-batchthing
A simple little batch script thing that offers a little menu and does some arguments.

PLEASE NO & SYMBOLS IN THE URL!!!!

This is nothing special, there are probably programs that do this better and easier. But eh.

Just run "Downloader.bat" and follow the instructions. Shouldnt need admin privileges or anything.

Eh this is just a quick thing I made in batch. Make sure all the files are in the same directory as the batch. This readme isnt too important though.

Requires FFMPEG and Youtube-DL. Should look like this: 

![Folder structure](http://i.imgur.com/a5ztJTM.png)

You can download FFMPEG from here:
https://ffmpeg.zeranoe.com/builds/

You can download Youtube-DL from here.
https://rg3.github.io/youtube-dl/

The batch file explains most of it. Just paste the url and let-err rip. Make sure the url has no & symbols, as CMD interprets it as "run this too" and throws in errors.

To get the normal url just either right click the video and click "Copy Video URL" or click "Share" at the bottom.

If the url looks like "https://youtu.be/NJDx9dUcaGA" then it will just download one video, but if it looks like "https://youtu.be/NJDx9dUcaGA?list=PL9BBF61279A47923D" then it will download the whole playlist starting from video 1, not the video in the URL

Files get thrown into a newly created "Downloads" folder, just wait untill you see "Complete" as it may be converting files or something
