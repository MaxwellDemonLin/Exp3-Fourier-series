clear;
f0=1;
omega = 2*pi*f0;
T = 2*pi/omega;
t = linspace(0, T, 100000);
V0 = 1;
max_harmonics = 1000;
a = zeros(1, max_harmonics);
b = zeros(1, max_harmonics);
synth_triang = zeros(size(t));
% for n = 1:max_harmonics
%     b(n) = (-1)^(n+1)/(2*n-1)^2;
%     synth_triang = synth_triang + b(n) * sin((2*n-1) * omega * t); 
% end

% for n = 1:max_harmonics
%     a(n)=0.1;
%     synth_triang = synth_triang + a(n) * cos(n * omega * t);
% end

% for n = 1 : max_harmonics
%     if n==1
%         b(n) = 1;
%         synth_triang = synth_triang + b(n) * sin(omega * t); 
%     else
%         b(n)= - 4/((2*n-2)^2-1)*pi;
%     end
%     synth_triang = synth_triang + b(n) * cos(n * omega * t); 
% end

for n = 1 : max_harmonics
    b(n)= - 4/((2*n)^2-1)*pi;
    synth_triang = synth_triang + b(n) * cos(n * omega * t); 
end
   
t = linspace(0, 3*T, 3*100000);
synth_triang = repmat(synth_triang, 1, 3);
figure
plot(t, synth_triang, 'b-');

title(['Waveforms synthesised by ' ,num2str(max_harmonics), ' harmonic under f_{0}=1 and V_{0}=1']);