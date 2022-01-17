P_matrix = zeros(S,S,A);

for s_now = 1:S
    for s_next = 1:S
        for a = 1:A
            P_matrix(s_now,s_next,a) =  P_E(s_now,s_next,S_matrix,a,p_H);
        end
    end
end

%save P_metrix_lambda_t3_01.mat P_metrix

% for i = 1:S
%     for a = 1:A
%         if sum(P_metrix(i,:,a)) ~= 1
%              sum(P_metrix(i,:,a))
%         end
%     end
% end