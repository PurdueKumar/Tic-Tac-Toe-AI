winx = load('winx.csv');
winy = load('winy.csv');

x = load('xdata.csv');
y = load('ydata.csv');

[iwin , ~] = find(y == 1);

x = x(iwin , :);
y = y(iwin , :);

[n,~] = size(winx);
[l,~] = size(x);

for i = 1:n
  
    row = x(i,:);
    
    for j = 1:l
        
        if(ismember(row , winx(j,:),'rows'))
           
            winy(j,:) = y(i,:);
            
        end
        
    end
    
end
    
csvwrite('winy.csv' , winy);
