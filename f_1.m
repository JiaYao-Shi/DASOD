function X_star=f_1(X,data) 
    [row,column]=size(data); 
    A=ones(1,column);   
    if sum(X)~=0   
        for i=1:row  
            if X(i,1)==1  
                A=min(data(i,:),A);   
            end
        end
    end
    X_star=A;
end    
                         