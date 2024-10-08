function img = exponential_transformation(img, c, gamma)
    % Exponential transform image using parameters c and gamma
    % Transform image pixels from r to (c r^gamma)
    exponential_transformed_img = c * (im2double(img) .^ gamma);

    % Clip values to [0, 255]
    img = clip(im2uint8(exponential_transformed_img), 0, 255);
end
