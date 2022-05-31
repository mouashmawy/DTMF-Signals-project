function hh = dtmfdesign(fb, L, fs)%UNTITLED Summary of this function goes here
hh=[];
nnn= 1:L-1
ww = -pi:(pi / fs):pi;
for n=1:length(fb)
    argument=((2*pi*fb(n))/fs)*nnn;
    h=cos(argument);
    f=freqz(h,1,ww);
    b=abs(1/max(f));
    hh=[hh;b*h];

end
hh=hh';
end