# College Digital Image Processing Final Exam - Breast Ultrasound Image Analysis

This MATLAB project performs processes breast ultrasound images using various image enhancement techniques. The techniques include:

- Grayscale Adjustment  
- Lowpass Filter  
- Brightness and Contrast Adjustment  
- Highboost Filter  

It also calculates image quality metrics such as:

- MSE (Mean Squared Error)  
- RMSE (Root Mean Squared Error)  
- PSNR (Peak Signal-to-Noise Ratio)  

The results are visualized using subplots for both original and processed images to allow visual comparison and evaluation.

> 🎓 **This project was developed as a Final Assignment of Final Exam (UAS) for the Digital Image Processing (DIP) course (in Indonesian: Pengolahan Citra Digital (PCD)).**

## ▶️ How to Use

1. Open MATLAB and set the working directory to the project folder.  
2. Place your input ultrasound images inside the `assets` folder. Supported images include:  
   - `benign (1).png`  
   - `benign (2).png`  
   - `malignant (1).png`  
   - `malignant (2).png`  
   - `normal (1).png`  
   - `normal (2).png`  
3. Make sure all required `.m` files (such as `MainProgram.m`, `Grayscale.m`, `LowPassFilter.m`, `HighBoostFilter.m`, `Mse_Rmse_Psnr.m`, `Accuracy.m`) are in the project root folder.  
4. Run the main script by executing `MainProgram.m` in MATLAB. This will process the images, apply enhancement filters, compute quality metrics, and display the results.  
5. Review the output images and quality metrics in the MATLAB figure windows and command window.  
**The script will**:
- Convert the image to grayscale manually
- Apply lowpass filter and brightness/contrast adjustments
- Apply highboost filtering
- Calculate and display MSE, RMSE, and PSNR
- Show all results in a subplot figure

## 📁 File Structure

```bash
## 📁 Project Structure

```plaintext
CollegeTask-FinalAssignment_BreastUltrasoundImagesAnalysis/
├── assets/                         # Folder containing ultrasound images (input images)
│   ├── benign (1).png              # Ultrasound image of benign tumor - 1
│   ├── benign (2).png              # Ultrasound image of benign tumor - 2
│   ├── malignant (1).png           # Ultrasound image of malignant tumor - 1
│   ├── malignant (2).png           # Ultrasound image of malignant tumor - 2
│   ├── normal (1).png              # Ultrasound image of normal breast - 1
│   └── normal (2).png              # Ultrasound image of normal breast - 2
├── Accuracy.m                      # Calculates accuracy or evaluation metrics
├── Grayscale.m                     # Converts images to grayscale
├── HighBoostFilter.m               # Implements highboost filter
├── LowPassFilter.m                 # Implements lowpass (mean) filter
├── BrightnessContrast.m            # Adjusts brightness and contrast
├── Mse_Rmse_Psnr.m                 # Computes MSE, RMSE, and PSNR metrics
├── MainProgram.m                   # Main script running the full process
├── README.md                       # Project documentation
└── LICENSE                         # Project license information (MIT License)

```

## 👨‍💻 Author

Ryan Gading Abdullah

## 📝 License

Copyright &copy; 2024 Ryan Gading Abdullah. All rights reserved.

This project is licensed under the MIT License – see the [MIT License](LICENSE) for details.
