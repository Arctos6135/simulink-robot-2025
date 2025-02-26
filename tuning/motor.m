classdef motor
    %MOTOR A class which contains motor data and values.
    %   Detailed explanation goes here
    
    properties
        ssmodel; % The state space model for the motor.
        nx; % The order of the state space model.
        data; % The iddata object for the robot
        pid; % The pid object for the motor.
        pidoptions;
        ts; % The sample time of the motor.
        input;
        output;
        inputUnit;
        outputUnit;
    end
    
    methods
        function obj = motor(nx, ts, input, output, inputUnit, outputUnit)
            %MOTOR Construct an instance of this class
            %   Detailed explanation goes here
            obj.nx = nx;
            obj.ts = ts;
            obj.input = input;
            obj.output = output;
            obj.inputUnit = inputUnit;
            obj.outputUnit = outputUnit;
        end
        
        function obj = adddata(obj, timetable)
            retime(timetable, 'regular', 'linear', 'TimeStep', seconds(obj.ts));
            try
                obj.data = merge(obj.data, iddata(timetable{:, obj.output}, timetable{:, obj.input}, obj.ts));
            catch
                obj.data = iddata(timetable{:, obj.output}, timetable{:, obj.input}, obj.ts);
            end
            
            obj.data.InputName = obj.input;
            obj.data.OutputName = obj.output;
            obj.data.InputUnit = obj.inputUnit;
            obj.data.OutputUnit = obj.outputUnit;
        end

        function obj = updatemodel(obj)
            obj.ssmodel = ssest(obj.data, obj.nx, "Ts", obj.ts, "DisturbanceModel", "none", "form", "canonical", "InputName", obj.input, "OutputName", obj.output);
            obj.ssmodel.InputUnit = obj.inputUnit;
            obj.ssmodel.OutputUnit = obj.outputUnit;
        end

        function sisomodel = getsisomodel(obj, output)
            output_index = find(strcmp(obj.ssmodel.OutputName, output));
            sisomodel = ss(obj.ssmodel.A, obj.ssmodel.B, obj.ssmodel.C(output_index, :), obj.ssmodel.D(output_index, :), obj.ts);
        end

        function obj = tunepid(obj, variable, designFocus, type)
            sisomodel = obj.getsisomodel(variable);
            obj.pidoptions = pidtuneOptions("DesignFocus", designFocus);
            obj.pid = pidtune(sisomodel, type, obj.pidoptions);
        end
    end
end