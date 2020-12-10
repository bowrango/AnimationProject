function [] = materialize(image, x, y, steps)

Dims = dims(image);
center = Dims(:, 1);

for i = 1:1:steps
    imageH = draw_ian([1 0 x; 0 1 y; 0 0 1] * padding_ian((i/steps) * (image - center) + center));
    pause(1/30)
    delete(imageH)
end

end