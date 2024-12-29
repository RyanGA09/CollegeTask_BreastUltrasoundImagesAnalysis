function [MSE, RMSE, PSNR, MSE1, RMSE1, PSNR1, MSE2, RMSE2, PSNR2, MSE3, RMSE3, PSNR3] = Mse_Rmse_Psnr(F1, R1, H1, G1, result1)
    % Calculate image quality metrics
    % Input:
    %   F1 - original image (m x n matrix)
    %   R1 - filtered image using 2D(RGB to gray) and Aras Keabuan (m x n matrix)
    %   H1 - filtered image using Lowpass filter (m x n matrix)
    %   G1 - filtered image using Brightness & Contrast (m x n matrix)
    %   result1 - filtered image using highboost filter & final output image (m x n matrix)
    % Output:
    %   MSE - Mean Squared Error
    %   RMSE - Root Mean Squared Error
    %   PSNR - Peak Signal-to-Noise Ratio

    % Get image dimensions
    [m, n] = size(F1);

    % Calculate differences
    difference = R1 - F1;
    difference1 = H1 - R1;
    difference2 = G1 - H1;
    difference3 = result1 - G1;

    % Calculate squared differences
    square = difference .* difference;
    square1 = difference1 .* difference1;
    square2 = difference2 .* difference2;
    square3 = difference3 .* difference3;

    % Sum squared differences
    totalsquared = sum(square(:));
    totalsquared1 = sum(square1(:));
    totalsquared2 = sum(square2(:));
    totalsquared3 = sum(square3(:));

    % Calculate MSE
    MSE = (totalsquared / (m * n));
    MSE1 = (totalsquared1 / (m * n));
    MSE2 = (totalsquared2 / (m * n));
    MSE3 = (totalsquared3 / (m * n));

    % Calculate RMSE
    RMSE = sqrt(MSE);
    RMSE1 = sqrt(MSE1);
    RMSE2 = sqrt(MSE2);
    RMSE3 = sqrt(MSE3);

    % Calculate PSNR
    PSNR = 10 * log10((255 * 255) / MSE);
    PSNR1 = 10 * log10((255 * 255) / MSE1);
    PSNR2 = 10 * log10((255 * 255) / MSE2);
    PSNR3 = 10 * log10((255 * 255) / MSE3);
end