function output = ONEN (s,Smetrix)
% This function translate 1-dimension to n-dimension
s = s-1;
s_l = length (Smetrix);

value=zeros(1,2);
output=zeros(1,s_l);

 value = ONEN_SUB (s,1, Smetrix);
 output(1) = value(1);
 
for s_t = 2:1:s_l
    if s_t ~= s_l
        r = value(2);   
        value = ONEN_SUB(r,s_t,Smetrix);  
        output(s_t) = value(1);
    else
        output(s_t) = value(2)+1;
    end
end
    


end

function output_s = ONEN_SUB (s_i,s_t,Smetrix)
    output_s = zeros(1,2);
    s_l_s = length (Smetrix);
    sub_value = 1;
    for j = s_t:1:s_l_s-1
        sub_value = sub_value * Smetrix(j+1);
    end
    
    output_s(1) = fix(s_i/sub_value)+1;
    output_s(2) = rem(s_i,sub_value);
    
% output(1) = fix(s/(Smetrix(2)*Smetrix(3)*Smetrix(4)))+1;
% r = rem(s,Smetrix(2)*Smetrix(3)*Smetrix(4));
% output(2) = fix(r/(Smetrix(3)*Smetrix(4)))+1;
% r = rem(r,Smetrix(3)*Smetrix(4));
% output(3) = fix(r/(Smetrix(4)))+1;
% r = rem(r,Smetrix(4));
% output(4) = r+1;

end