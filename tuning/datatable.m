classdef datatable
    %DATATABLE Class which contains network table data.
    %   Detailed explanation goes here
    
    properties
        table;
        timestamp;
        dt;
    end
    
    methods
        function obj = datatable(file_path, type)
            %DATATABLE Construct an instance of this class
            %   Detailed explanation goes here
           if type == "csv"
               obj.table = readtable(file_path, 'VariableNamingRule','preserve', 'NumHeaderLines', 0);
               obj.timestamp = obj.table{:, 1};
               obj.timestamp = obj.timestamp - obj.timestamp(1);
               obj.dt = seconds(obj.timestamp);
           end 
        end

        function timetable_ = gettimetable(obj, variables)
            %GETTIMETABLE
            % Returns a timetable with variables in it.
            table_ = obj.table(:, variables);
            timetable_ = table2timetable(table_, 'RowTimes', seconds(obj.timestamp));
        end

        function var = getvar(obj, variable_name)
            %GETVAR Return the column associated with variable_name.
            %
            var = obj.table.(variable_name);
        end
    end
end

