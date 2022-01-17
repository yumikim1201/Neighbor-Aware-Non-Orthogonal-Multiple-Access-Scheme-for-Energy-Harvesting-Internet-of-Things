function Expected_power = Calculate_Expected_power(S,A,policy)
    
    Expected_power = 0;
    
    for s_now = 1:S
        for a = 1:A
            Expected_power = Expected_power + (a-1) * policy(s_now,a);
        end
    end

end