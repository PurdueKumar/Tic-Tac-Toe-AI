function visualize(x , y) 

    a = reshape(x,[3,3]);
    disp(array2table(a));
    
    b = reshape(y,[3,3]);
    disp(array2table(b));
        
    c = x + y;
    d = reshape(c , [3,3]);
    disp(array2table(d));
    
    
end