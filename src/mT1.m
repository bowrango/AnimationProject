function [image_out] = mT1(image)

T1 = [1 0 0; 0 -1 0; 0 0 1];
image_padded = [image; ones(1, length(image))];
image_padded = T1 * image_padded;
image_out = image_padded(1:2,:);

end