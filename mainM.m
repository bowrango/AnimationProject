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
mario = scaleM(mario, 0.15, 0.15);
mario = reflectM(mario, 'y');
mario = translateM(mario, 420, -31);
h_mario = drawM(mario, mario_params);

% Mario jumps off from bullet bill
for i = 1:32
    mario = translateM(mario, -2, -1); delete(h_mario);
    h_mario = drawM(mario, mario_params);

    pause(0.01)
end

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

% King Boo appears
h_kingboo = drawM(kingboo, kingboo_params);

toc





