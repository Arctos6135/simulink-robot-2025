file_path = "C:\Users\micah\OneDrive\Documents\data3.csv";

table = log2table(file_path);
timestamp = "Timestamp";

elevatoriddata_ = table2iddata(table, timestamp, "Elevator/LeftVoltage", "Elevator/LeftPosition");
if exist("data\models\levator.mat", "file")
    prev = load("data\models\elevator.mat", "elevatoriddata");
    elevatoriddata = merge(elevatoriddata_, prev.elevatoriddata);
else
    elevatoriddata = elevatoriddata_;
end
save("data\models\elevator.mat", "elevatoriddata");

outtakeiddata_ = table2iddata(table, timestamp, "Outtake/LeftVoltage", "Outtake/LeftVelocity");
if exist("data\models\outtake.mat", "file")
    prev = load("data\models\outtake.mat", "outtakeiddata");
    outtakeiddata = merge(outtakeiddata_, prev.outtakeiddata);
else
    outtakeiddata = outtakeiddata_;
end
save("data\models\outtake.mat", "outtakeiddata");

intakeiddata_ = table2iddata(table, timestamp, "Intake/Voltage", "Intake/Speed");
if exist("data\models\intake.mat", "file")
    prev = load("data\models\intake.mat", "intakeiddata");
    intakeiddata = merge(intakeiddata_, prev.intakeiddata);
else
    intakeiddata = intakeiddata_;
end
save("data\models\intake.mat", "intakeiddata");

angleiddata_ = table2iddata(table, timestamp, "Drivetrain/AngleVoltage", "Drivetrain/Angle");
if exist("data\models\angle.mat", "file")
    prev = load("data\models\angle.mat", "angleiddata");
    angleiddata = merge(angleiddata_, prev.angleiddata);
else
    angleiddata = angleiddata_;
end
save("data\models\angle.mat", "angleiddata");

driveiddata_ = table2iddata(table, timestamp, "Drivetrain/DriveVoltage", "Drivetrain/Velocity");
if exist("data\models\drive.mat", "file")
    prev = load("data\models\drive.mat", "driveiddata");
    driveiddata = merge(driveiddata_, prev.driveiddata);
else
    driveiddata = driveiddata_;
end
save("data\models\drive.mat", "driveiddata");