elevatormodel = ssest(load("data\models\elevator.mat", "elevatoriddata").elevatoriddata, 3);
save("data\models\elevator.mat", "elevatormodel", "-append");

intakemodel = ssest(load("data\models\intake.mat", "intakeiddata").intakeiddata, 2, "DisturbanceModel", "none");
save("data\models\intake.mat", "intakemodel", "-append");

outtakemodel = ssest(load("data\models\outtake.mat", "outtakeiddata").outtakeiddata, 2, "DisturbanceModel", "none");
save("data\models\outtake.mat", "outtakemodel", "-append");

drivemodel = ssest(load("data\models\drive.mat", "driveiddata").driveiddata, 2, "DisturbanceModel", "none");
save("data\models\drive.mat", "drivemodel", "-append");

% anglemodel = ssest(load("data\models\angle.mat", "angleiddata").angleiddata, 3, "DisturbanceModel", "none");
% save("data\models\angle.mat", "anglemodel", "-append");