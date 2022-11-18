clear;
f0=1;
omega = 2*pi*f0;
T = 2*pi/omega;

t = linspace(0, T, 10000);
V0 = 1;
f = V0 - 2*V0.*t/T;



max_harmonics = 10;
a = zeros(1, max_harmonics);
b = zeros(1, max_harmonics);
synth_triang = zeros(size(t));
for n = 1:max_harmonics
    b(n) = 2*V0/(pi*n);
    synth_triang = synth_triang + b(n) * sin(n * omega * t); 
end

t = linspace(0, 3*T, 3*10000);
synth_triang = repmat(synth_triang, 1, 3);
f = repmat(f,1,3);
figure
plot(t,f,'b-')
hold on;
plot(t, synth_triang, 'r-');
% plot(t, synth_triang, 'b-');

title(['Waveforms synthesised by ' ,num2str(max_harmonics), ' harmonic under f_{0}=1 and V_{0}=1']);