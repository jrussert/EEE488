close all;
clear all;
home;

disp('Begin test script...')

WORKING_IMAGE_PATH = 'c:\Users\sysadmin\Desktop\NeilsDendrites.png';
WORKING_IMAGE_PATH = 'c:\Users\sysadmin\Pictures\serveimage.png';
WORKING_IMAGE_PATH = 'c:\Users\sysadmin\Pictures\CAM00194.jpg';
WORKING_IMAGE = imread(WORKING_IMAGE_PATH);
WORKING_IMAGE = rgb2gray(WORKING_IMAGE);


figure(1)
imshow(WORKING_IMAGE);

histo = imgHistogram(WORKING_IMAGE);

figure(2)
plot(histo);


normedHisto = histNormalize(histo);

figure(3)
plot(normedHisto);

figure(4)
imshow(imgEqualize(WORKING_IMAGE));

figure(5)
[level, maximum]=imgThresholdOtsu(WORKING_IMAGE);
imshow(imgThreshold(WORKING_IMAGE, level/2, maximum));

templateAveraging = zeros(3);
for i=1:4
    for j=1:4
        templateAveraging(i,j)=1/16;
    end
end

figure(6)
convolved = convolve(WORKING_IMAGE, templateAveraging);
imshow(convolved);

templateAveraging = gaussian_template(5, 1);
figure(7)
convolved = convolve(WORKING_IMAGE, templateAveraging);
imshow(convolved);

thresholdImg = imgThreshold(WORKING_IMAGE, level*0.9, maximum);

figure(8)
convolved = convolve(thresholdImg, templateAveraging);
imshow(convolved);

figure(9)
templateGaussianEven = gaussian_template(6,1);
eroded = erosion(WORKING_IMAGE, templateGaussianEven);
imshow(eroded);

figure(10)
dilated = dilation(WORKING_IMAGE, templateGaussianEven);
imshow(dilated);

figure(11)
edgeImg=detect_edges(thresholdImg);
imshow(edgeImg);

figure(12)
edgeImg = detect_edges_sobel_2(thresholdImg,2);
imshow(edgeImg);



disp('End test script...')