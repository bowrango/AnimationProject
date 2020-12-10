%% First Transition Slide (World 1-1) and General Transition Setup:

% NOTE: Functions labeled with a "C" belong to Chris, those labeled with a
% "T" belong to Tim, those labeled with "_ian" belong to Ian and those
% labeled with 

transition_1_slide = imread("transition_1.jpg");
transition_2_slide = imread("transition_2.jpg");
transition_3_slide = imread("transition_3.jpg");
transition_4_slide = imread("transition_4.jpg");
game_over_slide = imread("game_over_screen.jpg");

% Clear the current background and objects without closing the figure
% window, then display the transition slide (World 1-N)

clf('reset')
transition_axes_1 = axes('units','normalized', 'position',[0 0 1 1]); 
pause(10);
uistack(transition_axes_1,'bottom');
transition_display_1 = imagesc(transition_1_slide);
set(transition_axes_1,'handlevisibility','off', 'visible','off');
set(gca,'color','none','handlevisibility','off','visible','off');
pause(2);
clf('reset')

%% Intro

% This main script outlines an adventure of Mario, where he travels from
% level to level. Each of us is responsible for a particular scene (level)
% in the animation. We will implement a generic set of transformation
% functions which take in a Mario position vector, and output a new
% position vector based on the transformation. Additional functions will also
% be used to handle logistics of the animation, such as a background. 

%% SCENE 1 - Chris

% SCENE 1 
% =======
% (Panning Camera) Large background, smaller view follows mario
% Background:SunnyMarioLevel.jpg
% est Duation:28 seconds 

% >>>>>>> cc452f124fdb637c58e7cab0a1d075b8379e474f

% images to 3x3 matrices
Jmario = imread('jumpingmario.jpg');
mushroom = imread('mushroom.jpg');
goomba = imread('goomba.jpg');
redgoomba = imread('goomba.jpg');
Jmario = Jpeg2pointsConverterC(Jmario, 150);
mushroom = Jpeg2pointsConverterC(mushroom, 200);
goomba = Jpeg2pointsConverterC(goomba, 150);
redgoomba = Jpeg2pointsConverterC(redgoomba, 150);
Jmario(3,:) = ones(1, length(Jmario));
mushroom(3,:) = ones(1, length(mushroom));
goomba(3,:) = ones(1, length(goomba));
redgoomba(3,:) = ones(1, length(redgoomba));


clf
% establishing background
ha = axes('units','normalized', 'position',[0 0 1 1]); 
uistack(ha,'bottom');
bg = imread('SunnyMarioLevelV2.jpg');
hi = imagesc(bg(400:1000,1:600, 1:3));
hb = axes('position',[0 0 1 1]);
set(ha,'handlevisibility','on', 'visible','off');
hold on; 
% scaling

mushroom = scaleC(mushroom, 1/8, 1/8);
Jmario = scaleC(Jmario, .3, .3);
goomba = scaleC(goomba, .2, .2);
redgoomba = scaleC(redgoomba, .2, .2);

axis([0 800 0 800]); axis manual
mushroom = translateC(mushroom, 600, 50);
Jmario = translateC(Jmario, 0, 60);
redgoomba = translateC(redgoomba, 400, 60);

h_Jmario = scatter(hb, Jmario(1, :), Jmario(2, :), 'r.');
h_mushroom = scatter(hb, mushroom(1, :), mushroom(2, :), 'k.');

set(gca,'color','none','handlevisibility','off','visible','off');
% Mario standing still and further away mushroom. (2 Seconds)
% No transformations, Stand still frame  
% Jumping Mario, Mushroom
pause(.2)

% Mario does a flip in and air and lands back down (3 seconds)
% Mario shifts and rotates
% Asset(s): Jumping Mario, Mushroom
% R = [cos(pi/18) -sin(pi/18) 0; sin(pi/18) cos(pi/18) 0; 0 0 1];
for i = 1:12
     Jmario = translateC(Jmario, 0, 30);
     Jmario = rotateC(Jmario, pi/12);
     delete(h_Jmario);
     h_Jmario = scatter(hb, Jmario(1, :), Jmario(2, :), 'r.');
     pause(.05)
end

for i = 1:12
     Jmario = translateC(Jmario, 0, -30);
     Jmario = rotateC(Jmario, pi/12);
     delete(h_Jmario);
     h_Jmario = scatter(hb, Jmario(1, :), Jmario(2, :), 'r.');
     pause(.05)
end


pause(.2);

% Mario stands in place and Mushroom shimmies offscreen (3 seconds)      
% Mushroom shifts offscreen (shifts)
% Asset(s): jumping Mario, Mushroom
% pause(1.5)
for i = 1:12
    mushroom = translateC(mushroom, 50, 0);
    delete(h_mushroom);
    h_mushroom = scatter(hb, mushroom(1, :), mushroom(2, :), 'k.');
    pause(.1);
end


% Mario runs after mushroom and camera follows (3 seconds)
% Mario shifts right, 
% Asset(s):  Jumping Mario, 
for i = 1:10
    Jmario = translateC(Jmario, 35, 0);
    delete(h_Jmario);
    h_Jmario = scatter(hb, Jmario(1, :), Jmario(2, :), 'r.');
    pause(.1);
end

bgxstart = 1;
bgxend = 600;
for i = 1:10
    if i == 8 
        goomba = translateC(goomba, 800, 60);
        h_goomba = scatter(hb, goomba(1, :), goomba(2, :), 'k.');
    end 
    if i >8 && i <= 10
        goomba = translateC(goomba, -50, 0);
        goomba = reflectC(goomba, 'y');
        delete(h_goomba)
        h_goomba = scatter(hb, goomba(1, :), goomba(2, :), 'k.');
    end
    clf
    bgxstart = bgxstart +50; 
    bgxend = bgxend +50;
    ha = axes('units','normalized', 'position',[0 0 1 1]); 
    uistack(ha,'bottom');
    hi = imagesc(bg(400:1000,bgxstart:bgxend, 1:3));
    set(ha,'handlevisibility','on', 'visible','off')
    pause(.2);
end


% Brown Goomba walks toward Mario, Mario stops goes backward, and jumps on it(5 seconds) 
% Goomba reflections and shifts, Mario shifts 
% Asset(s): Standing Mario, jumping Mario, Big footed Goomba
for i = 1:14
%   Mario backs up
    if i >=2 && i<=4
        Jmario = translateC(Jmario, -40, 0);
        delete(h_Jmario);
        h_Jmario = scatter(hb, Jmario(1, :), Jmario(2, :), 'r.');   
    end
%   Mario jumps up and moves right
    if i >=5 && i <=9
        Jmario = translateC(Jmario, 15, 40);
        delete(h_Jmario);
         h_Jmario = scatter(hb, Jmario(1, :), Jmario(2, :), 'r.');  
    end
