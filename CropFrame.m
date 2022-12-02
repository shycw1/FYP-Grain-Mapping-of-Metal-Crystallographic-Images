function [CroppedImg] = CropFrame(rgbImg)
    grayImage = min(rgbImg, [], 3);
    binaryImage = grayImage < 200;
    binaryImage = bwareafilt(binaryImage, 1);
    [rows, columns] = find(binaryImage);
    row1 = min(rows);
    row2 = max(rows);
    col1 = min(columns);
    col2 = max(columns);
    % Crop
    CroppedImg = rgbImg(row1:row2, col1:col2, :);
end

