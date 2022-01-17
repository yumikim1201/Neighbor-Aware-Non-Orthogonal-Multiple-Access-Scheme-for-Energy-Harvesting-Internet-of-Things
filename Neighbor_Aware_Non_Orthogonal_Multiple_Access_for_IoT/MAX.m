P_matrix_MAX = P_matrix(:,:,5);
Sationary_Prob = P_matrix_MAX^1000;
Sationary_Prob_S = Sationary_Prob(1,:);

policy_MAX = zeros(S,A);

for s = 1:S
    for a = 1:A
        if a == 5
            policy_MAX(s,a) = 1;
        end
    end
end

Temp1 = policy_MAX(:,1) .* transpose(Sationary_Prob_S);
Temp2 = policy_MAX(:,2) .* transpose(Sationary_Prob_S);
Temp3 = policy_MAX(:,3) .* transpose(Sationary_Prob_S);
Temp4 = policy_MAX(:,4) .* transpose(Sationary_Prob_S);
Temp5 = policy_MAX(:,5) .* transpose(Sationary_Prob_S);

policy_MAX_oneD = cat(1,Temp1,Temp2,Temp3,Temp4,Temp5);
