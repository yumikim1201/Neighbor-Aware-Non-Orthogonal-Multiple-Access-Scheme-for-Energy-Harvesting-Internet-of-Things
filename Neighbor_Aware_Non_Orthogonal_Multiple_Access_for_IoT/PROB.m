P_matrix_PROB = P_matrix(:,:,1);


P_matrix_PROB = P_matrix_PROB * P_matrix(:,:,1)^1000 * P_matrix(:,:,2)^3000 * P_matrix(:,:,3)^2500 * P_matrix(:,:,4)^2500 * P_matrix(:,:,5)^1000;


Sationary_Prob = P_matrix_PROB^1000;
Sationary_Prob_S = Sationary_Prob(1,:);

policy_PROB = zeros(S,A);

for s = 1:S
    for a = 1:A
        if a == 1
            policy_PROB(s,a) = 0.1;
        elseif a == 2
            policy_PROB(s,a) = 0.3; 
        elseif a == 3
            policy_PROB(s,a) = 0.25;
        elseif a == 4
            policy_PROB(s,a) = 0.25;
        else
            policy_PROB(s,a) = 0.1;
        end
    end
end

Temp1 = policy_PROB(:,1) .* transpose(Sationary_Prob_S);
Temp2 = policy_PROB(:,2) .* transpose(Sationary_Prob_S);
Temp3 = policy_PROB(:,3) .* transpose(Sationary_Prob_S);
Temp4 = policy_PROB(:,4) .* transpose(Sationary_Prob_S);
Temp5 = policy_PROB(:,5) .* transpose(Sationary_Prob_S);

policy_PROB_oneD = cat(1,Temp1,Temp2,Temp3,Temp4,Temp5);

