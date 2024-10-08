function img = image_negatives(img)
    % Return negatives value of the image
    % Transform image pixels from r to (255 - r)
    img = 255 - img;
end
