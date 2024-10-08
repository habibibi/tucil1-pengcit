function img = contrast_stretching(img)
    % Enhance image contrast by stretching the intensity values.
    % Transform image pixels from r to (r - min) / (max - min)
    img = im2double(img);

    % Find the minimum and maximum intensity values of the image
    min_val = min(img(:));
    max_val = max(img(:));

    % Apply contrast stretching
    img = (img - min_val) / (max_val - min_val);

    % Convert img back to uint8 format
    img = im2uint8(img);
end
