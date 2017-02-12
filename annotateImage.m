function [output] = annotateImage(img, vec4, champname)
% Renders the box and name text on to the image, then returns the updated image

img(vec4(1):vec4(3),(vec4(2)-2):(vec4(2)+2),1) = 200; %left bar
img(vec4(1):vec4(3),(vec4(2)-2):(vec4(2)+2),2) = 0; %left bar
img(vec4(1):vec4(3),(vec4(2)-2):(vec4(2)+2),3) = 0; %left bar
img(vec4(1):vec4(3),(vec4(4)-2):(vec4(4)+2),1) = 200; %right bar
img(vec4(1):vec4(3),(vec4(4)-2):(vec4(4)+2),2) = 0; %right bar
img(vec4(1):vec4(3),(vec4(4)-2):(vec4(4)+2),3) = 0; %right bar
img((vec4(3)-2):(vec4(3)+2),vec4(2):vec4(4),1) = 200; %bot bar
img((vec4(3)-2):(vec4(3)+2),vec4(2):vec4(4),2) = 0; %bot bar
img((vec4(3)-2):(vec4(3)+2),vec4(2):vec4(4),3) = 0; %bot bar
img((vec4(1)-2):(vec4(1)+2),vec4(2):vec4(4),1) = 200; %bot bar
img((vec4(1)-2):(vec4(1)+2),vec4(2):vec4(4),2) = 0; %bot bar
img((vec4(1)-2):(vec4(1)+2),vec4(2):vec4(4),3) = 0; %bot bar

opacity = 1; %clear text box
box_color = 'black';
text_color = 'red';
position = [(vec4(2)+vec4(4))/2 vec4(1)];
font = 20;
output = insertText(img,position,champname,'FontSize',font,'BoxColor',box_color,'BoxOpacity',opacity,'TextColor',text_color,'AnchorPoint','Center');

%figure
%imshow(output)