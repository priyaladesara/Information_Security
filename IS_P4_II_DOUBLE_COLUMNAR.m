
clc;
close all;
clear all;

% Input the plaintext and both keys
pt = input('Enter plaintext: ', 's');
key1 = input('Enter first key: ', 's');
key2 = input('Enter second key: ', 's');

% First Transposition
ct1 = columnar_transposition(pt, key1);
disp('Ciphertext after first transposition:');
disp(ct1);

% Second Transposition
ct2 = columnar_transposition(ct1, key2);
disp('Final Ciphertext after second transposition:');
disp(ct2);

% Decryption Process
% First Decrypt with second key
dt1 = columnar_transposition_decrypt(ct2, key2);
disp('Decrypted text after using second key:');
disp(dt1);

% Then Decrypt with first key
dt2 = columnar_transposition_decrypt(dt1, key1);
disp('Final Decrypted text:');
disp(dt2);

% Function for columnar transposition encryption
function ct = columnar_transposition(pt, key)
    n = length(pt); % Length of the plaintext
    key_len = length(key); % Length of the key

    % Padding if necessary
    if mod(n, key_len) ~= 0
        k = n;
        while mod(k, key_len) ~= 0
            pt(k+1) = 'z'; % Adding 'z' as a padding character
            k = k + 1;
        end
    end

    % Reshape the plaintext into a matrix
    p1 = reshape(pt, key_len, []);
    % Sort the key and get the column order
    [~, col_order] = sort(key);
    % Rearrange columns based on sorted order
    p2 = p1(col_order, :);
    % Convert the matrix back into a single string
    ct = reshape(p2', 1, []);
end

% Function for columnar transposition decryption
function dt = columnar_transposition_decrypt(ct, key)
    key_len = length(key); % Length of the key
    n = length(ct); % Length of the ciphertext

    % Reshape the ciphertext into a matrix
    p1 = reshape(ct, [], key_len)';
    % Get the original column order
    [~, col_order] = sort(key);
    [~, orig_order] = sort(col_order);
    % Rearrange columns back to the original order
    p2 = p1(orig_order, :);
    % Convert the matrix back into a single string
    dt = reshape(p2', 1, []);
end
