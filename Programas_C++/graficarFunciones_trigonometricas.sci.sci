function graficarFunciones()
    // Definir el rango de x
    x = linspace(-10,10,50); // Permitir valores negativos y positivos
    x_pos = linspace(0,10,50); // Permitir valores negativos y positivos
    
    // Funciones lineales
    figure();
    subplot(2,3,1); plot(x, 2*ones(x)); title('f(x) = b'); xgrid();
    subplot(2,3,2); plot(x, 2*x + 3); title('f(x) = mx + b'); xgrid();

    // Funciones exponenciales
    figure();
    subplot(2,2,1); plot(x, x.^2); title('f(x) = x^2'); xgrid();
    subplot(2,2,2); plot(x, x.^3); title('f(x) = x^3'); xgrid();
    subplot(2,2,3); plot(x, x.^4); title('f(x) = x^4'); xgrid();
    subplot(2,2,4); plot(x, x.^5); title('f(x) = x^5'); xgrid();

    // Funciones de raíz
    figure();
    subplot(2,2,1); plot(x, x_pos.^(1/2)); title("f(x) = x^{1/2}"); xgrid();
    subplot(2,2,2); plot(x, sign(x) .* abs(x).^(1/3)); title("f(x) = x^{1/3}"); xgrid();
    subplot(2,2,3); plot(x, x_pos.^(1/4)); title("f(x) = x^{1/4}"); xgrid();
    subplot(2,2,4); plot(x, sign(x) .* abs(x).^(1/5)); title("f(x) = x^{1/5}"); xgrid();
    
    // Funciones recíprocas
    figure();
    subplot(1,2,1); plot(x(x<>0), 1./x(x<>0)); title('f(x) = 1/x'); xgrid();
    subplot(1,2,2); plot(x(x<>0), 1./x(x<>0).^2); title('f(x) = 1/x^2'); xgrid();

    // Funciones valor absoluto y centro máximo
    figure();
    subplot(1,2,1); plot(x, abs(x)); title('f(x) = |x|'); xgrid();
    subplot(1,2,2); plot(x, max(abs(x))); title('f(x) = Centro Máximo'); xgrid();
endfunction

