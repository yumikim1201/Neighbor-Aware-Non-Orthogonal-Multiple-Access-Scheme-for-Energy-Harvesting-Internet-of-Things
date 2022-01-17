function policy_Matrix_seq = BRD_Function(Total_Sim,S_matrix,S,A,Num_device,h_Matrix,p_H_Matrix,NOISE,theta_E_Matrix)
    
    t = 1;
    Initial_policy_Matrix = ones(S,A,Num_device) / (S*A);
    policy_Matrix_seq = zeros(S,A,Num_device,Total_Sim);
    policy_Matrix_seq(:,:,:,t) = Initial_policy_Matrix;

    while t < Total_Sim
        x_axis(1,t) = t;
        for i = 1:Num_device
            Summuation_Term = Calculate_Summation_Term(S,A,policy_Matrix_seq(:,:,:,t),Num_device,i,h_Matrix);
            h = h_Matrix(i);
            p_H = p_H_Matrix(i);
            if i == 1
                Generation_P;
                theta_E = theta_E_Matrix(1);
                [R_matrix, C_matrix, R_oneD, C_oneD] = F_Generation_RC(S,A,S_matrix,Summuation_Term,NOISE,h_Matrix,policy_Matrix_seq(:,:,:,t),Num_device,i);
                Construct_LP;
                [policy1,fval,exitflag] = linprog(f,A_ineq,b_ineq,A_eq,b_eq,lb);
                for a = 1:A
                    policy_Matrix_seq(:,a,1,t) = policy1(S*(a-1)+1:S*a);
                end

            elseif i == 2
                Generation_P;
                theta_E = theta_E_Matrix(2);
                [R_matrix, C_matrix, R_oneD, C_oneD] = F_Generation_RC(S,A,S_matrix,Summuation_Term,NOISE,h_Matrix,policy_Matrix_seq(:,:,:,t),Num_device,i);
                Construct_LP;
                [policy2,fval,exitflag] = linprog(f,A_ineq,b_ineq,A_eq,b_eq,lb);
                for a = 1:A
                    policy_Matrix_seq(:,a,2,t) = policy2(S*(a-1)+1:S*a);
                end

            elseif i == 3
                Generation_P;
                theta_E = theta_E_Matrix(3);
                [R_matrix, C_matrix, R_oneD, C_oneD] = F_Generation_RC(S,A,S_matrix,Summuation_Term,NOISE,h_Matrix,policy_Matrix_seq(:,:,:,t),Num_device,i);
                Construct_LP;
                [policy3,fval,exitflag] = linprog(f,A_ineq,b_ineq,A_eq,b_eq,lb);
                for a = 1:A
                    policy_Matrix_seq(:,a,3,t) = policy3(S*(a-1)+1:S*a);
                end

            elseif i == 4
                Generation_P;
                theta_E = theta_E_Matrix(4);
                [R_matrix, C_matrix, R_oneD, C_oneD] = F_Generation_RC(S,A,S_matrix,Summuation_Term,NOISE,h_Matrix,policy_Matrix_seq(:,:,:,t),Num_device,i);
                Construct_LP;
                [policy4,fval,exitflag] = linprog(f,A_ineq,b_ineq,A_eq,b_eq,lb);
                for a = 1:A
                    policy_Matrix_seq(:,a,4,t) = policy4(S*(a-1)+1:S*a);
                end

            elseif i == 5
                Generation_P;
                theta_E = theta_E_Matrix(5);
                [R_matrix, C_matrix, R_oneD, C_oneD] = F_Generation_RC(S,A,S_matrix,Summuation_Term,NOISE,h_Matrix,policy_Matrix_seq(:,:,:,t),Num_device,i);
                Construct_LP;
                [policy5,fval,exitflag] = linprog(f,A_ineq,b_ineq,A_eq,b_eq,lb);
                for a = 1:A
                    policy_Matrix_seq(:,a,5,t) = policy5(S*(a-1)+1:S*a);
                end

            end
        end
        policy_Matrix_seq(:,:,:,t+1) = policy_Matrix_seq(:,:,:,t);
%         sum(policy_Matrix_seq(:,:,1,10))
%         sum(policy_Matrix_seq(:,:,2,10))
%         sum(policy_Matrix_seq(:,:,3,10))
%         sum(policy_Matrix_seq(:,:,4,10))
%         sum(policy_Matrix_seq(:,:,5,10))
%         
        t = t + 1;

end