%   Mario's descents and moves right after arch of jumping  
    if i >= 9 && i <= 13
        Jmario = translateC(Jmario, 15, -30);
        delete(h_Jmario);
        h_Jmario = scatter(hb, Jmario(1, :), Jmario(2, :), 'r.');  
    end
    if i == 13
        goomba = scaleC(goomba, 1/2, 1);
        goomba = translateC(goomba, 0, 40);
        delete(h_goomba)
        h_goomba = scatter(hb, goomba(1, :), goomba(2, :), 'k.'); 
    end 
%   Mario positions himself correctly on ground
%   goomba becomes pancake
    if i == 14
        Jmario = translateC(Jmario, 0, -40);
        goomba = scaleC(goomba, 1/10, 1);
        goomba = translateC(goomba, 0, 60);
        delete(h_goomba);
        delete(h_Jmario);
        h_Jmario = scatter(hb, Jmario(1, :), Jmario(2, :), 'r.');  
        h_goomba = scatter(hb, goomba(1, :), goomba(2, :), 'k.');   
    end
%   Goomba moves towards mario, 
    if i >= 1 && i<= 12
        goomba = translateC(goomba, -25, 0);
        goomba = reflectC(goomba, 'y');
        delete(h_goomba);
        h_goomba = scatter(hb, goomba(1, :), goomba(2, :), 'k.');   
    end 
    pause(.1);
end

% deletes pancake goomba
delete(h_goomba);


% mario moves forward until he reaches the bottom of the stairs 
for i = 1:13
    clf
    ha = axes('units','normalized', 'position',[0 0 1 1]); 
    uistack(ha,'bottom');
    bgxstart = bgxstart + 50;
    bgxend = bgxend + 50;
    hi = imagesc(bg(400:1000,bgxstart:bgxend, 1:3));
    set(ha,'handlevisibility','on', 'visible','off')
    pause(.2);
end


% Mario jumps up stairs
for i = 1:4
    Jmario = translateC(Jmario, 0, 40);
    delete(h_Jmario);
    h_Jmario = scatter(hb, Jmario(1, :), Jmario(2, :), 'r.');  
    pause(.1)
end
for i = 1:4
    clf
    ha = axes('units','normalized', 'position',[0 0 1 1]); 
    uistack(ha,'bottom');
    if i <= 2
        bgxstart = bgxstart + 40;
        bgxend = bgxend + 40;
        hi = imagesc(bg(400:1000,bgxstart:bgxend, 1:3));
        Jmario = translateC(Jmario, 0, 30);
    end
    if i >= 3&& i<=4
        bgxstart = bgxstart + 30;
        bgxend = bgxend + 30;
        hi = imagesc(bg(400:1000,bgxstart:bgxend, 1:3));
        Jmario = translateC(Jmario, 0, -25);
    end
    set(ha,'handlevisibility','on', 'visible','off')
    delete(h_Jmario);
    h_Jmario = scatter(hb, Jmario(1, :), Jmario(2, :), 'r.');  
    pause(.1)
end
for i = 1:4
    Jmario = translateC(Jmario, 0, 40);
    delete(h_Jmario);
    h_Jmario = scatter(hb, Jmario(1, :), Jmario(2, :), 'r.');  
    pause(.1)
end
% repeats the same jump up the stairs. 
for i = 1:4
    clf
    ha = axes('units','normalized', 'position',[0 0 1 1]); 
    uistack(ha,'bottom');
    if i <= 2
        bgxstart = bgxstart + 40;
        bgxend = bgxend + 40;
        hi = imagesc(bg(400:1000,bgxstart:bgxend, 1:3));
        Jmario = translateC(Jmario, 0, 30);
    end
    if i >= 3&& i<=4
        bgxstart = bgxstart + 30;
        bgxend = bgxend + 30;
        hi = imagesc(bg(400:1000,bgxstart:bgxend, 1:3));
        Jmario = translateC(Jmario, 0, -25);
    end
    set(ha,'handlevisibility','on', 'visible','off')
    delete(h_Jmario);
    h_Jmario = scatter(hb, Jmario(1, :), Jmario(2, :), 'r.');  
    pause(.1)
end

% Mario reaches big gap, stops in place, jumps up and down, then jumps over gap (5 seconds)
% Mario shifts
% Asset(s): Standing Mario, Jumping Mario
pause(.2);
for i = 1:8
    Jmario = translateC(Jmario, 0, 30);
    delete(h_Jmario);
    h_Jmario = scatter(hb, Jmario(1, :), Jmario(2, :), 'r.');  
    pause(.1)
end
for i = 1:8
    Jmario = translateC(Jmario, 0, -30);
    delete(h_Jmario);
    h_Jmario = scatter(hb, Jmario(1, :), Jmario(2, :), 'r.');  
    pause(.1)
end

for i = 1:2
    Jmario = reflectC(Jmario, 'y');
    delete(h_Jmario);
    h_Jmario = scatter(hb, Jmario(1, :), Jmario(2, :), 'r.');  
    pause(.4);
end

% mario jumps over the gap
for i = 1:12
    if i <= 6 
        Jmario = translateC(Jmario, 0, 20); 
    else
        Jmario = translateC(Jmario, 0, -20); 
    end
    clf
    Jmario = rotateC(Jmario, pi/6);
    ha = axes('units','normalized', 'position',[0 0 1 1]); 
    uistack(ha,'bottom');
    bgxstart = bgxstart + 25;
    bgxend = bgxend + 25;
    hi = imagesc(bg(400:1000,bgxstart:bgxend, 1:3));
    set(ha,'handlevisibility','on', 'visible','off')
    delete(h_Jmario);
    h_Jmario = scatter(hb, Jmario(1, :), Jmario(2, :), 'r.');  
    pause(.1)
end

% flips down the stairs
for i = 1:16
    if i <= 6 
        Jmario = translateC(Jmario, 0, 20); 
    elseif i >=7 && i<= 14
        Jmario = translateC(Jmario, 0, -50); 
    else
        Jmario = translateC(Jmario, 0, -30); 
    end
    clf
    Jmario = rotateC(Jmario, pi/8);
    ha = axes('units','normalized', 'position',[0 0 1 1]); 
    uistack(ha,'bottom');
    bgxstart = bgxstart + 25;
    bgxend = bgxend + 25;
    hi = imagesc(bg(400:1000,bgxstart:bgxend, 1:3));
    set(ha,'handlevisibility','on', 'visible','off')
    delete(h_Jmario);
    h_Jmario = scatter(hb, Jmario(1, :), Jmario(2, :), 'r.');  
    pause(.1)
end

for i = 1:8
    clf
    ha = axes('units','normalized', 'position',[0 0 1 1]); 
    uistack(ha,'bottom');
    bgxstart = bgxstart + 50;
    bgxend = bgxend + 50;
    hi = imagesc(bg(400:1000,bgxstart:bgxend, 1:3));
    set(ha,'handlevisibility','on', 'visible','off')
    pause(.2);
end

% mario sees the mushroom 
pause(1)


