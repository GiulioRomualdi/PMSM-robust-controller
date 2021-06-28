% h_inf_synthesis.m
%
% author: Giulio Romualdi
% copyright: Released under the terms of the MIT License.
% date 2021

% Load model, weight
P_Delta();

% Controller
[K, cl, gamma] = hinfsyn(P, 2, 2, 'display','on');
K.u = 'e_c';
K.y = 'u_c';

% Reduce the controller (Hankel)
K_reduced = reduce(K, 2);
K_reduced.u = 'e_c';
K_reduced.y = 'u_c';
close_loop = connect(G_real, K_reduced, sum_c, sum_w, {'r'}, {'y'});
step(close_loop);

% Discretized the controller
frequency = 20e3;
discrete_controller = c2d(K_reduced, 1/frequency);
