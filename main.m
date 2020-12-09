%% Intro

% This main script outlines an adventure of Mario, where he travels from
% level to level. Each of us is responsible for a particular scene (level)
% in the animation. We will implement a generic set of transformation
% functions which take in a Mario position vector, and output a new
% position vector based on the transformation. Additional functions will also
% be used to handle logistics of the animation, such as a background. 

%% SCENE 1 - Chris

% (Panning Camera) Large background, smaller view follows mario
% Background:SunnyMarioLevel.jpg
% est Duation:28 seconds 
for i = 0:30

% Mario standing still and further away mushroom. (2 Seconds)
% No transformations, Stand still frame  
% Standing Mario, Mushroom

% Mario does a flip in and air and lands back down (3 seconds)
% Mario shifts and rotates
% Asset(s): Standing Mario, Jumping Mario, Mushroom

% Mario stands in place and Mushroom shimmies offscreen (3 seconds)      
% Mushroom shifts offscreen (shifts)
% Asset(s): Standing Mario, Mushroom

% Mario runs after mushroom and camera follows (3 seconds)
% Mario shifts right, and rotates clockwise and counterclockwise looks like a wobble
% Asset(s): Standing Mario, Jumping Mario, 

% Brown Goomba walks toward Mario, Mario stops goes backward, and jumps on it(5 seconds) 
% Goomba reflections and shifts, Mario shifts 
% Asset(s): Standing Mario, jumping Mario, Big footed Goomba

% Mario reaches big gap, stops in place, jumps up and down, then jumps over gap (5 seconds)
% Mario shifts
% Asset(s): Standing Mario, Jumping Mario

% Mario reaches the not moving mushroom, Mario transforms into a red goomba (3 seconds)
% Mario shifts and morphs(standing Mario-> Big footed Goomba)
% Asset(s): Standing Mario, Mushroom, Big footed Goomba
 
% Goomba Mario stops and wobbles in place, and proceeds toward the end of level (4 seconds)
% Goomba Mario Shears left and right (wobble), Reflections and shifts after
% Asset(s): Big footed Goomba

% Goomba Mario goes down pipe (2 seconds)
% Shears downward like a pankcake.
% Asset(s): Red Goomba
end

%% SCENE 2 - Tim

%%Transition -----------

%pull in new background - have mario walk into the castle gate/door

%have Mario appear in the dungeon...falling through the roof? 
%pretty classic Mario

%%Koops's appear ---------

%pull in 2 or 3 koopa enemies

%for i = 
%have the koopa's move together towards Mario then stop
%end

%for i =
%have mario move to jump on their heads
    %for j = 
    %each squished guy can fly off spinning
        %for k =
        %spin a little bit
        %end
    %end
%end

%%Mario Get's Firepower ---------

%for i = 
%Mario moves forward
%end

%Mario jumps to bump a block

%for i = 1:3
%a Firepower flower expands out of the top of the block
%end

%for i = 
%mario moves to left or right to make flower accessable
% end

%for i = 
%Mario jumps up to the firepower flower
%end

%for i = 
%Mario moves over and down to flower
%end

%for i = 1:5
%Mario transforms into fireball Mario
%end

%for i= 
%Mario jumps off
    %for j = 
    %flipping a little each loop
    %end
%end

%%two more turtles appear --------------

%for i = 
%two fireballs go laterally
    %for j = 
    %fireballs oscillating up and down
    %end
    
        %if any vector in fireball = any vector in turtle:
        %fireball dissapear
            %for k = 
            %turtles spins off 
            %end
        %end
        
%end

%%Victory Bounce -----------
%for i = 
%Mario does a couple of excited bounces
%end

%for i = 
%Mario runs off to reach a green pipe
%end

%for i = 
%Mario transforms into a flat line - simulating a drop into the next level.
%end


%% SCENE 3 - Ian

% In Scene III, Mario is in an ice cave. He is nearly at the end of his
% journey, but some obstacles remain. Note: use threshold 150.

% Scene elements:

% 1: Goomba attack: there will be three Goomba that walk along the
% disappearing blocks and the slope. Mario will jump on top of each Goomba. 
% This process will use path translation to move the Goombas down the slope 
% and vertical shifts for Mario jumping. The Goombas will get "squished"
% when Mario lands on them, so a vertical shear will be used for this
% effect. This element should take about 10-12 seconds.