for i = 1:10
    Jmario = translateC(Jmario, -10, 0);
    if i== 5
        mushroom = translateC(mushroom, -400, 0);
    end
    mushroom = translateC(mushroom, -20, 0);
    delete(h_Jmario);
    delete(h_mushroom);
    h_Jmario = scatter(hb, Jmario(1, :), Jmario(2, :), 'r.');  
    h_mushroom = scatter(hb, mushroom(1, :), mushroom(2, :), 'k.');    
    clf
    ha = axes('units','normalized', 'position',[0 0 1 1]); 
    uistack(ha,'bottom');
    bgxstart = bgxstart + 20;
    bgxend = bgxend + 20;
    hi = imagesc(bg(400:1000,bgxstart:bgxend, 1:3));
    set(ha,'handlevisibility','on', 'visible','off')
    pause(.1);
end

pause(2);

% Mario reaches the not moving mushroom, Mario transforms into a red goomba (3 seconds)
% Mario shifts and morphs(standing Mario-> Big footed Goomba)
% Asset(s): Jumping, Mushroom, Big footed Goomba
for i = 1:4
    Jmario = translateC(Jmario, 20, 0);
    delete(h_Jmario);
    h_Jmario = scatter(hb, Jmario(1, :), Jmario(2, :), 'r.');  
    pause(.2);
end
 
for i = 1:4
    clf
    ha = axes('units','normalized', 'position',[0 0 1 1]); 
    uistack(ha,'bottom');
    bgxstart = bgxstart + 50;
    bgxend = bgxend + 50;
    hi = imagesc(bg(400:1000,bgxstart:bgxend, 1:3));
    set(ha,'handlevisibility','on', 'visible','off')
    mushroom = translateC(mushroom, -50, 0);
    delete(h_mushroom);
    h_mushroom = scatter(hb, mushroom(1, :), mushroom(2, :), 'k.');  
    pause(.1);
end

% Mario morphs into red goomba
delete(h_mushroom);
delete(h_Jmario);
[Jmario, redgoomba] = SizeMatchC(Jmario, redgoomba);
redgoomba= MorphC(Jmario, redgoomba, hb, .2); 
% delete(redgoomba);
% delete(h_redgoomba);
clf
% Goomba Mario stops and wobbles in place, and proceeds toward the end of level (4 seconds)
% Goomba Mario  Reflections and shifts after
% Asset(s): Big footed Goomba
for i = 1:5
    if i>1
        delete(h_redgoomba);
    end
    redgoomba = reflectC(redgoomba, 'y');
    redgoomba = translateC(redgoomba, 30, 0);
    h_redgoomba = scatter(hb, redgoomba(1, :), redgoomba(2, :), 'r.');  
    pause(.1);
end

for i = 1:8
    if i <=4
        redgoomba = translateC(redgoomba, 30, 50);
    elseif i>=4 && i<=7
        redgoomba = translateC(redgoomba, 10, -20);
    else 
        redgoomba = translateC(redgoomba, 0, -30);
    end
    delete(h_redgoomba);
    h_redgoomba = scatter(hb, redgoomba(1, :), redgoomba(2, :), 'r.');
    pause(.1);
end
% Goomba Mario goes down pipe (2 seconds)
% Shears downward like a pankcake.
% Asset(s): Red Goomba
for i = 1:3
    if i == 1
        R = [1 0 0; 0 .75 0; 0 0 1];
        redgoomba = R*redgoomba;
%         redgoomba = scaleC(redgoomba, 1/2, 1);
        redgoomba = translateC(redgoomba, 0, 90);
    elseif i == 2
        redgoomba = scaleC(redgoomba, 1/2, 1);
        redgoomba = translateC(redgoomba, 0, 60);
    else
        redgoomba = scaleC(redgoomba, 1/10, 1);
        redgoomba = translateC(redgoomba, 0, 150);
    end
    delete(h_redgoomba);
    h_redgoomba = scatter(hb, redgoomba(1, :), redgoomba(2, :), 'r.');
    pause(.1);
end
delete(h_redgoomba);
% Morph back into mario
redgoomba = translateC(redgoomba, 0, 1000);
Jmario = translateC(Jmario, 0, 1000);
% Transitions from redgoomba to Tim's holder image off screen;
Holder = MorphC(redgoomba, Jmario, hb, 0); 
% end

%%

% SCENE 2 - Tim

%Scene 2: Tim's "Underworld" level

%Transition -----------
clf('reset')
transition_axes_2 = axes('units','normalized', 'position',[0 0 1 1]); 
uistack(transition_axes_2,'bottom');
transition_display_2 = imagesc(transition_2_slide);
set(transition_axes_2,'handlevisibility','off', 'visible','off');
set(gca,'color','none','handlevisibility','off','visible','off');
pause(2);
clf('reset')

% Call in Function
Mario = CharacterInT(Holder);
Mario = RescaleT(Mario,120); %rescale proportions to height of 120
Mario = translateT(Mario, 60, 1);

% Temporary Mario to move around

% MarioPic = imread('jumpingmario.jpg');
% Mario = Jpeg2pointsConverterT(MarioPic,150);


%add a vector to make Mario 3x___
% sizeMario = length(Mario);
% Mario = [Mario ; ones(1,sizeMario)];

%rescale
% scale = [0.3 0 0; 0 0.3 0; 0 0 1];
% Mario = scale*Mario;


%% Make Enemies

%Goomba
goombaPic = imread('turtle.jpg');
TGoomba = Jpeg2pointsConverterT(goombaPic,150);

%add vector to make Goomba 3x____
sizeTGoomba = length(TGoomba);
TGoomba = [TGoomba ; ones(1,sizeTGoomba)];

%rescale Goomba
scale_goomba = [0.18 0 0; 0 0.18 0; 0 0 1];
TGoomba = scale_goomba * TGoomba;


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


%% Mario Falls in

set(gca,'color','none','handlevisibility','off','visible','off');

%%%%%%%%%%%%%%%%%%%%%%%%%% PUT MARIO IN %%%%%%%%%%%%%%%%%%%%
Mario = translateT(Mario, 1, 600); %Move Mario into initial position
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:12 %Mario Drops In
    hb = axes('position',[0.14 0.12 0.8 0.8]);
    h_mario = scatter(hb, Mario(1,:),Mario(2,:),'r.');
    
    axis([0 800 0 800])
    set(gca,'color','none','handlevisibility','off','visible','off')
    
    pause(0.1)
    if i ~= 12
        delete(h_mario)
        Mario = translateT(Mario, 1, -50);
    end
    
end


%% Goomba appears ---------

%pull in 2 Goomba enemies

TGoomba1 = translateT(TGoomba, 400 , 20); %Goomba 1
TGoomba2 = translateT(TGoomba, 600 , 20); %Goomba 2

h_goomba1 = scatter(hb, TGoomba1(1,:),TGoomba1(2,:),'r.'); hold on
h_goomba2 = scatter(hb, TGoomba2(1,:),TGoomba2(2,:),'r.');
h_mario = scatter(hb, Mario(1,:),Mario(2,:),'r.'); %need to replot mario

axis([0 800 0 800])
set(gca,'color','none','handlevisibility','off','visible','off')

pause(0.5)
delete(h_goomba1) ; delete(h_goomba2) ; delete(h_mario)

