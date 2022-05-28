function xx = dtmfdial(keyNames,fs)

dtmf.keys =['1','2','3','A';
'4','5','6','B';
'7','8','9','C';
'*','0','#','D'];
dur=0.2;
start=0;
dt=1/fs;
xx=[];
dtmf.colTones = ones(4,1)*[1209,1336,1477,1633];
dtmf.rowTones = [697;770;852;941]*ones(1,4);
for i=1:(length(keyNames))
    [ii,jj] = find(keyNames(i)==dtmf.keys);
    if (isempty(ii) || isempty(jj))
        error([keyNames(i) ' is not vaid you should enter a valid key name'])
    end
     tt=start:dt:dur;
    sil=floor(0.05/dt);
    vzero=zeros(1,sil);
    signal1=cos(2*pi*dtmf.rowTones(ii)*tt);
    signal2=cos(2*pi*dtmf.colTones(jj)*tt);
    sumsignal=signal1+signal2;
    
    xx=[xx,sumsignal,vzero];
    start=start+dur+0.05;
    
    dur=start+0.2;
    
end
end