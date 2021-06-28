% Disturbance weight
Ww = [0;-1*tf([1],[1 1])];
Ww.u = 'w1';
Ww.y = 'w';

% Output weight
Wu = 1*tf([1 50], [1 500]) * eye(2);
Wu.u = {'u_c'};
Wu.y = {'e_u'};

% Performance weight
Wp = [1.5e-2*tf([1 1e6],[1, 1]), 0
     0, 1.5e-2*tf([1 1e6],[1, 1])];
Wp.u = {'e_m'};
Wp.y = {'e_y'};