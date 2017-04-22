function [ m comp ] = quicksort_median( S )
% Finds the median of a list with quicksort as implemented
% in the preview project
%
% (input): S a list of elements
% (output): m median of S
% (output): number of comparisons to find median

m = NaN;    %median element
comp = 0;   %number of comparisons
n = length(S);
[S comp] = quicksort(S);    %sort elements with quicksort
m =S(floor(n/2)+1);    %pick median element
end
