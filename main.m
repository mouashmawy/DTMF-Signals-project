fb=[697,770,852,941,1209,1336,1477,1633];
L=40;
fs=8000;
keyNames=['A','B','C','3'];
xx = dtmfdial(keyNames,fs);
hh = dtmfdesign(fb, L, fs);
[nstart,ntend] = dtmfcut(xx,fs);
keys = dtmfrun(xx,L,fs)