%% Goomba's attack --------

for i = 1:5
    hb = axes('position',[0.14 0.12 0.8 0.8]);
    
    h_goomba1 = scatter(hb, TGoomba1(1,:),TGoomba1(2,:),'r.'); hold on
    h_goomba2 = scatter(hb, TGoomba2(1,:),TGoomba2(2,:),'r.');
    h_mario = scatter(hb, Mario(1,:),Mario(2,:),'r.'); %need to replot mario

    
    axis([0 800 0 800])
    set(gca,'color','none','handlevisibility','off','visible','off')
    
    pause(0.2)
    
    if i ~=5 %keep the last picture position when we hit 5
       
        TGoomba1 = translateT(TGoomba1, -50 , 1);
        TGoomba2 = translateT(TGoomba2, -50 , 1);
    end
    delete(h_goomba1) ; delete(h_goomba2) ; delete(h_mario)
end

%% Mario Jumps

%have mario move to jump on their heads
for i = 1:40
    
    hb = axes('position',[0.14 0.12 0.8 0.8]);
    
    h_goomba1 = scatter(hb, TGoomba1(1,:),TGoomba1(2,:),'r.'); hold on
    h_goomba2 = scatter(hb, TGoomba2(1,:),TGoomba2(2,:),'r.');
    h_mario = scatter(hb, Mario(1,:),Mario(2,:),'r.');

    axis([0 800 0 800])
    set(gca,'color','none','handlevisibility','off','visible','off')
    
    pause(0.05)
    delete(h_goomba1) ; delete(h_goomba2) ; delete(h_mario)

    if i<20 %going up
        Mario = translateT(Mario, 1, 15);
    end
    
    if i > 5 %moving right
        Mario = translateT(Mario, 5, 1);
    end
    
    if i>20 %going down
        if i <= 40
           Mario = translateT(Mario, 1, -10);
        end

    end
    
end

%% Bounce off Goomba

for i = 1:20
    
    hb = axes('position',[0.14 0.12 0.8 0.8]);
    
    h_goomba1 = scatter(hb, TGoomba1(1,:),TGoomba1(2,:),'r.'); hold on
    h_goomba2 = scatter(hb, TGoomba2(1,:),TGoomba2(2,:),'r.');
    h_mario = scatter(hb, Mario(1,:),Mario(2,:),'r.');

    axis([0 800 0 800])
    set(gca,'color','none','handlevisibility','off','visible','off')
    
    pause(0.05)
    
    delete(h_goomba1) ; delete(h_goomba2) ; delete(h_mario)
   
    if i <11
        Mario = translateT(Mario, 11, 18); %bounce off Goomba
    end
    
    if i>10
        Mario = translateT(Mario, 7, -2); %land on cubes
    end
end

%% First Goomba spins off

for i = 1:20 %was 30
    hb = axes('position',[0.14 0.12 0.8 0.8]);
    
    h_goomba1 = scatter(hb, TGoomba1(1,:),TGoomba1(2,:),'r.'); hold on
    h_goomba2 = scatter(hb, TGoomba2(1,:),TGoomba2(2,:),'r.');
    h_mario = scatter(hb, Mario(1,:),Mario(2,:),'r.');

    axis([0 800 0 800])
    set(gca,'color','none','handlevisibility','off','visible','off')
    
    pause(0.05)
    
    delete(h_goomba1) ; delete(h_goomba2) ; delete(h_mario)
    
    TGoomba1 = Rotate2T(TGoomba1,pi/4); %spinning and dropping
    TGoomba1 = translateT(TGoomba1, 1 , -6);
end


%% Second Goomba walks back (Reflection)

for i = 1:30
    if i == 1
        TGoomba2 = reflectV2T(TGoomba2, 'y'); %turn Goomba to walk away
    end
    
    hb = axes('position',[0.14 0.12 0.8 0.8]);
    
    h_goomba2 = scatter(hb, TGoomba2(1,:),TGoomba2(2,:),'r.'); hold on
    h_mario = scatter(hb, Mario(1,:),Mario(2,:),'r.');

    axis([0 800 0 800])
    set(gca,'color','none','handlevisibility','off','visible','off')
    
    pause(0.05)
    if i < 11
        TGoomba2 = translateT(TGoomba2,10,1); %walk to right
    end
    if i>10
        if i<20
            TGoomba2 = translateT(TGoomba2,1,10); %jump up
        end
    end
    if i>20
        TGoomba2 = translateT(TGoomba2,1,-10); %fall to ground
    end
    
    delete(h_goomba2) ; delete(h_mario)
end


%% Pull in Fire Flower

%Fire Flower
FlowerPic = imread('firepower.jpg');
Tflower = Jpeg2pointsConverterT(FlowerPic,27);

%add vector to make flower 3x____
sizeTflower = length(Tflower);
Tflower = [Tflower ; ones(1,sizeTflower)];

%rescale flower
scale_flower = [0.04 0 0; 0 0.04 0; 0 0 1];
Tflower = scale_flower * Tflower;

Tflower = translateT(Tflower, 550 , 340); %put flower in position
Tflower = contractionT(Tflower,0.1); %squish flower so it rises up later

%% Mario gets Firepower

for i = 1:10
    hb = axes('position',[0.14 0.12 0.8 0.8]);
    
    
    h_goomba2 = scatter(hb, TGoomba2(1,:),TGoomba2(2,:),'r.'); hold on
    h_mario = scatter(hb, Mario(1,:),Mario(2,:),'r.');
    h_flower = scatter(hb, Tflower(1,:), Tflower(2,:), 'r.');

    axis([0 800 0 800])
    set(gca,'color','none','handlevisibility','off','visible','off')
    
    pause(0.01)
    
    Tflower = contractionT(Tflower, 1.3); %flower grows
    delete(h_goomba2) ; delete(h_mario) ; delete(h_flower)
end


%% Mario walks to flower

for i = 1:10
    hb = axes('position',[0.14 0.12 0.8 0.8]);
    
    
    h_goomba2 = scatter(hb, TGoomba2(1,:),TGoomba2(2,:),'r.'); hold on
    h_mario = scatter(hb, Mario(1,:),Mario(2,:),'r.');
    h_flower = scatter(hb, Tflower(1,:), Tflower(2,:), 'r.');

    axis([0 800 0 800])
    set(gca,'color','none','handlevisibility','off','visible','off')
    
    pause(0.01)
    
    Mario = translateT(Mario, 2 , 1); %Mario picks up flower
    delete(h_goomba2) ; delete(h_mario) ; delete(h_flower)
end

%% Pull in Fire Mario

%Fire Mario
FireMarioPic = imread('FireMario.jpeg');
TFireMario = Jpeg2pointsConverterT(FireMarioPic,50);

%add vector to make TFireMario 3x____
sizeTFireMario = length(TFireMario);
TFireMario = [TFireMario ; ones(1,sizeTFireMario)];

%rescale TFireMario
scale_TFireMario = [0.15 0 0; 0 0.15 0; 0 0 1];
TFireMario = scale_TFireMario * TFireMario;

