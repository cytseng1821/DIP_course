function G=readrawRGB(filename)
% readraw - read RAW format rgb color image file from Disk
% Usuage - G=readraw(filename)
% G: image data matrix
% filename: file name of the file to read from disk

% 	disp(['Retrieving Image ' filename]);
	fid = fopen(filename, 'rb');
	if (fid == -1)
	  	error('can not open imput image filem press CTRL-C to exit \n');
	  	pause
	end
	pixel = fread(fid, inf, 'uchar');
	fclose(fid);
    
    [X,Y] = size(pixel);
    imsize = (X * Y) / 3;
    N = sqrt(imsize);
    G = zeros(N, N, 3, 'uint8');
    G(1: imsize*3) = pixel(1: imsize*3);
    G = permute(G, [2,1,3]);
end