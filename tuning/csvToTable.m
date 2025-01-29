function table = csvToTable(csv_path)
% Converts the csv file at the given path to a table.
%   Creates a table from the csv file while preserving header names.
table = readtable(csv_path, 'PreserveVariableNames', true);
end

