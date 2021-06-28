[G_nom, G_real] = motor_model();


% Define sum blocks
sum_c = sumblk('e_c = r - y', 2);
sum_w = sumblk('u = u_c + w', 2);
sum_m = sumblk('e_m = y - y_model', 2);

% Load desired model 
M = desired_model();

% Load weight (required for h_inf)
weight;

% Compute P-Delta plant
P_real = connect(G_real, M,...
                sum_c, sum_w, sum_m,...
                Wp, Wu, Ww,...
                {'r', 'w1', 'u_c'}, {'e_u', 'e_y', 'e_c'});
 
% Compute nominal value.
P = P_real.NominalValue;