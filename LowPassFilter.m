function G = LowPassFilter1(f)
    % kernel 1
    const = (1/ 6);
    h1 = 0; % h(x-1,y-1)
    h2 = 1; % h(x-1,y)
    h3 = 0; % h(x-1,y+1)
    h4 = 1; % h(x,y-1);
    h5 = 2; % h(x,y);
    h6 = 1; % h(x,y+1);
    h7 = 0; % h(x+1,y-1);
    h8 = 1; % h(x+1,y);
    h9 = 0; % h(x+1,y+1);

    % % kernel 2
    % const = (1/ 9);
    % h1 = 1; % h(x-1,y-1)
    % h2 = 1; % h(x-1,y)
    % h3 = 1; % h(x-1,y+1)
    % h4 = 1; % h(x,y-1);
    % h5 = 1; % h(x,y);
    % h6 = 1; % h(x,y+1);
    % h7 = 1; % h(x+1,y-1);
    % h8 = 1; % h(x+1,y);
    % h9 = 1; % h(x+1,y+1);

    % % kernel 3
    % const = (1/ 10);
    % h1 = 1; % h(x-1,y-1)
    % h2 = 1; % h(x-1,y)
    % h3 = 1; % h(x-1,y+1)
    % h4 = 1; % h(x,y-1);
    % h5 = 2; % h(x,y);
    % h6 = 1; % h(x,y+1);
    % h7 = 1; % h(x+1,y-1);
    % h8 = 1; % h(x+1,y);
    % h9 = 1; % h(x+1,y+1);

    % % kernel 4
    % const = (1/ 16);
    % h1 = 1; % h(x-1,y-1)
    % h2 = 2; % h(x-1,y)
    % h3 = 1; % h(x-1,y+1)
    % h4 = 2; % h(x,y-1);
    % h5 = 4; % h(x,y);
    % h6 = 2; % h(x,y+1);
    % h7 = 1; % h(x+1,y-1);
    % h8 = 2; % h(x+1,y);
    % h9 = 1; % h(x+1,y+1);
    
    [m, n] = size(f);
    G = zeros(m, n);
    F = double(f);
    for x = 2 : m - 1
        for y = 2 : n - 1
            G(x, y) = const * (h1 * f(x + 1, y + 1) + h2 * f(x + 1, y) + h3 * f(x + 1, y - 1) +...
                    h4 * f(x, y + 1) + h5 *f(x, y) + h6 * f(x, y-1) +...
                    h7 * f(x - 1, y + 1) + h8 * f(x - 1, y) + h9 * f(x - 1, y - 1));         
            %G(x, y) = uint8(G(x, y));
        end
    end
    G = uint8(G);
end

