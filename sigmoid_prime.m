function [y] = sigmoid_prime(x)
   y = x .* (1 - x);
end