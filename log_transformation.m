function img = log_transformation(img, c)
    % Log transform image using parameter c
    % Transform image pixels from r to (c log(1 + r))
    log_transformed_img = c * log(1 + im2double(img));

    % Clip values to [0, 255]
    img = clip(im2uint8(log_transformed_img), 0, 255);
end
