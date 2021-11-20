%Design of FIR Digital Filter

%parameters
Ap = 0.14; %dB maximum passband ripple
Aadesirable = 52; % dB minimum stopband attenuation
wp1 = 500; %rad/s lower passband edge
wp2 = 800; %rad/s upper passband edge
wa1 = 400; % rad/s lower stopband edge
wa2 = 950; %rad/s upper stopband edge
ws = 2400; %rad/s sampling frequency

Bt = min(wp1-wa1, wa2-wp2);
wc1 = wp1 - Bt/2;
wc2 = wp2 + Bt/2;

dp = ((10^(0.05*Ap))-1)/((10^(0.05*Ap))+1);
da = 10^(-0.05*Aadesirable);
d = min(dp, da);

Aa = -20*log10(d); %actual Aa of the filter

%kaiser window
if Aa<=21
    alpha = 0;
elseif Aa<=50
        alpha = (0.5842*((Aa-21)^0.4)) + (0.07886*(Aa-21));
else
    alpha = 0.1102*(Aa - 8.7);
end

if Aa<=21
    D = 0.9222;
else
    D = (Aa - 7.95)/14.36;
end






