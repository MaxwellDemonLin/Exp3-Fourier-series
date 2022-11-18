clear all;
f0=1000;
omega = 2*pi*f0;
T = 2*pi/omega;
t = linspace(0, T, 100000);
V0 = 3/pi;
V = 3/4;
max_harmonics = 50;
a = zeros(1, max_harmonics);
b = zeros(1, max_harmonics);
synth_triang = zeros(size(t));

ideal_fun(t<=T/2) = V;
ideal_fun(t>T/2) =  -V;

for n = 1 : max_harmonics
    b(n)= 1/(2*n-1);
    synth_triang = synth_triang + V0 * b(n) * sin(2*pi*(2*n-1)*f0*t); 
end
max_synth = max(synth_triang);
overshoot = (max_synth-V)/V;
t = linspace(0, 3*T, 3*100000);
synth_triang = repmat(synth_triang, 1, 3);
ideal_fun = repmat(ideal_fun,1,3);
figure
plot(t, synth_triang, 'r--');
hold on;
plot(t,ideal_fun,'b-');
title(['Waveforms synthesised by ' ,num2str(max_harmonics), ' harmonic under f_{0}=1 and V_{0}=1']);