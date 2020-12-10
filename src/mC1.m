function [image_out] = mC1(image, scale_factor_X, scale_factor_Y)

Dims = dims(image);
center = Dims(:,1);
C = [scale_factor_X 0 0; 0 scale_factor_Y 0; 0 0 1];
image_padded = [image; ones(1, length(image))];
image_padded = C * (image_padded - [center; 0]) + [center; 0];
image_out = image_padded(1:2,:);

end