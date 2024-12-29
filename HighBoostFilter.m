function G = HighBoostFilter(f)
    
    % constant
    const = 10
    % kernel 1
    h1 = -1; %h(x-1,y-1)
    h2 = -1; %h(x-1,y)
    h3 = -1; %h(x-1,y+1)
    h4 = -1; %h(x,y-1);
    h5 = const; %h(x,y); const > 8;
    h6 = -1; %h(x,y+1);
    h7 = -1; %h(x+1,y-1);
    h8 = -1; %h(x+1,y);
    h9 = -1; %h(x+1,y+1);
    
    [m, n] = size(f);
    G= zeros(m, n);
    F = double(f);
    for x = 2 : m - 1
        for y = 2 : n - 1
            G(x, y) = h1 * F(x + 1, y + 1) + h2 * F(x + 1, y)+ h3 * F(x + 1, y - 1) +...
                        h4 * F(x, y + 1) + h5 * F(x, y) + h6 * F(x, y - 1) +...
                        h7 * F(x - 1, y + 1) + h8 * F(x - 1, y) + h9 * F(x - 1, y - 1);         
            %G(x, y) = uint8(G(x, y));
        end
    end
    G = uint8(G);
end

