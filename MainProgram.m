clear
clc

disp('============================================');
disp('         Breast Ultrasound Image Analysis         ');
disp('============================================');
disp('This program analyzes breast ultrasound images.');
disp('The process includes grayscale conversion, lowpass filter,');
disp('contrast adjustment, and high-boost filtering.');
disp('============================================');

% Define current directory and folder containing images
currentdir = pwd;
assets_folder = 'assets';

file1 = 'normal(1).png';
file2 = 'normal(2).png';
file3 = 'benign(1).png';
file4 = 'benign(2).png';
file5 = 'malignant(1).png';
file6 = 'malignant(2).png';

% Construct absolute paths to the images
absolute1 = fullfile(currentdir, assets_folder, file1);
absolute2 = fullfile(currentdir, assets_folder, file2);
absolute3 = fullfile(currentdir, assets_folder, file3);
absolute4 = fullfile(currentdir, assets_folder, file4);
absolute5 = fullfile(currentdir, assets_folder, file5);
absolute6 = fullfile(currentdir, assets_folder, file6);

img1 = imread(absolute1);
img2 = imread(absolute2);
img3 = imread(absolute3);
img4 = imread(absolute4);
img5 = imread(absolute5);
img6 = imread(absolute6);

figure; % create a new figure
suptitle('Breasts Ultrasound'); % add a suptitle to the figure
subplot(3,6,1); imshow(img1); title('Original Image Normal1');
subplot(3,6,2); imshow(img2); title('Original Image Normal2');
subplot(3,6,3); imshow(img3); title('Original Image benign3');
subplot(3,6,4); imshow(img4); title('Original Image benign4');
subplot(3,6,5); imshow(img5); title('Original Image malignant5');
subplot(3,6,6); imshow(img6); title('Original Image malignant6');

% Initialize Variables
F1 = rgb2gray(img1);
F2 = rgb2gray(img2);
F3 = rgb2gray(img3);
F4 = rgb2gray(img4);
F5 = rgb2gray(img5);
F6 = rgb2gray(img6);

% F1 = img1;
% F2 = img2;
% F3 = img3;
% F4 = img4;
% F5 = img5;
% F6 = img6;

f1 = 100;
f2 = 101;
cont = 1.9;
bright = 10;

% Grayscale Level Adjustment, Lowpass Filter, Brightness + Contrast, Highboost Filter
R1 = Grayscale(F1, f1, f2);
H1 = LowPassFilter(R1);
subplot(3,6,7); imshow(H1); title('Processed Image Normal1.1');
G1 = cont * (H1 + bright);
result1 = HighBoostFilter(G1);
subplot(3,6,13); imshow(result1); title('Processed Image Normal1.2');

fprintf('\n-------------------------------------------------\n');
R2 = Grayscale(F2, f1, f2);
H2 = LowPassFilter(R2);
subplot(3,6,8); imshow(H2); title('Processed Image Normal2.1');
G2 = cont * (H2 + bright);
result2 = HighBoostFilter(G2);
subplot(3,6,14); imshow(result2); title('Processed Image Normal2.2');

fprintf('\n-------------------------------------------------\n');
R3 = Grayscale(F3, f1, f2);
H3 = LowPassFilter(R3);
subplot(3,6,9); imshow(H3); title('Processed Image benign3.1');
G3 = cont * (H3 + bright);
result3 = HighBoostFilter(G3);
subplot(3,6,15); imshow(result3); title('Processed Image benign3.2');

fprintf('\n-------------------------------------------------\n');
R4 = Grayscale(F4, f1, f2);
H4 = LowPassFilter(R4);
subplot(3,6,10); imshow(H4); title('Processed Image benign4.1');
G4 = cont * (H4 + bright);
result4 = HighBoostFilter(G4);
subplot(3,6,16); imshow(result4); title('Processed Image benign4.2');

fprintf('\n-------------------------------------------------\n');
R5 = Grayscale(F5, f1, f2);
H5 = LowPassFilter(R5);
subplot(3,6,11); imshow(H5); title('Processed Image malignant5.1');
G5 = cont * (H5 + bright);
result5 = HighBoostFilter(G5);
subplot(3,6,17); imshow(result5); title('Processed Image malignant5.2');

fprintf('\n-------------------------------------------------\n');
R6 = Grayscale(F6, f1, f2);
H6 = LowPassFilter(R6);
subplot(3,6,12); imshow(H6); title('Processed Image malignant6.1');
G6 = cont * (H6 + bright);
result6 = HighBoostFilter(G6);
subplot(3,6,18); imshow(result6); title('Processed Image malignant6.2');

fprintf('#################################################\n');
% MSE RMSE PSNR
fprintf('===MSE RMSE PSNR===\n');

fprintf('Image 1\n');
[MSE, RMSE, PSNR, MSE1, RMSE1, PSNR1, MSE2, RMSE2, PSNR2, MSE3, RMSE3, PSNR3] = Mse_Rmse_Psnr(F1, R1, H1, G1, result1);

