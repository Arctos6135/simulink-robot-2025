function table = log2table(file_path)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
table = readtable(file_path, 'VariableNamingRule','preserve', 'NumHeaderLines', 0);
end