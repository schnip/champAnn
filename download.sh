youtube-dl -f 137 https://www.youtube.com/watch?v=2fJLF_yvnZ0 --recode-video mp4
mv Faker\ Stream\ Highlights\ -\ Funny\ Moments\ _\ Pro\ Plays\ -\ League\ of\ Legends-2fJLF_yvnZ0.mp4 faker_origin.mp4
rm faker_demo.mp4
ffmpeg -i faker_origin.mp4 -vcodec copy -acodec copy -ss 00:00:00 -t 00:01:00 faker_demo.mp4
