function model = model_est(input,output, nx)
%MODEL_EST Estimates a state space model of a SISO system.
%   Detailed explanation goes here
model = ssest(input, output, nx, 'Ts', 0.02, 'DisturbanceModel', 'none', 'Form', 'canonical');
end