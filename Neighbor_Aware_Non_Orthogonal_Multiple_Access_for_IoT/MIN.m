P_matrix_MIN = P_matrix(:,:,2);
Sationary_Prob = P_matrix_MIN^1000;
Sationary_Prob_S = Sationary_Prob(1,:);

policy_MIN = zeros(S,A);

for s = 1:S
    for a = 1:A
        if a == 2
            policy_MIN(s,a) = 1;
        end
    end
end

Temp1 = policy_MIN(:,1) .* transpose(Sationary_Prob_S);
Temp2 = policy_MIN(:,2) .* transpose(Sationary_Prob_S);
Temp3 = policy_MIN(:,3) .* transpose(Sationary_Prob_S);
Temp4 = policy_MIN(:,4) .* transpose(Sationary_Prob_S);
Temp5 = policy_MIN(:,5) .* transpose(Sationary_Prob_S);

policy_MIN_oneD = cat(1,Temp1,Temp2,Temp3,Temp4,Temp5);