TFireMario = translateT(TFireMario, 455, 310); %Put FireMario in correct place

%% Pull in Fireball

%fireball
FireballPic = imread('fireball.jpeg');
TFireball = Jpeg2pointsConverterT(FireballPic,150);

%add vector to make TFireball 3x_____
sizeTFireball = length(TFireball);
TFireball = [TFireball ; ones(1,sizeTFireball)];

%rescale TFireball
scale_TFireball = [0.1 0 0; 0 0.1 0; 0 0 1];
TFireball = scale_TFireball * TFireball;

%translate TFireball
TFireball = translateT(TFireball, 480, 330);


%% Morph

%Turn Mario into FireMario
[Mario,TFireMario] = SizeMatchT(Mario,TFireMario); %Match Matrix Sizes
Morph_FireMario = MorphT(Mario,TFireMario,hb,0.1); %Morph Mario! (FireMario!)
TFireMario = Morph_FireMario; %redundant but will keep




%% Mario shoots a fireball ---------

for i = 1:10
    hb = axes('position',[0.14 0.12 0.8 0.8]);
    
    
    h_goomba2 = scatter(hb, TGoomba2(1,:),TGoomba2(2,:),'r.'); hold on
    h_mario = scatter(hb, TFireMario(1,:),TFireMario(2,:),'r.');
    h_fireball = scatter(hb, TFireball(1,:), TFireball(2,:), 'r.');

    axis([0 800 0 800])
    set(gca,'color','none','handlevisibility','off','visible','off')
    if i == 1
        pause(1) %let the viewer see him ready a fireball
    end
    pause(0.15)
    
    TFireball = translateT(TFireball, 25 , -20); %throw the fireball
    delete(h_goomba2) ; delete(h_mario) ; delete(h_fireball)
end

%% Fireball Bounces

for i = 1:7
    hb = axes('position',[0.14 0.12 0.8 0.8]);
    
    
    h_goomba2 = scatter(hb, TGoomba2(1,:),TGoomba2(2,:),'r.'); hold on
    h_mario = scatter(hb, TFireMario(1,:),TFireMario(2,:),'r.');
    h_fireball = scatter(hb, TFireball(1,:), TFireball(2,:), 'r.');

    axis([0 800 0 800])
    set(gca,'color','none','handlevisibility','off','visible','off')
    
    pause(0.15)
    
    if i < 5
        TFireball = translateT(TFireball, -25 , -20); %fireball wall-bounce
    end
    if i>5
        TFireball = translateT(TFireball, -25 , 20); %fireball bounce up
    end
    delete(h_goomba2) ; delete(h_mario) ; delete(h_fireball)
end


%% Goomba 2 dies

for i = 1:18
    hb = axes('position',[0.14 0.12 0.8 0.8]);
    
    
    h_goomba2 = scatter(hb, TGoomba2(1,:),TGoomba2(2,:),'r.'); hold on
    h_mario = scatter(hb, TFireMario(1,:),TFireMario(2,:),'r.');
    h_fireball = scatter(hb, TFireball(1,:), TFireball(2,:), 'r.');

    axis([0 800 0 800])
    set(gca,'color','none','handlevisibility','off','visible','off')
    
    pause(0.15)
    if i == 1
        TFireMario = reflectV2T(TFireMario,'y'); %Mario turns
    end
    if i < 9
        TGoomba2 = Rotate2T(TGoomba2,pi/4); %spin Goomba away
        TGoomba2 = translateT(TGoomba2, 1, -15); %Goomba falls down
    end
    if i < 5
        TFireMario = translateT(TFireMario, -10 , 1); %walk left
    end
    if i >4
        TFireMario = translateT(TFireMario, -20, 10); %jump left
    end
    if i < 15
        TFireball = translateT(TFireball, -25 , 20); %fireball flying
    end
    
    delete(h_goomba2) ; delete(h_mario) ; delete(h_fireball)
end


%% Mario Falls

Mario = translateT(Mario, -290, -160); %get little Mario in position for Morph

for i = 1:12
    hb = axes('position',[0.14 0.12 0.8 0.8]);
    
    h_mario = scatter(hb, TFireMario(1,:),TFireMario(2,:),'r.'); hold on

    axis([0 800 0 800])
    set(gca,'color','none','handlevisibility','off','visible','off')
    
    pause(0.15)
    
    TFireMario = Rotate2T(TFireMario, pi/2); %fireball damage and falling
    TFireMario = translateT(TFireMario, -3 , -22);
    
   delete(h_mario) ; %delete(h_fireball)
end

Mario = MorphT(TFireMario,Mario,hb,0.25); %Mario reverts to little Mario

for i = 1:8
    hb = axes('position',[0.14 0.12 0.8 0.8]);

    h_mario = scatter(hb, Mario(1,:),Mario(2,:),'r.');hold on

    axis([0 800 0 800])
    set(gca,'color','none','handlevisibility','off','visible','off')
    
    pause(0.25)
    
    Mario = contractionT(Mario, 0.5);
    delete(h_mario);
end
for i =1:8 %fix Mario for Hand off to next scene
    Mario = contractionT(Mario, 2.0);
end

Mario_Out_Tim = Mario; %Handle for scene 3

% Transition Slide from World 1-2 to World 1-3
clf('reset')
transition_axes_3 = axes('units','normalized', 'position',[0 0 1 1]); 
uistack(transition_axes_3,'bottom');
transition_display_3 = imagesc(transition_3_slide);
set(transition_axes_3,'handlevisibility','off', 'visible','off');
set(gca,'color','none','handlevisibility','off','visible','off');
pause(2);
clf('reset')


% Opening notes:
% All functions and variables with the handle "_ian" are used for my scene.
% Run the script "create_images_ian" before running this script.
% 

% Set up the background, characters and objects:
mario_ian = Jpeg2pointsConverter(imread("mario_8bit.jpg"), 30);
toad_ian = Jpeg2pointsConverter(imread("toad.jpg"), 30);
mushroom_ian = Jpeg2pointsConverter(imread("mushroom_ian.jpg"), 30);
goomba_ian = Jpeg2pointsConverter(imread("goomba_ian.jpg"), 30);
bulletbill_ian = Jpeg2pointsConverter(imread("bulletbill.jpg"), 125);
coin_ian = Jpeg2pointsConverter(imread("coin.jpg"), 40);
star_ian = Jpeg2pointsConverter(imread("star.jpg"), 30);
background_final_2_ian = imread("background_final_2.jpg");

background_axes_ian = axes('units','normalized', 'position',[0 0 1 1]); 
uistack(background_axes_ian,'bottom');
background_display = imagesc(background_final_2_ian);
set(background_axes_ian,'handlevisibility','off', 'visible','off')
hold on;

