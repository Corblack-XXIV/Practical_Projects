// Definir constantes
R = 8.314; // J/(mol*K)
T = 298; // K
F = 96485; // C/mol

// Función para calcular el potencial de Nernst
function EX = Nernst(z, conc_out, conc_in)
    EX = (R * T)/(z * F) * log(conc_out / conc_in);
endfunction

// Concentraciones iniciales (mM)
Na_out = 145; Na_in = 12;
K_out = 4; K_in = 155;
Cl_out = 123; Cl_in = 4;
Ca_out = 2; Ca_in = 0.0002;

// Calcular potenciales de Nernst
E_Na = Nernst(1, Na_out, Na_in);
E_K = Nernst(1, K_out, K_in);
E_Cl = Nernst(-1, Cl_out, Cl_in); // Cloro tiene carga negativa
E_Ca = Nernst(2, Ca_out, Ca_in);

// Mostrar resultados
mprintf("Estado -> Recuperación del estado de reposo \n");
mprintf("Potencial de Nernst para Na+: %.2f mV\n", E_Na * 1000);
mprintf("Potencial de Nernst para K+: %.2f mV\n", E_K * 1000);
mprintf("Potencial de Nernst para Cl-: %.2f mV\n", E_Cl * 1000);
mprintf("Potencial de Nernst para Ca2+: %.2f mV\n", E_Ca * 1000);

// Potencial de reposo usando la ecuación de Goldman-Hodgkin-Katz (GHK)
P_Na = 0.04; P_K = 1; P_Cl = 0.2; P_Ca = 0.001;

E_rest = (R*T/F)*log((P_K*K_out + P_Na*Na_out + P_Ca*(Ca_out)^0.5)/(P_K*K_in + P_Na*Na_in + P_Ca*(Ca_in)^0.5));
mprintf("Potencial de reposo: %.2f mV\n", E_rest * 1000);
