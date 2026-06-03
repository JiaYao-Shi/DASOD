% DASOD 运行示例
clc; clear;
data_struct = load('breastcancer_ori.mat'); 
field_names = fieldnames(data_struct);
data = data_struct.(field_names{1}); 
if istable(data)
    data = table2array(data); 
end
X = data(:, 1:end-1); 
y = data(:, end);    
k = 7;              % 离散化区间数——超参数
fused_scores = DASOD(X, k); 
[AUC] = compute_auc(y, fused_scores);