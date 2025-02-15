function iddata_ = table2iddata(table, timestamp, input, output)
%TABLE2IDDATA Summary of this function goes here
%   Detailed explanation goes here

timestamp_ = table.(timestamp);
input_ = table.(strcat("NT:/AdvantageKit/", input));
output_ = table.(strcat("NT:/AdvantageKit/", output));

input_ = rmmissing(input_);
output_ = rmmissing(output_);

% Averages the delta time.
ts = mean(timestamp_(2:end) - timestamp_(1:end-1));

iddata_ = iddata(output_, input_, ts);
end