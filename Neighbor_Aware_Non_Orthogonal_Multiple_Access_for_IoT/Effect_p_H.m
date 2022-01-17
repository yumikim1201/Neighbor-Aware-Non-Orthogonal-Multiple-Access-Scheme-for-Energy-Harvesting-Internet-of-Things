clc
clear all
close all

Parameter_setting;
h_Matrix = [1 1 1 1 1];
theta_E = 0.05;
Total_Sim = 10;

for z = 1:5
    
    Target_IoT = z;
    x(1,z) = 0.2 * z - 0.1;
    p_H = p_H_Matrix(Target_IoT);
    Generation_P;
    MAX;
    MIN;
    RAND;
    PROB;

    for zz = 1:A
        policy_Matrix_MAX(:,:,zz) = policy_MAX;
        policy_Matrix_MIN(:,:,zz) = policy_MIN;
        policy_Matrix_RAND(:,:,zz) = policy_RAND;
        policy_Matrix_PROB(:,:,zz) = policy_PROB;
    end
    Summuation_Term_MAX = Calculate_Summation_Term(S,A,policy_Matrix_MAX,Num_device,Target_IoT,h_Matrix);
    Summuation_Term_MIN = Calculate_Summation_Term(S,A,policy_Matrix_MIN,Num_device,Target_IoT,h_Matrix);
    Summuation_Term_RAND = Calculate_Summation_Term(S,A,policy_Matrix_RAND,Num_device,Target_IoT,h_Matrix);
    Summuation_Term_PROB = Calculate_Summation_Term(S,A,policy_Matrix_PROB,Num_device,Target_IoT,h_Matrix);
    [R_matrix_MAX, C_matrix_MAX, R_oneD_MAX, C_oneD_MAX] = F_Generation_RC(S,A,S_matrix,Summuation_Term_MAX,NOISE,h_Matrix,policy_Matrix_MAX,Num_device,Target_IoT);
    [R_matrix_MIN, C_matrix_MIN, R_oneD_MIN, C_oneD_MIN] = F_Generation_RC(S,A,S_matrix,Summuation_Term_MIN,NOISE,h_Matrix,policy_Matrix_MIN,Num_device,Target_IoT);
    [R_matrix_RAND, C_matrix_RAND, R_oneD_RAND, C_oneD_RAND] = F_Generation_RC(S,A,S_matrix,Summuation_Term_RAND,NOISE,h_Matrix,policy_Matrix_RAND,Num_device,Target_IoT);
    [R_matrix_PROB, C_matrix_PROB, R_oneD_PROB, C_oneD_PROB] = F_Generation_RC(S,A,S_matrix,Summuation_Term_PROB,NOISE,h_Matrix,policy_Matrix_PROB,Num_device,Target_IoT);

    policy_Matrix_seq = BRD_Function(Total_Sim,S_matrix,S,A,Num_device,h_Matrix,p_H_Matrix,NOISE,theta_E_Matrix);
    policy_Matrix = policy_Matrix_seq(:,:,:,Total_Sim);
    policy_Matrix_Target = policy_Matrix(:,:,Target_IoT);
    policy = reshape(policy_Matrix_Target,[],1);
    Summuation_Term = Calculate_Summation_Term(S,A,policy_Matrix,Num_device,Target_IoT,h_Matrix);

    h = h_Matrix(Target_IoT);
    [R_matrix, C_matrix, R_oneD, C_oneD] = F_Generation_RC(S,A,S_matrix,Summuation_Term,NOISE,h_Matrix,policy_Matrix,Num_device,Target_IoT);

    zeta_R(1,z) = transpose(policy)*R_oneD;
    zeta_R_MAX(1,z) = transpose(policy_MAX_oneD)*R_oneD_MAX;
    zeta_R_MIN(1,z) = transpose(policy_MIN_oneD)*R_oneD_MIN;
    zeta_R_RAND(1,z) = transpose(policy_RAND_oneD)*R_oneD_RAND;
    zeta_R_PROB(1,z) = transpose(policy_PROB_oneD)*R_oneD_PROB;

    xi_E(1,z) = transpose(policy)*C_oneD;
    xi_E_MAX(1,z) = transpose(policy_MAX_oneD)*C_oneD_MAX;
    xi_E_MIN(1,z) = transpose(policy_MIN_oneD)*C_oneD_MIN;
    xi_E_RAND(1,z) = transpose(policy_RAND_oneD)*C_oneD_RAND;
    xi_E_PROB(1,z) = transpose(policy_PROB_oneD)*C_oneD_PROB;
    
end

figure(1)
plot(x,zeta_R,'-*','markers',9);
hold on;
plot(x,zeta_R_MAX,'-o','markers',9);
hold on;
plot(x,zeta_R_MIN,'-d','markers',9);
hold on;
plot(x,zeta_R_RAND,'-s','markers',9);
hold on;
plot(x,zeta_R_PROB,'-^','markers',9);
hold on;
xlabel('p^H');
ylabel('\zeta_R');
legend('NA-NOMA','MAX','MIN','RAND','PROB');
grid on;

figure(2)
plot(x,xi_E,'-*','markers',9);
hold on;
plot(x,xi_E_MAX,'-o','markers',9);
hold on;
plot(x,xi_E_MIN,'-d','markers',9);
hold on;
plot(x,xi_E_RAND,'-s','markers',9);
hold on;
plot(x,xi_E_PROB,'-^','markers',9);
hold on;
xlabel('p^H');
ylabel('\xi_E');
legend('NA-NOMA','MAX','MIN','RAND','PROB');
grid on;
