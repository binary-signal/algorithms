function [ sorted, comp ] = quicksort( S )
% Quicksort algorithm implementation as described
% in text book Probability and Computation, in page 31,
% algorithm 2.1, with a small modification to handle non
% distinct elements too
%
% (input): S a list of elements
% (output): ordered list of S elements
% (output): number of comparisons to sort S

% trivial case
if (length(S) == 0 || length(S) == 1)
    sorted = S;
    comp = 0;
    return
end

n=size(S,2);
m=fix(n/2);
x=S(m);     %pivot

S1 = [];    %store  elements of S after comparison
S2 = [];    %with pivot into two sublists

comp = 0;

for ii = [1:n]    %iterate all over elements of S
    if ii == m    %skip comparison with pivot and it's self
        continue
    end
    if S(ii) <= x   %use equal to handle non disting elements
        S1 = [S1 S(ii)];
    elseif S(ii) > x
        S2 = [S2 S(ii)];
    end
    comp = comp + 1;
end

[S1, comp1] = quicksort(S1);   %quicksort sublists
[S2, comp2] = quicksort(S2);

sorted = [S1 x S2];  %merge sorted  lists
comp = comp + comp1 + comp2;
end