% ---------- Commence the animation. ---------------
% Before moving anything, set the scene with coins and mushroom:
C = [1 0 1000 1 0 1100 1 0 1200; 0 1 155 0 1 155 0 1 155; 0 0 1 0 0 1 0 0 1];
C1 = draw_ian(C(:, 1:3) * padding_ian(coin_ian));
C2 = draw_ian(C(:, 4:6) * padding_ian(coin_ian));
C3 = draw_ian(C(:, 7:9) * padding_ian(coin_ian));
M = [1 0 1170; 0 1 300; 0 0 1];
M1 = draw_ian(M * padding_ian(mushroom_ian));

% Center and morph Tim's Mario into my Mario:
TimsDims = dims(Mario_Out_Tim(1:2, :));
centerTimMario = TimsDims(:, 1);
[Mario_Out_Tim, mario_ian] = SizeMatch_ian(Mario_Out_Tim - [centerTimMario; 0], padding_ian(mario_ian));
TimMario_Unpadded = [1 0 50; 0 1 50; 0 0 1] * Mario_Out_Tim;
TimMarioTemp = draw_ian(TimMario_Unpadded(1:2, :));
pause(1);
delete(TimMarioTemp)
MorphT_ian([1 0 50; 0 1 50; 0 0 1] * Mario_Out_Tim, 1.1 * [1 0 50; 0 1 16; 0 0 1] * mario_ian, 0.3);

% Unpad mario_ian from the transition:
mario_ian = mario_ian(1:2, 1:3924);

% First, go to the Goomba:
walk_ian2(mario_ian, goomba_ian, 50, 50, 180, 50, 1200, 165, 1200, 165, 10);
walk_ian2(mario_ian, goomba_ian, 180, 50, 400, 165, 1200, 165, 800, 165, 30);
walk_ian2(mario_ian, goomba_ian, 400, 165, 480, 165, 800, 165, 550, 165, 20);

% Jump on the Goomba:
walk_ian2(mario_ian, goomba_ian, 480, 165, 480, 300, 550, 165, 510, 165, 10);
walk_ian2(mario_ian, goomba_ian, 480, 300, 480, 310, 510, 165, 510, 165, 3);
walk_ian2(mario_ian, goomba_ian, 480, 300, 480, 300, 510, 165, 510, 165, 3);
walk_ian2(mario_ian, goomba_ian, 480, 165, 480, 165, 510, 165, 510, 165, 10);
squish_ian(mario_ian, goomba_ian, 480, 165, 480, 165, 510, 165, 5);

% Back up as the second Goomba appears on screen:
walk_ian2(mario_ian, goomba_ian, 480, 165, 640, 165, 0, 50, 180, 50, 20);
walk_ian2(mario_ian, goomba_ian, 640, 165, 800, 165, 180, 50, 400, 165, 20);
walk_ian2(mario_ian, goomba_ian, 800, 165, 800, 165, 400, 165, 480, 165, 10);

% Create a "turned around" Mario sprite, which is a reflection about y:
mario_ian_rev = mF1(mario_ian);

% Attack second Goomba:
walk_ian2(mario_ian_rev, goomba_ian, 800, 165, 650, 165, 480, 165, 480, 165, 15);
walk_ian2(mario_ian_rev, goomba_ian, 650, 165, 550, 165, 480, 165, 480, 165, 15);
walk_ian2(mario_ian_rev, goomba_ian, 550, 165, 550, 300, 480, 165, 510, 165, 8);
walk_ian2(mario_ian_rev, goomba_ian, 550, 300, 550, 310, 510, 165, 510, 165, 2);
doaflip(mario_ian_rev, goomba_ian, 550, 300, 510, 165, 510, 165, 8);
walk_ian2(mario_ian_rev, goomba_ian, 550, 310, 550, 300, 510, 165, 510, 165, 2);
walk_ian2(mario_ian_rev, goomba_ian, 550, 300, 550, 165, 510, 165, 510, 165, 8);
squish_ian(mario_ian_rev, goomba_ian, 550, 165, 550, 165, 510, 165, 5);

% Collect the coins:
walk_ian(mario_ian, 550, 165, 910, 165, 25);
walk_ian(mario_ian, 910, 165, 1010, 165, 10);
delete(C1);
walk_ian(mario_ian, 1010, 165, 1110, 165, 10);
delete(C2); 
walk_ian(mario_ian, 1110, 165, 1210, 165, 10);
delete(C3);

% Collect the mushroom and grow in size:
mario_ian_big = mC1(mario_ian, 1.5, 1.5);

walk_ian(mario_ian, 1210, 165, 1210, 275, 5);
walk_ian(mario_ian, 1210, 275, 1210, 300, 2);

delete(M1);                                                            % Eats mushroom
pause(0.2);
temp1 = draw_ian([1 0 1190; 0 1 310; 0 0 1] * padding_ian(mario_ian_big));     % Grows
pause(0.2);
delete(temp1);
temp2 = draw_ian([1 0 1210; 0 1 300; 0 0 1] * padding_ian(mario_ian));         % Shrinks
pause(0.2);
delete(temp2);
temp3 = draw_ian([1 0 1190; 0 1 310; 0 0 1] * padding_ian(mario_ian_big));     % Grows
pause(0.2);
delete(temp3);

walk_ian(mario_ian_big, 1210, 300, 1210, 275, 2);   % Falls to ground
walk_ian(mario_ian_big, 1210, 275, 1210, 200, 5);

% Flip big Mario around:
mario_ian_big_rev = mF1(mario_ian_big);

% Make contact with the next Goomba:
walk_ian2(mario_ian_big_rev, goomba_ian, 1210, 190, 800, 190, 0, 50, 180, 50, 30);
walk_ian2(mario_ian_big_rev, goomba_ian, 800, 190, 550, 190, 180, 50, 400, 165, 30);
walk_ian2(mario_ian_big_rev, goomba_ian, 550, 190, 510, 190, 400, 165, 440, 165, 10);
walk_ian2(mario_ian_big_rev, goomba_ian, 550, 190, 510, 190, 440, 165, 480, 190, 5);
doaflip(goomba_ian, mario_ian_big_rev, 480, 190, 510, 190, 510, 190, 8);
walk_ian2(mario_ian_big_rev, goomba_ian, 510, 190, 510, 190, 480, 190, 520, 165, 5);
walk_ian2(mario_ian_big_rev, goomba_ian, 510, 190, 510, 190, 520, 165, 550, 0, 5);

% Lose the mushroom powerup:
temp1 = draw_ian([1 0 530; 0 1 140; 0 0 1] * padding_ian(mario_ian_rev));      % Shrinks
pause(0.2);
delete(temp1);
temp2 = draw_ian([1 0 510; 0 1 165; 0 0 1] * padding_ian(mario_ian_big_rev));  % Grows
pause(0.2);
delete(temp2);
temp3 = draw_ian([1 0 530; 0 1 140; 0 0 1] * padding_ian(mario_ian_rev));      % Shrinks
pause(0.2);
delete(temp3);

% Hold Mario in place while the star is generated
temp_mario_ian = draw_ian([1 0 530; 0 1 140; 0 0 1] * padding_ian(mario_ian_rev));

% Generate the star powerup:
materialize(star_ian, 30, 35, 20);
star_ian1 = draw_ian([1 0 30; 0 1 35; 0 0 1] * padding_ian(star_ian));
delete(temp_mario_ian);

