%% Intro

% This main script will outline the story for our animation. It will
% implement various transformation functions in loops to animate a character.

% Each of us will be responsible for one of these scenes. Once we figure out a 
% story, we should include the expected inputs and outputs.

%% SCENE 1 
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

%% SCENE 2




%% SCENE 3

% Scene III will follow Scene II, in which ____.
% The transition from Scene II to Scene III will look like ____.

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

% From here, Mario will do ____ to transition into the final scene.

%% SCENE 4


% This is mine
