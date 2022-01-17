P_S_SA = P_matrix(:,:,1);
for a = 2:A
    P_S_SA = cat(2,P_S_SA,P_matrix(:,:,a));
end

Temp = eye(S);
Term1 = Temp;

for a = 2:A
    Term1 = cat(2,Term1,Temp);
end

Aeq_Const_2 = Term1 - P_S_SA;
beq_Const_2 = zeros(1,S);
