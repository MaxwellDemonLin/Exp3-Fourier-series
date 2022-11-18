clear all;
f0=500;
fs=44100;
omega = 2*pi*f0;
t = 0:1/fs:3;
amplitude = 10;

harmonics1 = amplitude * sin(2*pi*f0*t);
sound(harmonics1,fs);
T_max = 3;
clipped_t1 = t(1:find(t <= T_max/f0, 1, 'last'));
clipped_wave1 = harmonics1(1:find(t <= T_max/f0, 1, 'last'));
plot(clipped_t1,clipped_wave1);
title('Waveform of harmonics 1 $10sin(2\pi f_{0}t)$','Interpreter','latex');
xlabel('t');
harmonics2 = amplitude * sin(2*pi*f0*t*2);
clipped_t2 = t(1:find(t <= T_max/(2*f0), 1, 'last'));
clipped_wave2 = harmonics2(1:find(t <= T_max/(2*f0), 1, 'last'));
figure
plot(clipped_t2,clipped_wave2);
title('Waveform of harmonics 2 $10sin(2\pi 2f_{0}t)$','Interpreter','latex');
xlabel('t');
%harmonics3 = amplitude * sin(2*pi*f0*t*3);
harmonics3 = amplitude * sin(2*pi*f0*t*3-pi/2);
clipped_t3 = t(1:find(t <= T_max/(3*f0), 1, 'last'));
clipped_wave3 = harmonics3(1:find(t <= T_max/(3*f0), 1, 'last'));
figure
plot(clipped_t3,clipped_wave3);
title('Waveform of harmonics 3 $10sin(2\pi 3f_{0}t)$','Interpreter','latex');
xlabel('t');

sound(harmonics1,fs);
sound(harmonics2,fs);
sound(harmonics3,fs);

chord = harmonics3 +harmonics2 + harmonics1;
clipped_chord_t = t(1:find(t <= T_max/(f0), 1, 'last'));
clipped_chord  = chord(1:find(t <= T_max/(f0), 1, 'last'));
figure
plot(clipped_chord_t,clipped_chord);
title('Chord','Interpreter','latex');
xlabel('t');
sound(chord);
