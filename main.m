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

% create Mario and Boo matrices
mario = imread('jumpingmario.jpg');
boo = imread('Boo.png');
mario = pic2points(mario)';
boo = pic2points(boo)';
mario(3, :) = ones(1, length(mario));
boo(3, :) = ones(1, length(boo));

% scale and move characters 
mario = scale(mario, 0.25, 0.25);
boo = scale(boo, 0.3, 0.3);
boo = translate(boo, 100, 100);

% draw their positions
h_mario = draw(mario);
h_boo = draw(boo);

% have Boo and Mario move
for i = 1:10
    % update characters
    mario = translate(mario, 10, 0);
    boo = translate(boo, -12, 5);
    
    % delete previous images
    delete(h_mario);
    delete(h_boo);
    
    % draw the new character positions
    h_mario = draw(mario);
    h_boo = draw(boo);
    pause(0.3)
end






% Mario will walk into Boo's mansion where he will encounter the final
% boss. This scene will involve Mario fighting Boo, which will be broken down
% into several key engagements:

% 1. Boo will appear behind Mario, and will move closer to him (translation)

% Move Boo
% for
% end

% 2. Mario will turn around (reflection) and run towards Boo (translation).

% reflect Mario

% move Mario towards Boo
% for 
% end

% 3. Mario will attempt to jump onto Boo's head (translation), and Boo will
% react to this attack (scale, or shear)

% have Mario jump
% for
% end

% Boo reacts to attack 

% 4. Fighting will continue with more jumps and dodging movements
% (translation, scaling). Boo will shoot projectiles and change his form
% to confuse Mario

% Boo shoots projectile 
% for 
% end

% Mario dodges
% for 
% end

% Boo morphs his form to confuse Mario, and delievers a finishing attack
% for 
% end

% 5. Mario will be defeated by Boo, starting a death animation. Mario will
% rotate about his local axis and will gradually morph into a ghost.

% kill Mario
% for
% end

% 6. Ghost Mario will then leave the scene by floating to the
% top and vanishing

% transcend Mario
% for
% end







