function A_star=f_2(A,data)
[row, column]=size(data);
Y=ones(row,1);  
 if sum(A)~=0  
    for i=1:column   
        if A(1,i)==1    
            Y=min(data(:,i),Y);   
        end
    end
 end
  A_star=Y;
end