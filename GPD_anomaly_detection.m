function [d3_all] = GPD_anomaly_detection(formal_context) 
    [n_objects, n_attributes] = size(formal_context); 
    epsilon = 1e-10; 
    support = sum(formal_context, 1) / n_objects;  
    d3_all = zeros(n_objects, 1);  
    for u = 1:n_objects  
        d3=0;
        for a = 1:n_attributes  
            Q_u_a = formal_context(u, a);  
            P_a = support(a) + epsilon;   
            if Q_u_a == 1  
                d3 = d3 + Q_u_a * log(Q_u_a / P_a);
            end
        end
       d3_all(u) = d3; 
    end    
end