opts = pidtuneOptions('DesignFocus', 'reference-tracking');

elevatorpid = pidtune(load("data\models\elevator.mat", "elevatormodel"), "PID", opts);
save("data\models\elevator.mat", "elevatorpid", "-append");

intakepid = pidtune(load("data\models\intake.mat", "intakemodel"), "PID", opts);
save("data\models\intake.mat", "intakepid", "-append");

outtakepid = pidtune(load("data\models\outtake.mat", "outtakemodel"), "PID", opts);
save("data\models\outtake.mat", "outtakepid", "-append");

% anglepid = pidtune(load("data\models\angle.mat", "anglemodel"), "PID", opts);
% save("data\models\angle.mat", "anglepid", "-append");

drivepid = pidtune(load("data\models\drive.mat", "drivemodel"), "PID", opts);
save("data\models\drive.mat", "drivepid", "-append");