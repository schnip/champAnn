vr = VideoReader('faker_demo.mp4');
vw = VideoWriter('faker_out');
open(vw);
while hasFrame(vr)
	frame = readFrame(vr);
	strcat(num2str(100 * vr.CurrentTime / vr.Duration), ' %')
	writeVideo(vw, frame);
end
close(vw);