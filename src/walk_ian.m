function [] = walk_ian(image, xi, yi, xf, yf, steps)

Dims = dims(image);
center = Dims(:,1);
image_c = image - [center(1) .* ones(1, length(image)); center(2) .* ones(1, length(image))];
image_start_pos = image_c + [xi .* ones(1, length(image)); yi .* ones(1, length(image))];
imageH = draw_ian(image_start_pos);

for i = 1:1:steps
    image_start_pos = mS1(image_start_pos, (xf - xi) / steps, (yf - yi) / steps);
    delete(imageH)
    if i ~= steps
        imageH = draw_ian(image_start_pos);
        pause(1/30);
    end    
end

end