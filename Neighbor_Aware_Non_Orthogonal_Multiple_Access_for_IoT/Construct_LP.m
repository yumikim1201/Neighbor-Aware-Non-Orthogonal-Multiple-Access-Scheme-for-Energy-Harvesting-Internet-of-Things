
f = - transpose(R_oneD);

Const_1;
Const_2;
Const_3;
Const_4;

lb = zeros(1,S*A);

% A_ineq = cat(1,A_Const_1,A_Const_4);
% b_ineq = cat(2,b_Const_1,b_Const_4);

A_ineq = A_Const_1;
b_ineq = b_Const_1;

A_eq = cat(1,Aeq_Const_2,Aeq_Const_3);
b_eq = cat(2,beq_Const_2,beq_Const_3);

% [x,fval,exitflag] = linprog(f,A_ineq,b_ineq,A_eq,b_eq,lb);
% fval
% exitflag
%  transpose(x)*R_oneD
%  transpose(x)*C_oneD

%options=optimset('MaxIter',10000);