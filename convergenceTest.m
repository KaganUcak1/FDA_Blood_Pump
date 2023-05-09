%% Convergence Test
clc; clear
fileArray =[2 5 10 20 50 100 200 450];
for  idx = 1:length(fileArray)
    myTable1 =table2array(readtable("./convergenceTest/fdacondition2-pair"+num2str(fileArray(idx))+"/B00001.txt"))';
    vel(idx,:) = sqrt(myTable1(3,:).^2 + myTable1(4,:).^2);
end

for  idx = 2:length(fileArray)
    diff(idx-1,:) = norm(vel(idx-1,:)-vel(idx,:));
end

plot(fileArray(2:end),diff)