% Goombas walk along blocks:
% for
%     
% end

% Goombas walk along slope:
% for
%     
% end

% Mario jumps onto Goombas
% for
%     % Goomba gets squished
%     for
%         
%     end
% end

% 2: Falling icicles: once Mario has defeated the Goombas, he will need to
% cross the icicles, which will fall using vertical shifts. He will dodge
% them by rolling along the blocks on the floor, which will use the
% rotation transformation. He will then walk to the left and jump to hit
% his head on the ON blocks. These will trigger a mushroom to appear. This
% element should take about 10 seconds.

% Mario rotating:
% for
%     % Falling icicles:
%     for
%     
%     end
% 
% end

% Mario walks to block 1
% for
%     
% end

% Mario jumps into block 1
% for
%     
% end

% Mario walks to block 2
% for
%     
% end

% Mario jumps into block 2
% for
%     
% end

% Mushroom appears
% for
%     
% end

% 3: Collecting the mushroom: Mario will walk to the mushroom, positioned
% on the ledge above his starting position. He will jump to get the
% mushroom and then fall down, using the path translation transformation.
% He will then morph into a larger version of himself, and run across the
% block floor to the rightmost side of the level. This element should take
% 10-12 seconds.

% Mario walks to mushroom:
% for
%     
% end

% Mario jumps into mushroom:
% for
%     
% end

% Mario falls from ledge:
% for
%     
% end

% Mario morphs into bigger Mario:
% for
%     
% end

% Mario runs up slope:
% for
%     
% end

% Mario runs across level to rightmost side:
% for
%     
% end

%% SCENE 4 - Matt

clear all; close all

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
kingboo_params = {hb, [1 1 1], 0.5};

set(gca,'color','none','handlevisibility','off','visible','off');

% create element matrcies
mario = imread('jumpingmario.jpg');
boo = imread('Boo.png');
fireball = imread('boofireball.jpg');
kingboo = imread('kingboo.jpg');

mario = pic2points(mario)';
boo = pic2points(boo)';
fireball = pic2points(fireball)';
kingboo = pic2points(kingboo)';

mario(3, :) = ones(1, length(mario));
boo(3, :) = ones(1, length(boo));
fireball(3, :) = ones(1, length(fireball));
kingboo(3, :) = ones(1, length(kingboo));

% == ANIMATION BEGINS ==

tic

% Mario enters the scene
mario = scale(mario, 0.15, 0.15);
mario = reflect(mario, 'y');
mario = translate(mario, 420, -31);
h_mario = draw(mario, mario_params);

% Mario jumps off from bullet bill
for i = 1:32
    mario = translate(mario, -2, -1); delete(h_mario);
    h_mario = draw(mario, mario_params);

    pause(0.01)
end

% Mario moves forward a bit, skeptically
for i = 1:50
    mario = translate(mario, -1, 0); delete(h_mario);
    h_mario = draw(mario, mario_params);
    
    pause(0.03)
end

% Boo enters the scene from the doorway
boo = translate(boo, -130, -90);
boo = scale(boo, 0.13, 0.13);
h_boo = draw(boo, boo_params);

% Boo flys towards Mario
for i = 1:20
    
    boo = translate(boo, 10, 0); delete(h_boo)
    h_boo = draw(boo, boo_params);
    
    pause(0.02)
end

% Mario does a front flip over Boo
for i = 1:20
    boo = translate(boo, 10, 0); delete(h_boo)
    h_boo = draw(boo, boo_params);
    
    mario = translate(mario, -3, 4);
    mario = rotate(mario, pi/20); delete(h_mario)
    h_mario = draw(mario, mario_params);
    
    pause(0.02)
end

for i = 1:20
    boo = translate(boo, 5, 0); delete(h_boo)
    h_boo = draw(boo, boo_params);
    
    mario = translate(mario, -3, -4);
    mario = rotate(mario, pi/20); delete(h_mario)
    h_mario = draw(mario, mario_params);
    
    pause(0.02)
end

% Boo and Mario turn to face each other
mario = reflect(mario, 'y'); delete(h_mario)
boo = reflect(boo, 'y'); delete(h_boo)
h_mario = draw(mario, mario_params);
h_boo = draw(boo, boo_params);

