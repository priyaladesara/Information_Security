% Encryption
pt = input('Enter plaintext: ', 's');
key = input('Enter the key value: ');

% Initialize encrypted value
encrypted_value = '';

for i = 1:length(pt)
    get_ascii = double(pt(i));
    if (get_ascii >= 65 && get_ascii < 91)
        get_value = get_ascii - 65;
        new_value = mod(get_value + key, 26);
        encrypted_char = char(new_value + 65);
    elseif (get_ascii >= 97 && get_ascii < 123)
        get_value = get_ascii - 97;
        new_value = mod(get_value + key, 26);
        encrypted_char = char(new_value + 97);
    else
        encrypted_char = pt(i); % Non-alphabetic characters remain unchanged
    end
    encrypted_value = [encrypted_value encrypted_char];
end

disp('Encrypted value:')
disp(encrypted_value)

% Decryption
decrypted_value = '';

for i = 1:length(encrypted_value)
    decrypt_ascii = double(encrypted_value(i));
    if (decrypt_ascii >= 65 && decrypt_ascii < 91)
        get_value = decrypt_ascii - 65;
        original_value = mod(get_value - key, 26);
        decrypted_char = char(original_value + 65);
    elseif (decrypt_ascii >= 97 && decrypt_ascii < 123)
        get_value = decrypt_ascii - 97;
        original_value = mod(get_value - key, 26);
        decrypted_char = char(original_value + 97);
    else
        decrypted_char = encrypted_value(i); % Non-alphabetic characters remain unchanged
    end
    decrypted_value = [decrypted_value decrypted_char];
end

disp('Decrypted value:')
disp(decrypted_value)
