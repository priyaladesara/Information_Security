%rail fence cipher
clc;
close all;
clear all;
pt = input("Enter value: ", 's');  % User enters the plaintext
n = length(pt);  % Calculate the length of the plaintext
rail = input('Enter the rail value: ');  % User enters the number of rails

% Padding the plaintext if its length is not divisible by the number of rails
if(mod(n, rail) ~= 0)
    k = length(pt);
    while(mod(k, rail) ~= 0)
        pt(k+1) = 'z';  % Adding 'z' as a padding character
        k = k + 1;
    end
    change = true;
else
    change = false;
end

% Reshaping the plaintext into a matrix of size (rails x length/rails)
p1 = reshape(pt, rail, []);
% Transposing the matrix to change its orientation
p2 = transpose(p1);
% Reshaping the transposed matrix back into a single row (ciphertext)
ct = reshape(p2, 1, []);
disp(ct);  % Display the ciphertext

% Reshaping the ciphertext back into a matrix with 'rail' rows
p3 = reshape(ct, [], rail);
% Transposing it again to get the original order
p4 = transpose(p3);
% Reshaping to get the original plaintext (with padding)
dt = reshape(p4, 1, []);

% Remove the padding if it was added
if change
    dt = dt(1:n);
end
disp(dt);  % Display the decrypted text