% Intense faceoff moment
pause(0.5)

% Boo shoots a fireball at Mario
fireball = rotate(fireball, -pi/2);
fireball = scale(fireball, 0.1, 0.1);
fireball = translate(fireball, 124, -163);
h_fireball = draw(fireball, fb_params);

for i = 1:5
    fireball = translate(fireball, -10, 0); delete(h_fireball)
    h_fireball = draw(fireball, fb_params);
    
    pause(0.02)
end

mario = reflect(mario, 'y'); delete(h_mario)
h_mario = draw(mario, mario_params);

% Mario runs from the fireball
for i = 1:20
    fireball = translate(fireball, -10, 0); delete(h_fireball)
    h_fireball = draw(fireball, fb_params);
    
    mario = translate(mario, -9.3, 0); delete(h_mario);
    h_mario = draw(mario, mario_params);
    
    pause(0.02)
end

% Mario jumps over fireball
for i = 1:20
    fireball = translate(fireball, -10, 0); delete(h_fireball)
    h_fireball = draw(fireball, fb_params);
    
    mario = translate(mario, -5, 7); delete(h_mario);
    h_mario = draw(mario, mario_params);
    
    pause(0.02)
end

for i = 1:20
    fireball = translate(fireball, -10, 0); delete(h_fireball)
    h_fireball = draw(fireball, fb_params);
    
    mario = translate(mario, -5, -7); delete(h_mario);
    h_mario = draw(mario, mario_params);
    
    pause(0.02)
end

% Mario runs back towards Boo
mario = reflect(mario, 'y'); delete(h_mario)
h_mario = draw(mario, mario_params);

% Mario is unphased by Boo's petty attacks
for i = 1:10
    mario = translate(mario,  10, 0); delete(h_mario);
    h_mario = draw(mario, mario_params);
    
    pause(0.1)
end

% Mario and Boo rush towards each
for i = 1:15
    mario = translate(mario,  10, 0); delete(h_mario);
    h_mario = draw(mario, mario_params);
    
    boo = translate(boo,  -10, 0); delete(h_boo);
    h_boo = draw(boo, boo_params);
    
    pause(0.04)
end

% Mario goes mini and hides from Boo
for i = 1:20
    mario = scale(mario, 0.90, 0.90); 
    mario = translate(mario, 0, -1.5); delete(h_mario)
    h_mario = draw(mario, mario_params);
    
    boo = translate(boo,  -10, 0); delete(h_boo);
    h_boo = draw(boo, boo_params);
    
   pause(0.02)
end

% Mario runs off while Boo looks for him
for i = 1:20
    mario = translate(mario, 10, 0); delete(h_mario)
    h_mario = draw(mario, mario_params);
    
    if rem(i, 4) == 0 
        boo = reflect(boo, 'y'); delete(h_boo);
        h_boo = draw(boo, boo_params);
    end
    
    pause(0.1)
end

boo = reflect(boo, 'y'); delete(h_boo);
h_boo = draw(boo, boo_params);

% Mario returns to his normal size as Boo goes to the castle
for i = 1:20
    mario = scale(mario, 1.112, 1.112); 
    mario = translate(mario, 0, 1.2); delete(h_mario)
    h_mario = draw(mario, mario_params);
    
    boo = translate(boo,  -12, 0); delete(h_boo);
    h_boo = draw(boo, boo_params);
    
    pause(0.05)
end

% Mario jumps a couple times to celebrate before the complete the level
for k = 1:3
    for i = 1:10
        mario = translate(mario, 0, 2); delete(h_mario)
        h_mario = draw(mario, mario_params);

        pause(0.01)
    end

    for i = 1:10
        mario = translate(mario, 0, -2); delete(h_mario)
        h_mario = draw(mario, mario_params);

        pause(0.01)
    end
end

pause(0.5)

mario = reflect(mario, 'y'); delete(h_mario);
h_mario = draw(mario, mario_params);

% Mario walks towards the goal
for i = 1:50
    mario = translate(mario, -2, 0); delete(h_mario)
    h_mario = draw(mario, mario_params);
    
    pause(0.04)
end

% King Boo appears
h_kingboo = draw(kingboo, kingboo_params);

toc





