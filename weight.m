% Disturbance weight
Ww = [0;100*tf([1],[1 1])];
Ww.u = 'w1';
Ww.y = 'w';

% Output weight
Wu = 1*tf([1 50], [1 500]) * eye(2);
Wu.u = {'u_c'};
Wu.y = {'e_u'};

% Performance weight
Wp = [1.5e1*tf([1 1e5],[1, 1e4]), 100*tf([1],[1 1])
     100*tf([1],[1 1]), 1.5e1*tf([1 1e5],[1, 1e4])];
Wp.u = {'e_m'};
Wp.y = {'e_y'};