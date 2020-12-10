function [image_out] = padding_ian(image)

image_out = [image; ones(1, length(image))];

end