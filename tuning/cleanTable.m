function cleanedTable = cleanTable(rawTable)
%cleanTable Cleans data in given table.
%   Removes missing data and performs gaussian filtering on the table.
cleanedTable = rmmissing(rawTable);
smoothdata(cleanedTable, "gaussian");
end