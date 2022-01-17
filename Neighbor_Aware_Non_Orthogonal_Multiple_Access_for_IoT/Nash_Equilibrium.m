clc;
%clear all
%close all

Parameter_setting;
Total_Sim = 10;
policy_Matrix_Ini_Action5 = [0.3 0.1 0.7 0.5 0.4];
Transmission_Prob_Action5_IoT1(1,1) = policy_Matrix_Ini_Action5(1);
Transmission_Prob_Action5_IoT2(1,1) = policy_Matrix_Ini_Action5(2);
Transmission_Prob_Action5_IoT3(1,1) = policy_Matrix_Ini_Action5(3);
Transmission_Prob_Action5_IoT4(1,1) = policy_Matrix_Ini_Action5(4);
Transmission_Prob_Action5_IoT5(1,1) = policy_Matrix_Ini_Action5(5);
policy_Matrix_seq = BRD_Function(Total_Sim,S_matrix,S,A,Num_device,h_Matrix,p_H_Matrix,NOISE,theta_E_Matrix);
a = [0 1 2 3 4];
for t = 2:7
    Transmission_Prob_Action5_IoT1(1,t) = sum(policy_Matrix_seq(:,5,1,t));
    Transmission_Prob_Action5_IoT2(1,t) = sum(policy_Matrix_seq(:,5,2,t));
    Transmission_Prob_Action5_IoT3(1,t) = sum(policy_Matrix_seq(:,5,3,t));
    Transmission_Prob_Action5_IoT4(1,t) = sum(policy_Matrix_seq(:,5,4,t));
    Transmission_Prob_Action5_IoT5(1,t) = sum(policy_Matrix_seq(:,5,5,t));
end

x = [0:6];
plot(x,Transmission_Prob_Action5_IoT1,'-*','markers',9);
hold on;
plot(x,Transmission_Prob_Action5_IoT2,'-o','markers',9);
hold on;
plot(x,Transmission_Prob_Action5_IoT3,'-d','markers',9);
hold on;
plot(x,Transmission_Prob_Action5_IoT4,'-s','markers',9);
hold on;
plot(x,Transmission_Prob_Action5_IoT5,'-^','markers',9);
hold on;
grid on;
legend('IoT device 1','IoT device 2','IoT device 3','IoT device 4','IoT device 5')
xlabel('Iteration');
ylabel('\pi(S,A_i=4)');