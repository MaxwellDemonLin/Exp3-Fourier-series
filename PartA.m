omega = 2;
T = 2*pi/omega;

t = linspace(0, T, 10000);
V0 = 1;

max_harmonics = 5;
a = zeros(1, max_harmonics);
b = zeros(1, max_harmonics);
synth_triang = zeros(size(t));
for n = 1:max_harmonics
    b(n)=1/(2*n-1);
    synth_triang = synth_triang + V0 * b(n)*sin((2*n-1)*omega*t);
end
t = linspace(0, 3*T, 3*10000);
synth_triang = repmat(synth_triang, 1, 3);
plot(t, synth_triang, 'b');
title(['Waveforms synthesised by ' ,num2str(max_harmonics), ' harmonic']);
