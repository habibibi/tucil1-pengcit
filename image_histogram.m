function [counts, binLocations] = image_histogram(img)
    %Mengembalikan histogram dari gambar
    %   dimensi count berupa (channels, 256)
    %   dimensi binLocations (1, 256)

    [rows, columns, channels] = size(img);
    counts = zeros(channels, 256);
    binLocations = 0:255;

    for i = 1:rows
        for j = 1:columns
            for c = 1:channels
                intensity = img(i, j, c);
                counts(c, intensity+1) = counts(c, intensity+1)+1;
            end
        end
    end
end


