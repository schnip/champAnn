vr = VideoReader('faker_demo.mp4');
vw = VideoWriter('faker_out');
open(vw);

load('trainedNeural.mat');
champs = textscan(fopen('champnames.txt'), '%s');
champs = champs{1};

while hasFrame(vr)
	frame = readFrame(vr);
	locs = locateChampByHealthbar(frame);
	if ~isequal(locs, [0 0 0 0])
		for i=1:size(locs, 1)
			loc = locs(i,:);
			clips = clip(frame, loc);
			feat = featureDetect(clips);
			iam = net(feat(:));
			cn = champs(find(max(iam) == iam))
			frame = annotateImage(frame, loc, cn);
		end		
	end																					
	writeVideo(vw, frame);
	strcat(num2str(100 * vr.CurrentTime / vr.Duration), ' %')
end
close(vw);