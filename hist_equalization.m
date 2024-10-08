function [outimg] = hist_equalization(img)
%HIST_EQUALIZATION mengembalikan hasil histogram equalization gambar
%masukan
[rows, columns, channels] = size(img);
outimg = zeros(rows, columns, channels, 'uint8');
n = rows*columns;
counts = zeros(channels,256);

% menghitung banyak pixel
for i = 1:rows
    for j = 1:columns
        for c = 1:channels
            intensity = img(i, j, c);
            counts(c, intensity+1) = counts(c, intensity+1)+1;
        end
    end
end

cdf = counts/n; % normalisasi
cdf = cumsum(cdf,2); % hitung array kumulatif
map = round(cdf*255); % normalisasi kembali ke domain awal

% mapping hasil intentitas pixel yang baru
for i = 1:rows
    for j = 1:columns
        for c = 1:channels
            intensity = img(i, j, c);
            outimg(i, j, c) = map(c, intensity+1);
        end
    end
end

end