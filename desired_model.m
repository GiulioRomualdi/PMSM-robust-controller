function M = desired_model()
% DESIRED_MODEL return a second order model with specified settilig time
% and overshoot
%
%   M = desired_model()

%   Giulio Romualdi 

T_settling = 1e-5; % second
S = 0.5; % overshoot in %
a = log(100 / S);
xi = sqrt(a^2 / (pi^2 + a^2)); % damping
omega_n = - 1 / (T_settling * xi) * log(0.01 * 5); % natural frequency

M_siso = omega_n^2 * tf(1, [1, 2 * xi * omega_n, omega_n^2]);
M = [M_siso, 0;
     0, M_siso];
M.u = {'r'};
M.y = {'y_model'};
end
