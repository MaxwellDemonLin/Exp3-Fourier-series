clear all;
f0=1;
omega = 2*pi*f0;
T = 2*pi/omega;

t = linspace(0, T, 10000);
V0 = 1;

max_harmonics = 80;
a = zeros(1, max_harmonics);
b = zeros(1, max_harmonics);
synth_triang = zeros(size(t));
for n = 1:max_harmonics
    b(n)=1/(2*n-1);
    synth_triang = synth_triang + V0 * b(n)*sin((2*n-1)*omega*t);
end
figure
c = zeros(1,max_harmonics)
c = sqrt(a.^2+b.^2);
f = linspace(f0,(2*max_harmonics-1)*f0,max_harmonics);
stem(f,c);
title('Spectrum of f(t) for PartA');

figure
t = linspace(0, 3*T, 3*10000);
synth_triang = repmat(synth_triang, 1, 3);
plot(t, synth_triang, 'b');
title(['Waveforms synthesised by ' ,num2str(max_harmonics), ' harmonic under V_{0}=1 and f_{0} = 1']);
