function img = image_brightening(img, a, b)
    % Brighten image using parameters a and b
    % Transform image pixels from r to (ar + b)
    brightened_img = a * img + b;

    % Clip values to [0, 255]
    img = clip(brightened_img, 0, 255);
end
