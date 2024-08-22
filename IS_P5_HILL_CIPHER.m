clc;
close all;
clear all;

% Encryption
k = [2 3; 1 4];
pt = input('Enter plaintext: ', 's');
pt = upper(pt); % Convert to uppercase for consistency

% Ensure plaintext length is even
if mod(length(pt), 2) ~= 0
    pt = [pt 'X']; % Append 'X' if length is odd
end

% Reshape and prepare plaintext
p1 = reshape(pt, 2, []);
p2 = transpose(p1);
p3 = double(p2) - 65;

c1 = mod(p3 * k, 26);
c2 = char(c1 + 65);
c3 = transpose(c2);
ct = reshape(c3, 1, []);

disp('Ciphertext: ');
disp(ct);

% Decryption
% Calculate the inverse of the key matrix modulo 26
det_k = mod(det(k), 26);
inv_det_k = modInverse(det_k, 26); % Modular inverse of the determinant
adj_k = mod([k(2,2), -k(1,2); -k(2,1), k(1,1)], 26); % Adjoint of k
inv_k = mod(inv_det_k * adj_k, 26);

% Decrypt the ciphertext
c1_decrypt = mod(c1 * inv_k, 26);
p_decrypt = char(c1_decrypt + 65);
p_decrypt = reshape(p_decrypt', 1, []);

disp('Decrypted Plaintext: ');
disp(p_decrypt);

% Function to calculate the modular inverse
function inv = modInverse(a, m)
    for x = 1:m
        if mod(a * x, m) == 1
            inv = x;
            return;
        end
    end
    error('No modular inverse found.');
end
