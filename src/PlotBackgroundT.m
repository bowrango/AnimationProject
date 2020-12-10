function [ output_args ] = PlotBackgroundT( ~ )
%   Summary:
%   The following code will let you create a background image in your figure. 
%   To do this, you need to create an axes object that spans the size of the figure, 
%   and then place the image inside this axes.

clf  %This clears the figure, so remove this line if you want to preserve a plot you have already made


% This creates the 'background' axes
ha = axes('units','normalized', 'position',[0 0 1 1]);

% Move the background axes to the bottom
uistack(ha,'bottom');

% Load in a background image and display it using the correct colors
% The image used below, is just a Roadrunner scene I downloaded.
I=imread('BetterFireCastle.jpg');
hi = imagesc(I);
colormap gray
% Turn the handlevisibility off so that we don't inadvertently plot into the axes again
% Also, make the axes invisible
set(ha,'handlevisibility','off', 'visible','off')
% Now we can use the figure, as required.
% For example, we can put a plot in an axes
%axes('position',[0.3,0.35,0.4,0.4])

%This next section is where the previously saved data matrix is loaded.
%When first run, I kept the next three lines, then once I saved the .mat, I changed it to just load it:
%rrunner = imread('coyote_catch_that_roadrunner.jpg');
%rrunnermtx = Jpeg2pointsConverter2(rrunner, 200);
%save rrunnermtx.mat
load rrunnermtx.mat
[m,n]=size(rrunnermtx);
rrunnermtx = 0.075*rrunnermtx;
rrunnermtx = rrunnermtx - [0;20]*ones(1,n);
rrunnermtx_orig = rrunnermtx;

for ii=1:0.5:10
%hb = axes('units','normalized', 'position',[0 0 1 1]);
hb = axes('position',[0 0.1 0.625 0.625]);
h_rr = plot(hb,rrunnermtx(1,:), rrunnermtx(2,:),'r.');

axis([0 70 0 70]) %This let me set the scale I wanted in the inserted axes
set(gca,'color','none','handlevisibility','off','visible','off')

S = [0.9 0; 0 0.9];  %This is my rescaling matrix to shrink the characters as they go down the road
Shift = [2.5*ii;ii]*ones(1,n);
rrunnermtx = S*rrunnermtx + Shift;
pause(0.25)
set(h_rr,'Visible','off')  %This line erases the image of the Road Runner and Wile E. Coyote

end

%Now, reverse image and have them run off cliff and enlarge a bit:
% NOTE: Below I am reversing the axes, so I don't
%need to reverse the image here
%
Rescale = [0.4 0 ; 0 0.4]  %I reset the scale for the size when they appear on the cliff
rrunnermtx = Rescale*rrunnermtx_orig;
%Rotate slightly upward
theta = pi/6;
RR = [cos(theta) -sin(theta); sin(theta) cos(theta)];
rrunnermtx = RR*rrunnermtx;
hc = axes('position',[0.6 0.78 0.4 0.4]);
set(hc,'XDir', 'reverse')  %This sets the axes in "reverse position" so that we can just plot like usual, but 
                                    %the characters move right to left
for jj=1:0.5:10

h_rr2 = plot(hc,rrunnermtx(1,:), rrunnermtx(2,:),'r.');
set(hc,'XDir', 'reverse')

axis([0 70 0 70])
set(gca,'color','none','handlevisibility','off','visible','off')

S = [0.95 0; 0 0.95];  %This will be a rescaling matrix for when they go up the cliff
Shift = [2.0*jj;jj]*ones(1,n);
rrunnermtx = S*rrunnermtx + Shift;
pause(0.25)
set(h_rr2,'Visible','off')

end



end

