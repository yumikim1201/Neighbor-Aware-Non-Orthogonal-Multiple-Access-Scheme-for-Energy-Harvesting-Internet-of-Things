
function [R_matrix, C_matrix, R_oneD, C_oneD] = F_Generation_RC(S,A,S_matrix,Summuation_Term,NOISE,h_Matrix,policy_Matrix,Num_device,i)

    R_matrix = zeros(S,A);
    C_matrix = zeros(S,A);

    for s_now = 1:S
        for a = 1:A
            R_matrix(s_now,a) = R(S,A,s_now,S_matrix,a,Summuation_Term,NOISE,h_Matrix,policy_Matrix,Num_device,i);
            C_matrix(s_now,a) = C(s_now,S_matrix,a);
        end
    end

    R_oneD = R_matrix(:);
    C_oneD = C_matrix(:);
    
end