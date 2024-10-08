function output_img = histogram_specification(input_img, reference_img)
    % Adjust intensity distribution of input image to match the histogram of a reference image.

    % Check input image channels count 
    if size(input_img, 3) == 1 % Grayscale
        % Convert reference into grayscale
        if size(reference_img, 3) ~= 1
            reference_img = rgb2gray(reference_img);
        end   

        output_img = histogram_matching(input_img, reference_img);
    else % RGB
        % Convert reference into RGB
        if size(reference_img, 3) == 1
            reference_img = cat(3, reference_img, reference_img, reference_img);
        end
        
        output_img = zeros(size(input_img));
        for i = 1:3
            output_img(:,:,i) = histogram_matching(input_img(:,:,i), reference_img(:,:,i));
        end
        output_img = uint8(output_img);
    end
end

% Perform histogram matching for specific channel
function matched_img = histogram_matching(input_img, reference_img)
    % Performs histogram matching between two images.
    % Computes histogram and cumulative distribution function (CDF) for both images 
    % and maps the intensity values of the input image to the reference image based on their CDFs.
    input_hist = imhist(input_img);
    reference_hist = imhist(reference_img);

    input_cdf = cumsum(input_hist) / numel(input_img);
    reference_cdf = cumsum(reference_hist) / numel(reference_img);

    mapping = zeros(256, 1, 'uint8');
    for i = 1:256
        [~, idx] = min(abs(input_cdf(i) - reference_cdf));
        mapping(i) = idx - 1;
    end

    matched_img = mapping(double(input_img) + 1);
end
