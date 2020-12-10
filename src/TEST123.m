clear
close all

%% Set  Background
% This creates the 'background' axes
ha = axes('units','normalized', 'position',[0 0 1 1]);

% Move the background axes to the bottom
uistack(ha,'bottom');

% Load in a background image and display it using the correct colors
I=imread('BetterFireCastle.jpg');
hi = imagesc(I);
colormap gray
% Turn the handlevisibility off so that we don't inadvertently plot into the axes again
% Also, make the axes invisible
set(ha,'handlevisibility','off', 'visible','off')
% Now we can use the figure, as required.
% For example, we can put a plot in an axes
%hb = axes('position',[0.14 0.12 0.8 0.8]);
hold on


%% Pull in Fire Mario

%Fire Mario
FireMarioPic = imread('FireMario.jpeg');
TFireMario = Jpeg2pointsConverter(FireMarioPic,50);

%add vector to make TFireMario 3x____
sizeTFireMario = length(TFireMario);
TFireMario = [TFireMario ; ones(1,sizeTFireMario)];

%rescale TFireMario
scale_TFireMario = [0.15 0 0; 0 0.15 0; 0 0 1];

TFireMario = scale_TFireMario * TFireMario;
%Sample Goomba Plot
%t_TFireMario = scatter(TFireMario(1,:), TFireMario(2,:), 'r.')



 



TFireMario = translate(TFireMario, 450, 250);

hb = axes('position',[0.14 0.12 0.8 0.8]);
h_TFireMario = scatter(hb, TFireMario(1,:),TFireMario(2,:),'r.');
axis([0 800 0 800]);
set(gca,'color','none','handlevisibility','off','visible','off')

%{
%% Test File
A = imread('firepower.jpg');
AA = Jpeg2pointsConverter(A, 150);
AA = [AA ; ones(1,length(AA))];

B = imread('jumpingmario.jpg');
BB = Jpeg2pointsConverter(B, 150);
BB = [BB ; ones(1,length(BB))];

[C,D] = SizeMatch(AA,BB);

Csize = size(C)

Dsize = size(D)

%hold on

hb = axes('position',[0.14 0.12 0.8 0.8]);
h_mario = MorphT(C,D,hb);
%}