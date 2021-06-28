function [ plant_nom, plant ] = motor_model()

    Ld0 = 0.000224;
    Lq0 = 0.000233;
    R0 = 0.5;

    Ld = ureal('Ld', Ld0, 'Percentage', 5);
    Lq = ureal('Lq', Lq0, 'Percentage', 5);
    R = ureal('R', R0, 'Percentage', 30);
    omega_e = ureal('omega_e', 0, 'Range', [-1 1] * 1e3);

    A = [-R/Ld, Lq * omega_e / Ld;
         -Ld * omega_e / Lq, -R / Lq];

    B = diag([1/Ld, 1/Lq]);

    C = eye(2);

    D = zeros(2);

    plant = uss(A,B,C,D);
    plant.inputname = {'u'};
    plant.outputname = {'y'};
  
    % Nominal transfer function
    plant_nom = plant.NominalValue;
    
end
