function [auc] = compute_auc(true_labels, fusion_scores)
unique_labels = unique(true_labels);  
    if length(unique_labels) ~= 2         
        error('标签必须是二分类，当前有 %d 个标签', length(unique_labels));  
    end
 label_counts = [sum(true_labels == unique_labels(1)), sum(true_labels == unique_labels(2))];  
 anomaly_idx = find(label_counts == min(label_counts), 1);  
 anomaly_label = unique_labels(anomaly_idx);   
 binary_labels = zeros(size(true_labels));  
 binary_labels(true_labels == anomaly_label) = 1;  
[~, ~, ~, auc] = perfcurve(binary_labels, fusion_scores, 1);
end