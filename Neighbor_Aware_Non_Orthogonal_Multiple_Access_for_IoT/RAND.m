P_matrix_RAND = P_matrix(:,:,1) * P_matrix(:,:,2) * P_matrix(:,:,3) * P_matrix(:,:,4) * P_matrix(:,:,5);
Sationary_Prob = P_matrix_RAND^1000;
Sationary_Prob_S = Sationary_Prob(1,:);

policy_RAND = zeros(S,A);

for s = 1:S
    for a = 1:A
        policy_RAND(s,a) = 1/A;
    end
end

Temp1 = policy_RAND(:,1) .* transpose(Sationary_Prob_S);
Temp2 = policy_RAND(:,2) .* transpose(Sationary_Prob_S);
Temp3 = policy_RAND(:,3) .* transpose(Sationary_Prob_S);
Temp4 = policy_RAND(:,4) .* transpose(Sationary_Prob_S);
Temp5 = policy_RAND(:,5) .* transpose(Sationary_Prob_S);

policy_RAND_oneD = cat(1,Temp1,Temp2,Temp3,Temp4,Temp5);
