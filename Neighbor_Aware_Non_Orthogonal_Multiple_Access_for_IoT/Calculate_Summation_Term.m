function Summuation_Term = Calculate_Summation_Term(S,A,policy_Matrix,Num_device,i,h_Metrix)
    
    Summuation_Term = 0;
    
%    for s_now = 1:S
%        for a = 1:A
            for k = 1:Num_device
                 if k ~= i
                    policy = policy_Matrix(:,:,k);
                    Expected_power = Calculate_Expected_power(S,A,policy);
                    Summuation_Term = Summuation_Term + h_Metrix(k) * Expected_power;
                 end
            end
 %       end
 %   end
    
end