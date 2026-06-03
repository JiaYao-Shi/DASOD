function data = create_formal_context(trandata)
    [m, n] = size(trandata);   
    total_cols = 0;  
    L = zeros(1, n);
    for i = 1:n   
        max1 = max(trandata(:, i));  
        min1 = min(trandata(:, i));  
        L(i) = max1 - min1 + 1;      
        total_cols = total_cols + L(i);  
    end
    data = false(m, total_cols);  
    t = 0;  
    for i = 1:n
        current_L = L(i);  
        min1 = min(trandata(:, i)); 
        for j = 1:m
            val = trandata(j, i);  
            col_idx = t + (val-min1)+1;  
            data(j, col_idx) = 1;  
        end
        t = t + current_L;
    end
end