% DICE
% Imports the variables representing two dice that were 
% rolled a large number of times and displays the roll
% statistics.  Takes no arguments, but needs DiceData.mat
load('DiceData.mat');
a = unique(die1);
b = unique(die2);
first = [a, histc(die1(:),a)];
second = [b, histc(die2(:),b)];
display(first)
display(second)
fprintf('From observing the rolls, die1 is fair, die2 is not.\n')