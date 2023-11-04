function pos2=find_matches(I1,pos1,I2);
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
I2=rgb2gray(I2);
detector = detectHarrisFeatures(I2);
pos2=detector.Location;
pos[].length=max(pos1.length,pos2.length);
end

