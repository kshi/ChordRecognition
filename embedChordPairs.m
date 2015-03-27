function [ f ] = embedChordPairs( a,b )
% embed pairs of chords (25x25) onto a boolean hypercube of dimension 10
f = zeros(10,1);
str = dec2base(a*25+b+1, 2);
for i=1:length(str)   
    f(i + 10-length(str)) = int16(str2double(str(i)));
end
end