% Collect the star powerup:
walk_ian(mario_ian_rev, 530, 165, 400, 165, 20);
walk_ian(mario_ian_rev, 400, 165, 180, 50, 30);
walk_ian(mario_ian_rev, 180, 50, 140, 50, 10);
delete(star_ian1)

% Morph Mario into Toad:
[mario_ian_rev_mod, toad_ian_mod] = SizeMatch_ian([1 0 140; 0 1 50; 0 0 1] * padding_ian(mario_ian_rev), padding_ian(toad_ian));
MorphT_ian(mario_ian_rev_mod, 1.1 * [1 0 90; 0 1 -20; 0 0 1] * toad_ian_mod, 0.05);

% Mount Toad on Bullet Bill
walk_ian(toad_ian, 170, 50, 100, 50, 30)
walk_ian2(toad_ian, bulletbill_ian, 100, 50, 100, 300, 0, 300, 50, 300, 20);
walk_ian2(toad_ian, bulletbill_ian, 100, 300, 100, 400, 50, 300, 75, 300, 10);
walk_ian2(toad_ian, bulletbill_ian, 100, 400, 100, 450, 75, 300, 100, 300, 10);
doaflip(toad_ian, bulletbill_ian, 100, 450, 100, 300, 100, 300, 10);
walk_ian2(toad_ian, bulletbill_ian, 100, 450, 100, 375, 100, 300, 100, 300, 10);

% Reverse the direction in which Toad is looking
toad_ian_rev = mF1(toad_ian);

% Fly off-screen riding Bullet Bill
walk_ian2(toad_ian_rev, bulletbill_ian, 100, 375, 150, 375, 100, 300, 150, 300, 10);
walk_ian2(toad_ian_rev, bulletbill_ian, 150, 375, 1300, 375, 150, 300, 1300, 300, 50);

%% Transition Slide from World 1-3 to World 1-4
clf('reset')
transition_axes_4 = axes('units','normalized', 'position',[0 0 1 1]); 
uistack(transition_axes_4,'bottom');
transition_display_4 = imagesc(transition_4_slide);
set(transition_axes_4,'handlevisibility','off', 'visible','off');
set(gca,'color','none','handlevisibility','off','visible','off');
pause(2);
clf('reset')

%% SCENE 4 - Matt

% setup background
ha = axes('units','normalized', 'position',[0 0 1 1]); 
uistack(ha,'bottom');
bg = imread('boocastle.jpg');
hi = imagesc(bg);
hb = axes('position',[0 0 1 1]);
axis([0 600 0 600]); axis manual 
hold on; 

% drawing parameters for scene elements 
% {axes, color, alpha}
mario_params = {hb, [1 0 0], 1};
boo_params = {hb, [1 1 1], 0.5};
fb_params = {hb, [0.6 0.8 1], 1};
kingboo_params = {hb, [1 1 1], 0.4};
toad_params = {hb, [1 0 0], 1};
bulletbill_params = {hb, [0 0 0], 1};

set(gca,'color','none','handlevisibility','off','visible','off');

% create element matrices
mario = imread('jumpingmario.jpg');
boo = imread('Boo.png');
fireball = imread('boofireball.jpg');
kingboo = imread('kingboo.jpg');
toad = imread('toad.jpg');
bulletbill = imread('bulletbill.jpg');

mario = pic2points(mario)';
boo = pic2points(boo)';
fireball = pic2points(fireball)';
kingboo = pic2points(kingboo)';
toad = pic2points(toad)';
bulletbill = pic2points(bulletbill)';

mario(3, :) = ones(1, length(mario));
boo(3, :) = ones(1, length(boo));
fireball(3, :) = ones(1, length(fireball));
kingboo(3, :) = ones(1, length(kingboo));
toad(3, :) = ones(1, length(toad));
bulletbill(3, :) = ones(1, length(bulletbill));

% == ANIMATION BEGINS ==

tic

bulletbill = reflectM(bulletbill, 'y');
toad = scaleM(toad, 0.8, 0.8);
bulletbill = scaleM(bulletbill, 0.8, 0.8);
bulletbill = translateM(bulletbill, 550, 100);
toad = translateM(toad, 550, 150);

h_toad = drawM(toad, toad_params);
h_bulletbill = drawM(bulletbill, bulletbill_params);

% Toad enters the scene on the bulletbill
for i = 1:5
    bulletbill = translateM(bulletbill, -15, 0); delete(h_bulletbill)
    toad = translateM(toad, -15, 0); delete(h_toad)
    
    h_toad = drawM(toad, toad_params);
    h_bulletbill = drawM(bulletbill, bulletbill_params);
    
    pause(0.01)
end

% Toad jumps off bulletbill
for i = 1:20
    bulletbill = translateM(bulletbill, -15, 0); delete(h_bulletbill)
    toad = translateM(toad, 0, 2); delete(h_toad)
    
    h_toad = drawM(toad, toad_params);
    h_bulletbill = drawM(bulletbill, bulletbill_params);
    
    pause(0.01)
end

for i = 1:20
    bulletbill = translateM(bulletbill, -15, 0); delete(h_bulletbill)
    toad = translateM(toad, 0, -5); delete(h_toad)
    
    h_toad = drawM(toad, toad_params);
    h_bulletbill = drawM(bulletbill, bulletbill_params);
    
    pause(0.01)
end

pause(0.5)

% Toad's star power runs out
h_toad = flashingM(h_toad, 15, 0.8);

% Toad morphs back into Mario
mario = scaleM(mario, 0.15, 0.15);
mario = reflectM(mario, 'y');
mario = translateM(mario, 335, -65);

[B, M] = matchM(toad, mario);
delete(h_toad); 
mario = morphM(B , M, mario_params);
h_mario = drawM(mario, mario_params);

% Mario moves forward a bit, skeptically
for i = 1:50
    mario = translateM(mario, -1, 0); delete(h_mario);
    h_mario = drawM(mario, mario_params);
    
    pause(0.03)
end

% Boo enters the scene from the doorway
boo = translateM(boo, -130, -90);
boo = scaleM(boo, 0.13, 0.13);
h_boo = drawM(boo, boo_params);

% Boo flys towards Mario
for i = 1:20
    
    boo = translateM(boo, 10, 0); delete(h_boo)
    h_boo = drawM(boo, boo_params);
    
    pause(0.02)
end

% Mario does a front flip over Boo
for i = 1:20
    boo = translateM(boo, 10, 0); delete(h_boo)
    h_boo = drawM(boo, boo_params);
    
    mario = translateM(mario, -3, 4);
    mario = rotateM(mario, pi/20); delete(h_mario)
    h_mario = drawM(mario, mario_params);
    
    pause(0.02)
end

for i = 1:20
    boo = translateM(boo, 5, 0); delete(h_boo)
    h_boo = drawM(boo, boo_params);
    
    mario = translateM(mario, -3, -4);
    mario = rotateM(mario, pi/20); delete(h_mario)
    h_mario = drawM(mario, mario_params);
    
    pause(0.02)
