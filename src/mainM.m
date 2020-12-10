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

toc

% GAME OVER


