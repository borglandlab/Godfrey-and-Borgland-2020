function [colour_matlab] = RGB_converter(colour_RGB)
%{
RGB_converter takes regular RGB values that are out of 255 and converts
them to the matlab RGB system that is out of 1.
%}

colour_factor = colour_RGB / 255;
matlabcol = [1 1 1];
colour_matlab = matlabcol .* colour_factor;
end