fprintf('\t\t Grayscale Adjustment\t\t Lowpass Filter \t\t Brightness + Contrast\t\t Highboost Filter\n');
fprintf('MSE  : %12.4f; \t %12.4f; \t\t\t\t %12.4f; \t\t\t\t %12.4f;',MSE,MSE1,MSE2,MSE3)
fprintf('\nRMSE : %12.4f; \t %12.4f; \t\t\t\t %12.4f; \t\t\t\t %12.4f',RMSE,RMSE1,RMSE2,RMSE3)
fprintf('\nPSNR : %12.4f; \t %12.4f; \t\t\t\t %12.4f; \t\t\t\t %12.4f',PSNR,PSNR1,PSNR2,PSNR3)

fprintf('\n=================================================\n');
fprintf('Image 2\n');
[MSE, RMSE, PSNR, MSE1, RMSE1, PSNR1, MSE2, RMSE2, PSNR2, MSE3, RMSE3, PSNR3] = Mse_Rmse_Psnr(F2, R2, H2, G2, result2);

fprintf('\t\t Grayscale Adjustment\t\t Lowpass Filter \t\t Brightness + Contrast\t\t Highboost Filter\n');
fprintf('MSE  : %12.4f; \t %12.4f; \t\t\t\t %12.4f; \t\t\t\t %12.4f',MSE,MSE1,MSE2,MSE3)
fprintf('\nRMSE : %12.4f; \t %12.4f; \t\t\t\t %12.4f; \t\t\t\t %12.4f',RMSE,RMSE1,RMSE2,RMSE3)
fprintf('\nPSNR : %12.4f; \t %12.4f; \t\t\t\t %12.4f; \t\t\t\t %12.4f',PSNR,PSNR1,PSNR2,PSNR3)

fprintf('\n=================================================\n');
fprintf('Image 3\n');
[MSE, RMSE, PSNR, MSE1, RMSE1, PSNR1, MSE2, RMSE2, PSNR2, MSE3, RMSE3, PSNR3] = Mse_Rmse_Psnr(F3, R3, H3, G3, result3);

fprintf('\t\t Grayscale Adjustment\t\t Lowpass Filter \t\t Brightness + Contrast\t\t Highboost Filter\n');
fprintf('MSE  : %12.4f; \t %12.4f; \t\t\t\t %12.4f; \t\t\t\t %12.4f',MSE,MSE1,MSE2,MSE3)
fprintf('\nRMSE : %12.4f; \t %12.4f; \t\t\t\t %12.4f; \t\t\t\t %12.4f',RMSE,RMSE1,RMSE2,RMSE3)
fprintf('\nPSNR : %12.4f; \t %12.4f; \t\t\t\t %12.4f; \t\t\t\t %12.4f',PSNR,PSNR1,PSNR2,PSNR3)

fprintf('\n=================================================\n');
fprintf('Image 4\n');
[MSE, RMSE, PSNR, MSE1, RMSE1, PSNR1, MSE2, RMSE2, PSNR2, MSE3, RMSE3, PSNR3] = Mse_Rmse_Psnr(F4, R4, H4, G4, result4);

fprintf('\t\t Grayscale Adjustment\t\t Lowpass Filter \t\t Brightness + Contrast\t\t Highboost Filter\n');
fprintf('MSE  : %12.4f; \t %12.4f; \t\t\t\t %12.4f; \t\t\t\t %12.4f',MSE,MSE1,MSE2,MSE3)
fprintf('\nRMSE : %12.4f; \t %12.4f; \t\t\t\t %12.4f; \t\t\t\t %12.4f',RMSE,RMSE1,RMSE2,RMSE3)
fprintf('\nPSNR : %12.4f; \t %12.4f; \t\t\t\t %12.4f; \t\t\t\t %12.4f',PSNR,PSNR1,PSNR2,PSNR3)

fprintf('\n=================================================\n');
fprintf('Image 5\n');
[MSE, RMSE, PSNR, MSE1, RMSE1, PSNR1, MSE2, RMSE2, PSNR2, MSE3, RMSE3, PSNR3] = Mse_Rmse_Psnr(F5, R5, H5, G5, result5);

fprintf('\t\t Grayscale Adjustment\t\t Lowpass Filter \t\t Brightness + Contrast\t\t Highboost Filter\n');
fprintf('MSE  : %12.4f; \t %12.4f; \t\t\t\t %12.4f; \t\t\t\t %12.4f',MSE,MSE1,MSE2,MSE3)
fprintf('\nRMSE : %12.4f; \t %12.4f; \t\t\t\t %12.4f; \t\t\t\t %12.4f',RMSE,RMSE1,RMSE2,RMSE3)
fprintf('\nPSNR : %12.4f; \t %12.4f; \t\t\t\t %12.4f; \t\t\t\t %12.4f',PSNR,PSNR1,PSNR2,PSNR3)

