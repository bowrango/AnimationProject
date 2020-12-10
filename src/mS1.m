function [image_out] = mS1(image, distX, distY)

S = [1 0 distX; 0 1 distY; 0 0 1];
image_padded = [image; ones(1, length(image))];
image_padded = S * image_padded;
image_out = image_padded(1:2,:);

end