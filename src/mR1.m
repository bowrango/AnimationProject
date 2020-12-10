function [image_out] = mR1(image, angle)

Dims = dims(image);
center = Dims(:,1);
R = [cos((pi/180)*angle) -sin((pi/180)*angle) 0; sin((pi/180)*angle) cos((pi/180)*angle) 0; 0 0 1];
image_padded = [image; ones(1, length(image))];
image_padded = R * (image_padded - [center; 0]) + [center; 0];
image_out = image_padded(1:2,:);

end