fprintf('\n=================================================\n');
fprintf('Image 6\n');
[MSE, RMSE, PSNR, MSE1, RMSE1, PSNR1, MSE2, RMSE2, PSNR2, MSE3, RMSE3, PSNR3] = Mse_Rmse_Psnr(F6, R6, H6, G6, result6);

fprintf('\t\t Grayscale Adjustment\t\t Lowpass Filter \t\t Brightness + Contrast\t\t Highboost Filter\n');
fprintf('MSE  : %12.4f; \t %12.4f; \t\t\t\t %12.4f; \t\t\t\t %12.4f',MSE,MSE1,MSE2,MSE3)
fprintf('\nRMSE : %12.4f; \t %12.4f; \t\t\t\t %12.4f; \t\t\t\t %12.4f',RMSE,RMSE1,RMSE2,RMSE3)
fprintf('\nPSNR : %12.4f; \t %12.4f; \t\t\t\t %12.4f; \t\t\t\t %12.4f',PSNR,PSNR1,PSNR2,PSNR3)

fprintf('\n\n#################################################\n');
% Accuray
fprintf('===Accuracy===\n');
fprintf('Image 1\n');
m = size(img1, 1);
n = size(result1, 2);
[sensitivity1, specificity1, accuracy1, fpr1, fnr1] = Accuracy(F1, result1, m, n);

% Display the results
fprintf('-------------------------------------------------\n');
fprintf('Sensitivity = %.2f%%\n', sensitivity1);
fprintf('Specificity = %.2f%%\n', specificity1);
fprintf('Accuracy    = %.2f%%\n', accuracy1);
fprintf('FP          = %.2f%%\n', fpr1);
fprintf('FN          = %.2f%%\n', fnr1);
fprintf('\n=================================================\n');

fprintf('Image 2\n');
m = size(img2, 1);
n = size(result2, 2);
[sensitivity2, specificity2, accuracy2, fpr2, fnr2] = Accuracy(F2, result2, m, n);

% Display the results
fprintf('-------------------------------------------------\n');
fprintf('Sensitivity = %.2f%%\n', sensitivity2);
fprintf('Specificity = %.2f%%\n', specificity2);
fprintf('Accuracy    = %.2f%%\n', accuracy2);
fprintf('FP          = %.2f%%\n', fpr2);
fprintf('FN          = %.2f%%\n', fnr2);
fprintf('\n=================================================\n');

fprintf('Image 3\n');
m = size(img3, 1);
n = size(result3, 2);
[sensitivity3, specificity3, accuracy3, fpr3, fnr3] = Accuracy(F3, result3, m, n);

% Display the results
fprintf('-------------------------------------------------\n');
fprintf('Sensitivity = %.2f%%\n', sensitivity3);
fprintf('Specificity = %.2f%%\n', specificity3);
fprintf('Accuracy    = %.2f%%\n', accuracy3);
fprintf('FP          = %.2f%%\n', fpr3);
fprintf('FN          = %.2f%%\n', fnr3);
fprintf('\n=================================================\n');

fprintf('Image 4\n');
m = size(img4, 1);
n = size(result4, 2);
[sensitivity4, specificity4, accuracy4, fpr4, fnr4] = Accuracy(F4, result4, m, n);

% Display the results
fprintf('-------------------------------------------------\n');
fprintf('Sensitivity = %.2f%%\n', sensitivity4);
fprintf('Specificity = %.2f%%\n', specificity4);
fprintf('Accuracy    = %.2f%%\n', accuracy4);
fprintf('FP          = %.2f%%\n', fpr4);
fprintf('FN          = %.2f%%\n', fnr4);
fprintf('\n=================================================\n');

fprintf('Image 5\n');
m = size(img5, 1);
n = size(result5, 2);
[sensitivity5, specificity5, accuracy5, fpr5, fnr5] = Accuracy(F5, result5, m, n);

% Display the results
fprintf('-------------------------------------------------\n');
fprintf('Sensitivity = %.2f%%\n', sensitivity5);
fprintf('Specificity = %.2f%%\n', specificity5);
fprintf('Accuracy    = %.2f%%\n', accuracy5);
fprintf('FP          = %.2f%%\n', fpr5);
fprintf('FN          = %.2f%%\n', fnr5);
fprintf('\n=================================================\n');

fprintf('Image 6\n');
m = size(img6, 1);
n = size(result6, 2);
[sensitivity6, specificity6, accuracy6, fpr6, fnr6] = Accuracy(F6, result6, m, n);

% Display the results
fprintf('-------------------------------------------------\n');
fprintf('Sensitivity = %.2f%%\n', sensitivity6);
fprintf('Specificity = %.2f%%\n', specificity6);
fprintf('Accuracy    = %.2f%%\n', accuracy6);
fprintf('FP          = %.2f%%\n', fpr6);
fprintf('FN          = %.2f%%\n', fnr6);