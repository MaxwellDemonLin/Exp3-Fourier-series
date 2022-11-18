clear all;
f0=1000;
omega = 2*pi*f0;
T = 2*pi/omega;
t = linspace(0, T, 100000);
V0 = 3/pi;
V = 3/4;
max_harmonics = 5;
a = zeros(1, max_harmonics);
b = zeros(1, max_harmonics);

ideal_fun(t<=T/2) = V;
ideal_fun(t>T/2) =  -V;

synth_triang = zeros(size(t));
% for n = 1 : max_harmonics
%     synth_triang = synth_triang + V0*(1/(2*n-1))*sin(2*pi*(2*n-1)*f0*t-((2*n-1)*pi)/2);
% end

% for n = 1 : max_harmonics
%     synth_triang = synth_triang + V0*(1/(2*n-1))*sin(2*pi*(2*n-1)*f0*t-pi/2);
% end

synth_triang = V0*(sin(3*omega*t-3*pi/2)/6+sin(5*omega*t-5*pi/2)/5+sin(7*omega*t-7*pi/2)/7+sin(9*omega*t-9*pi/2)/18);

max_synth = max(synth_triang);
overshoot = (max_synth-V)/V;
t = linspace(0, 3*T, 3*100000);
synth_triang = repmat(synth_triang, 1, 3);
ideal_fun = repmat(ideal_fun,1,3);
figure
plot(t, synth_triang, 'r--');
hold on;
plot(t,ideal_fun,'b-');
title(['Waveforms synthesised by ' ,num2str(max_harmonics), ' harmonic under f_{0}=1000']);