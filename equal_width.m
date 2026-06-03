function discretized_data = equal_width(data, k)
[m, n] = size(data);
discretized_data = zeros(m, n);
for col = 1:n  
    feature = data(:, col);
    min_val = min(feature);
    max_val = max(feature);
    if max_val == min_val
        discretized_data(:, col) = 1;
        continue;
    end
    bin_edges = linspace(min_val, max_val, k+1);  
    [~,~,idx] = histcounts(feature, bin_edges);  
    idx(idx == 0) = k; 
    discretized_data(:, col) = idx;
end
end
