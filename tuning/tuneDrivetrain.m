function[] = tuneDrivetrain(csv_path)
%TUNEDRIVETRAIN Summary of this function goes here
%   Detailed explanation goes here
modules = {'FrontLeft', 'FrontRight', 'BackLeft', 'BackRight'};

data = csvToTable(csv_path);
drivingData = selectVars(data, [strcat(modules, 'DrivingVoltage'), strcat(modules, 'DrivingVelocity')]);
turningData = selectVars(data, [strcat(modules, 'TurningVoltage'), strcat(modules, 'Angle')]);

drivingData = cleanTable(drivingData);
turningData = cleanTable(turningData);

for i=1:4
    if i ==1
        DrivingModel = model_est(drivingData{:, strcat(modules{i}, "DrivingVoltage")}, drivingData{:, strcat(modules{i}, "DrivingVelocity")}, 2);
        TurningModel = model_est(turningData{:, strcat(modules{i}, "TurningVoltage")}, turningData{:, strcat(modules{i}, "Angle")}, 3);
    else
        DrivingModel = merge(DrivingModel, model_est(drivingData{:, strcat(modules{i}, "DrivingVoltage")}, drivingData{:, strcat(modules{i}, "DrivingVelocity")}, 2));
        TurningModel = merge(TurningModel, model_est(turningData{:, strcat(modules{i}, "TurningVoltage")}, turningData{:, strcat(modules{i}, "Angle")}, 3));
    end
end

opt = pidtuneOptions('DesignFocus', 'reference-tracking');
drivingPID = pidtune(DrivingModel, 'PIDF', opt);
turningPID = pidtune(TurningModel, 'PIDF', opt);

save("Results", "DrivingModel", "TurningModel", "drivingPID", "turningPID");
end