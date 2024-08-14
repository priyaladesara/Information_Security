clc;
close all;
clear all;

pt = input("Enter the plaintext: ", 's'); 
key = input("Enter the key (as a string): ", 's');  
n = length(pt);  
k_len = length(key); 


if( mod(n, k_len) ~= 0)
    k = length(pt);
    while mod(k, k_len) ~= 0
        pt(k+1) = 'z';  
        k = k + 1;
    end
    change = true;
else
    change = false;
end

% Reshaping the plaintext into a matrix of size (key length x length/key length)
p1 = reshape(pt, k_len, []);
% Sort the key alphabetically and get the corresponding column order
%The tilde (~) is used to ignore the first output (the sorted key itself)
%like index of key is not rreally imp for us.
[~,col_order]=sort(key);
% Reorder the columns according to the sorted key
ct_matrix = p1(col_order, :);
% Reshape the matrix into a single row to get the ciphertext
ct = reshape(ct_matrix, 1, []);
disp('Ciphertext:');
disp(ct); 

% Decryption Process
% Get the original column order from the key
[~, orig_order] = sort(col_order);
% Reshape the ciphertext back into a matrix with 'key length' columns
p3 = reshape(ct, k_len, []);
% Reorder the columns back to their original positions
dt_matrix = p3(orig_order, :);
% Reshape to get the original plaintext (with padding)
dt = reshape(dt_matrix, 1, []);


if change
    dt = dt(1:n);
end
disp('Decrypted Text:');
disp(dt); 
