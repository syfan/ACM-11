% COINS
% Detects which coins are which in a an image of coins.
% No arguments
clear % don't want old values causing errors
coin_img = imread('coins.png'); % load our image
subplot(2, 2, 1);  % create our figure
subimage(coin_img);
title('coins');
axis off;
edges = edge(coin_img, 'Canny', 0.6); % detect edges here
subplot(2, 2, 2);
subimage(edges);
title('edges');
axis off;
stats = regionprops(edges,'FilledImage');
edges2 = imfill(edges, 'holes'); % fill in the circles
subplot(2, 2, 3);
subimage(edges2);
title('filled coins');
axis off;
subplot(2, 2, 4);
L = bwlabel(edges2); % recognize the separate shapes
RGB_labels = label2rgb(L, @jet, 'k'); % color is nice
imshow(RGB_labels) % see the color plots
title('labeled coins');

stats2 = regionprops(L, 'area'); % obtain areas of circles
areas = [stats2.Area]; % extract said areas
max = max(areas); % obtain the maximum area
areas = areas / max; % the areas are now normalized by the largest value

centers = regionprops('table', edges, 'Centroid'); % obtain centers
extracted_centers = centers{:, :}; % extracting centers
len = length(extracted_centers);
xs = extracted_centers(1 : len);  % get x values of centers
ys = extracted_centers(len + 1 : 2 * len); % and the y values too

smaller = find(areas < 0.9); % obtain indices of coins smaller than nickels
text_labels = cell(1, 10); 
text_labels(:) = {'nickel'}; % start with all labeled as 'nickel'
text_labels(smaller) = {'dime'}; % label the smaller coins as dimes.
text(xs - 24, ys, text_labels) % label the image

