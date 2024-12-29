function Result = Grayscale(Img, f1, f2)
% CUT Produces an image with levels 0 to f1 
% and f2-255 zeroed out
[height, width] = size(Img);  
Result = Img;

for row = 1 : height
    for column = 1 : width
        if Result(row, column) <= f1 
            Result(row, column) = 0;
        end
            
        if Result(row, column) >= f2
            Result(row, column) = 255;
        end
    end
end
