function msg_bi=ExtractAudio(out_Y,len)
X = dct(double(out_Y));
Host_mag=abs(X);
Host2=round(Host_mag*10000);
 Th=0;
count=1;
msg_bi=false(1,len);
for i=1:length(Host2)
    if count>len
        break;
    end
    if Host2(i)>Th  
             msg_bi(count)=rem(Host2(i),2);
            count=count+1;
    end
end