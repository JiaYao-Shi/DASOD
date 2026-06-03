function r = f_g(data)
    [s1, s2] = size(data);
    data = logical(data); 
    temp_r = cell(1, s1 + s2); 
    for i = 1:s1
        temp_r{i} = all(data(:, data(i,:)), 2); 
    end
    for j = 1:s2
        temp_r{s1+j} = data(:, j);
    end
    r = horzcat(temp_r{:});
    r = unique(r', 'rows', 'stable')'; 
end