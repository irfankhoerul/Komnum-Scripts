function p = randperm(n)
    p = zeros(1, n);
    for i = 1:n
        while true
            x = ceil(rand() * n);
            if isempty(find(p == x, 1))
                p(i) = x;
                break;
            end
        end
    end
end
