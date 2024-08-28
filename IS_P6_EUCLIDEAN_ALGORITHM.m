%Basic Euclidean Algorithm for GCD:  

a= input("enter the number");
b=input("enter the second number");

function result = gcd(a, b)  
    if a == 0  % Base case: if 'a' is 0, then 'b' is the GCD
        result = b;  
    else  
        result = gcd(mod(b, a), a);  % Recursive step: call gcd with (b % a) and a
    end
end

basic_euclidean = gcd(a, b);  % Compute the GCD using the basic Euclidean algorithm
disp(basic_euclidean);  