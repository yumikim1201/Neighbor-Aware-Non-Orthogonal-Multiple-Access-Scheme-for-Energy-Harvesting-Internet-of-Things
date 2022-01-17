function r = R(S,A,s_now,S_matrix,a,Summuation_Term,NOISE,h_Matrix,policy_Matrix,Num_device,i)
    
    now = ONEN(s_now,S_matrix);
    now_e = now(1);
    r = 0;

    for k = 1:Num_device
        if k == i
              if now_e > a
                r = r + log2 (1 + (h_Matrix(i)^2 * (a-1)) / (Summuation_Term + NOISE));
              else
                r = r + 0;
              end
        else
            policy = policy_Matrix(:,:,k);
            Expected_power = Calculate_Expected_power(S,A,policy);
            r = r + log2 (1 + (h_Matrix(k)^2 * Expected_power) / (Summuation_Term + NOISE));
        end
    end
end