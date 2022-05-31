function keys = dtmfrun(xx,L,fs)
dtmf.keys = ...
['1','2','3','A';
'4','5','6','B';
'7','8','9','C';
'*','0','#','D'];
center_freqs =[697,770,852,941,1209,1336,1447,1633];
hh = dtmfdesign( center_freqs,L,fs );
[nstart,nstop] = dtmfcut(xx,fs); %<--Find the beginning and end of tone bursts
keys = [];
sc= 
for kk=1:length(nstart)
x_seg = xx(nstart(kk):nstop(kk)); %<--Extract one DTMF tone
.... %<=========================================FILL IN THE CODE HERE
   for n=1:length(center_freqs)
    sc=[sc,dtmfscore(x_seg,hh(:,n))];
   end
   ones=find(sc == 1);
   ones1=find(sc(1:4),1);

   ones2=find(sc(4:8),1);
   if (length(ones)>2)
       continue;
   else
       if (length(ones1)>2 || isempty(ones1) || length(ones2)>2 || isempty(ones2))
           continue;
       else
           row=find(sc(1:4)==1);
           com= find(sc(4:8)==1);
           keys=[keys dtmf.keys(row,com)];
       end
   end


end