end

% Boo and Mario turn to face each other
mario = reflectM(mario, 'y'); delete(h_mario)
boo = reflectM(boo, 'y'); delete(h_boo)
h_mario = drawM(mario, mario_params);
h_boo = drawM(boo, boo_params);

% Intense faceoff moment
pause(0.5)

% Boo shoots a fireball at Mario
fireball = rotateM(fireball, -pi/2);
fireball = scaleM(fireball, 0.1, 0.1);
fireball = translateM(fireball, 124, -163);
h_fireball = drawM(fireball, fb_params);

for i = 1:5
    fireball = translateM(fireball, -10, 0); delete(h_fireball)
    h_fireball = drawM(fireball, fb_params);
    
    pause(0.02)
end

mario = reflectM(mario, 'y'); delete(h_mario)
h_mario = drawM(mario, mario_params);

% Mario runs from the fireball
for i = 1:20
    fireball = translateM(fireball, -10, 0); delete(h_fireball)
    h_fireball = drawM(fireball, fb_params);
    
    mario = translateM(mario, -9.3, 0); delete(h_mario);
    h_mario = drawM(mario, mario_params);
    
    pause(0.02)
end

% Mario jumps over fireball
for i = 1:20
    fireball = translateM(fireball, -10, 0); delete(h_fireball)
    h_fireball = drawM(fireball, fb_params);
    
    mario = translateM(mario, -5, 7); delete(h_mario);
    h_mario = drawM(mario, mario_params);
    
    pause(0.02)
end

for i = 1:20
    fireball = translateM(fireball, -10, 0); delete(h_fireball)
    h_fireball = drawM(fireball, fb_params);
    
    mario = translateM(mario, -5, -7); delete(h_mario);
    h_mario = drawM(mario, mario_params);
    
    pause(0.02)
end

% Mario runs back towards Boo
mario = reflectM(mario, 'y'); delete(h_mario)
h_mario = drawM(mario, mario_params);

% Mario is unphased by Boo's petty attacks
for i = 1:10
    mario = translateM(mario,  10, 0); delete(h_mario);
    h_mario = drawM(mario, mario_params);
    
    pause(0.1)
end

% Mario and Boo rush towards each
for i = 1:15
    mario = translateM(mario,  10, 0); delete(h_mario);
    h_mario = drawM(mario, mario_params);
    
    boo = translateM(boo,  -10, 0); delete(h_boo);
    h_boo = drawM(boo, boo_params);
    
    pause(0.04)
end

% Mario goes mini and hides from Boo
for i = 1:20
    mario = scaleM(mario, 0.90, 0.90); 
    mario = translateM(mario, 0, -1.5); delete(h_mario)
    h_mario = drawM(mario, mario_params);
    
    boo = translateM(boo,  -10, 0); delete(h_boo);
    h_boo = drawM(boo, boo_params);
    
   pause(0.02)
end

% Mario runs off while Boo looks for him
for i = 1:20
    mario = translateM(mario, 10, 0); delete(h_mario)
    h_mario = drawM(mario, mario_params);
    
    if rem(i, 4) == 0 
        boo = reflectM(boo, 'y'); delete(h_boo);
        h_boo = drawM(boo, boo_params);
    end
    
    pause(0.1)
end

boo = reflectM(boo, 'y'); delete(h_boo);
h_boo = drawM(boo, boo_params);

% Mario returns to his normal size as Boo goes to the castle
for i = 1:20
    mario = scaleM(mario, 1.112, 1.112); 
    mario = translateM(mario, 0, 1.2); delete(h_mario)
    h_mario = drawM(mario, mario_params);
    
    boo = translateM(boo,  -12, 0); delete(h_boo);
    h_boo = drawM(boo, boo_params);
    
    pause(0.05)
end

% Mario jumps a couple times to celebrate before the complete the level
for k = 1:3
    for i = 1:10
        mario = translateM(mario, 0, 2); delete(h_mario)
        h_mario = drawM(mario, mario_params);

        pause(0.01)
    end

    for i = 1:10
        mario = translateM(mario, 0, -2); delete(h_mario)
        h_mario = drawM(mario, mario_params);

        pause(0.01)
    end
end

pause(0.5)

mario = reflectM(mario, 'y'); delete(h_mario);
h_mario = drawM(mario, mario_params);

% Mario walks towards the goal
for i = 1:50
    mario = translateM(mario, -2, 0); delete(h_mario)
    h_mario = drawM(mario, mario_params);
    
    pause(0.04)
end

% King Boo materializes behind Mario
kingboo = scaleM(kingboo, 0.6, 0.6);
kingboo = translateM(kingboo, 150, 150);
h_kingboo = materializeM(kingboo, kingboo_params, 1.5, 100);

% King Boo looks at Mario
for i = 1:10
    kingboo = rotateM(kingboo, pi/4/10); delete(h_kingboo)
    h_kingboo = drawM(kingboo, kingboo_params);
    
    pause(0.1)
end

% Mario turns around and freaks out
mario = reflectM(mario, 'y'); delete(h_mario)
h_mario = drawM(mario, mario_params);

for i = 1:10
    mario = rotateM(mario, pi/6/10); delete(h_mario)
    h_mario = drawM(mario, mario_params);
    
    pause(0.1)
end

% Mario turns and tries to run way
mario = reflectM(mario, 'y'); delete(h_mario)
h_mario = drawM(mario, mario_params);

for i = 1:50
    mario = translateM(mario, -5, 0); delete(h_mario)
    h_mario = drawM(mario, mario_params);
    
    kingboo = translateM(kingboo, -10, -6); delete(h_kingboo)
    h_kingboo = drawM(kingboo, kingboo_params);
    
    pause(0.01)
end

% Mario dies 
for i = 1:20
    mario = rotateM(mario, -pi/3/20);
    mario = translateM(mario, 1, 0); delete(h_mario)
    h_mario = drawM(mario, mario_params);
    
    kingboo = translateM(kingboo, -10, -6); delete(h_kingboo)
    h_kingboo = drawM(kingboo, kingboo_params);
    
    pause(0.01)
end

% Mario morphs into a Boo
boo = translateM(boo, 160, 0); delete(h_boo)
% h_boo = drawM(boo, boo_params);

[B, M] = matchM(mario, boo);
delete(h_mario); 
boo = colormorphM(B , M, boo_params, mario_params);
h_boo = drawM(boo, boo_params);

% Boo floats to the top of the scene
for i = 1:50
    boo = translateM(boo, 0, 10); delete(h_boo)
    h_boo = drawM(boo, boo_params);
    
    pause(0.02)
end

clf('reset')
game_over_axes = axes('units','normalized', 'position',[0 0 1 1]); 
uistack(game_over_axes,'bottom');
game_over_display = imagesc(game_over_slide);
set(game_over_axes,'handlevisibility','off', 'visible','off');
set(gca,'color','none','handlevisibility','off','visible','off');
pause(2);

% ------------------------------------------------------------------------