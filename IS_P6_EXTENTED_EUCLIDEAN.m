a = input('Enter the first number: ');
b = input('Enter the second number: ');

% Call the extended_gcd function to find the GCD of a and b,
% and coefficients s and t such that s*a + t*b = gcd(a, b)
[g, s, t] = extended_gcd(a, b);

% Display the GCD
fprintf('GCD: %d\n', g);

% Check if the GCD is non-zero
if g ~= 0
    % Normalize coefficients to satisfy the equation s*a + t*b = 0
    % We adjust s and t such that the equation becomes s*a + t*b = 0
    s = s * (-b/g);  % Multiply s by (-b/g) to satisfy the equation
    t = t * (a/g);   % Multiply t by (a/g) to satisfy the equation
    
    % Display the coefficients s and t
    fprintf('Coefficients: s = %d, t = %d\n', s, t);
else
    % If both a and b are zero, there's no non-trivial solution
    fprintf('No non-trivial solution exists when both a and b are zero.\n');
end

% Function to compute the GCD using the Extended Euclidean Algorithm
% It also returns coefficients s and t such that s*a + t*b = gcd(a, b)
function [g, s, t] = extended_gcd(a, b)
    % Base case: if a is 0, then gcd(a, b) is b
    % Also, s = 0 and t = 1 satisfies the equation 0*a + 1*b = b
    if a == 0
        g = b;  % GCD is b
        s = 0;  % Coefficient s is 0
        t = 1;  % Coefficient t is 1
    else
        % Recursive case: apply the extended Euclidean algorithm
        % Calculate gcd(b mod a, a) and the corresponding coefficients
        [g, s1, t1] = extended_gcd(mod(b, a), a);
        
        % Update the coefficients s and t based on the recursive results
        s = t1 - floor(b/a) * s1;  % s = t1 - (b/a) * s1
        t = s1;                    % t = s1
    end
end
