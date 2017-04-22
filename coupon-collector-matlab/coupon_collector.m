function [ ite ] = coupon_collector( n )
%   Simulate the coupon collector problem 
%   with parameter n as the number of coupons.
%
%   Inputs: (n) number of coupons to simulate
%   Outputs: (ite) number of simulation trials

    collected = false(1, n);    
    ite = 0;     %iterations
    unique = 0;
    while (unique<n)    %repeat until all coupons collected
        r = randi(n,1); 
        if not(collected(r))    %collect coupon if it's new
            unique=unique+1;
            collected(r) = true;
        end
    ite = ite+1;
    end
end

