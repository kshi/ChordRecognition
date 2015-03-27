folder = 'cv';

files = dir(folder);
init;
for i=3:length(files)
    load([folder '/' files(i).name]);
    buildHMMFeatures;
end