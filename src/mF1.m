function [image_out] = mF1(image)

Dims = dims(image);
center = Dims(:,1);
F = [-1 0 0; 0 1 0; 0 0 1];
image_padded = [image; ones(1, length(image))];
image_padded = F * (image_padded - [center; 0]) + [center; 0];
image_out = image_padded(1:2,:);

end