function [ m comp] = randomised_median( S )
% Randomised Median algorithm implementation as described
% in text book Probability and Computation, page 54
% algoritm 3.1. For sorting Quicksort algorithm is used
% as in  set(1).
%
% (input): S a list of elements
% (output): m median of S
% (output): comp number of comparisons to find median

m  = NaN;
n = length(S);
R = [];
comp = 0;

for ii= [1:ceil(n^(3/4))]   %uniform sampling on S
    index = randi([1 n],1);
    R = [R S(index)];
end
R  = quicksort( R );  %sort R

d_index = floor((1/2)*n^(3/4)-sqrt(n));
u_index = ceil ((1/2)*n^(3/4)+sqrt(n));

d = R(d_index);
u = R(u_index);

C = [];

ld = 0;
lu = 0;

for ii=[1:n]
    x = S(ii);
    if d <= x && x <= u
        C = [C x];
    elseif x < d
        ld = ld + 1;
    elseif x > u
        lu = lu + 1;
    end
    comp = comp + 1;
end

if ld > n/2 || lu > n/2 %fail condition
    fprintf('fail');
    return
end

if length(C) <= fix(4*n^(3/4))  %fail condition
    [C comp2] = quicksort(C);
else
    fprintf('fail');
    return
    
end

m_index = floor(n/2)-ld+1;
m = C(m_index);
comp = comp + comp2; %merge comparisons

end
