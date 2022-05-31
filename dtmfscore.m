function sc = dtmfscore(xx, hh)
    xx = xx*(2/max(abs(xx)));
    y=conv(xx,hh);
    if (max(abs(y(200:length(y)-200)))>=0.59)
        sc=1;
    
    else                                                                                                                                                                                                          
        sc=0;
    end

end
