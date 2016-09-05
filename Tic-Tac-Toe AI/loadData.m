

x = load('xdata.csv');
y = load('ydata.csv');


[iwin , j] = find(y == 1);

xwin = x(iwin, :);
ywin = y(iwin, :);

[ilose , j] = find(y == -1);

xlose = x(ilose , :);
ylose = y(ilose , :);
ylose = (ylose == -1);

[idraw, j] = find(y == 0.5);

xdraw = x(idraw , :);
ydraw = y(idraw , :);
ydraw = (ydraw == 0.5);
