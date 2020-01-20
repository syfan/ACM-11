% ANGLES
% Determines the best and worst angles at which to run from the raptors.
clc
clear
for a = 1:360
   times(a) = timeToMeal(a);
end
[max, max_ind] = max(times);
[min, min_ind] = min(times);
fprintf('To survive the longest, it is best to run at an angle of %i\n', max_ind);
fprintf('To die quickly, it is best to run at an angle of %i\n', min_ind);