function [selectedTable] = selectVars(table,variables)
%SELECT Returns a table of selected variables.
%   Detailed explanation goes here
headers = strcat("NT:/AdvantageKit/Swerve/", variables);
selectedTable = table(:, headers);
selectedTable.Properties.VariableNames = variables;
end