function [Dims] = dims(image)

xmin = min(image(1,:));
xmax = max(image(1,:));
ymin = min(image(2,:));
ymax = max(image(2,:));
centerX = 0.5*xmin+0.5*xmax;
centerY = 0.5*ymin+0.5*ymax;
Dims = [centerX xmin xmax; centerY ymin ymax];


end