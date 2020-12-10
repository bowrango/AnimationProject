function [] = doaflip(image1, image2, xi1, yi1, xi2, yi2, xf2, yf2, steps)

Dims1 = dims(image1);
center1 = Dims1(:,1);
image_c1 = image1 - [center1(1) .* ones(1, length(image1)); center1(2) .* ones(1, length(image1))];
image_start_pos1 = image_c1 + [xi1 .* ones(1, length(image1)); yi1 .* ones(1, length(image1))];

Dims2 = dims(image2);
center2 = Dims2(:,1);
image_c2 = image2 - [center2(1) .* ones(1, length(image2)); center2(2) .* ones(1, length(image2))];
image_start_pos2 = image_c2 + [xi2 .* ones(1, length(image2)); yi2 .* ones(1, length(image2))];

imageH1 = draw_ian(image_start_pos1);
imageH2 = draw_ian(image_start_pos2);

for i = 1:1:steps
    image_start_pos1 = mR1(image_start_pos1, 360/steps);
    image_start_pos2 = mS1(image_start_pos2, (xf2 - xi2) / steps, (yf2 - yi2) / steps);
    delete(imageH1)
    delete(imageH2)
    if i ~= steps
        imageH1 = draw_ian(image_start_pos1);
        imageH2 = draw_ian(image_start_pos2);
        pause(1/30);
    end
    
end

end