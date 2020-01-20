% TRIANGLES
% Breaks a stick into three random pieces and gives the 
% probability that the sticks can form a triangle
samples = 10e5;
breaks = sort(rand(2, samples));
shorter = breaks(1,:);
longer = breaks(2,:);

first = shorter;
second = longer - shorter;
third = 1 - longer;
sticks = [first; second; third];
sticks = sort(sticks);

first = sticks(1,:);
second = sticks(2,:);
third = sticks(3,:);

truths = (first + second) > third;
probability = mean(truths);
fprintf('The probability of triangles being formed is: %f\n', probability);