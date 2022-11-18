function synth_triang = partc_a(max_harmonics,size)
    
    synth_triang = zeros(size(t));
    a = zeros(1, max_harmonics);
    b = zeros(1, max_harmonics);
    for n = 1:max_harmonics
        b(n) = (-1)^(n+1)/(2*n-1)^2;
        synth_triang = synth_triang + b(n) * sin((2*n-1) * omega * t); 
    end
end