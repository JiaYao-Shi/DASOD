function [core_ext] = extract_core_concepts(ext)
extent_sizes = sum(ext, 1); 
m = size(ext, 2);  
k = max(1, round(0.05* m));              % 核心概念阈值——超参数
[sorted_extent_sizes, ~] = sort(extent_sizes, 'descend'); 
core_threshold = sorted_extent_sizes(k);  
core_indices = find(extent_sizes >= core_threshold);  
num_core = length(core_indices);   
core_ext = ext(:,core_indices);    
end