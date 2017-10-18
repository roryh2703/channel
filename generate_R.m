clear all; close all; clc

xcoords = load('R/xcoords');
ycoords = load('R/ycoords');
zcoords = load('R/zcoords');
R_data = load('R/R_clean');
U_data = load('R/U_clean');

%    concatonate all data together
R_large = horzcat(xcoords,ycoords,zcoords,R_data);
U_large = horzcat(xcoords,ycoords,zcoords,U_data);

%    indices of outlet
indices = find(xcoords == max(xcoords));

%    trim R & U to just outlet values
R_out_coords = R_large(indices,:);
U_out_coords = U_large(indices,:);

R_outlet = R_out_coords(:,4:end);    % neglect coordinates 
U_outlet = U_out_coords(:,4:end);    % neglect coordinates 

len = size(R_outlet,1);

for j = 1:len
     out1{j} = strcat(['(' num2str(R_outlet(j,:)) ')']);
     out2{j} = strcat(['(' num2str(U_outlet(j,:)) ')']);    
end

% display vector in command window
for j = 1:len
disp(['', num2str(out1{j})])
% disp(['', num2str(out2{j})])
end