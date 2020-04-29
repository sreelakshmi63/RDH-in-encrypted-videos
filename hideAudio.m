function out_Y=hideAudio(len,Xoriginal,message_bi)
Y = dct(double(Xoriginal));
sign_Y = sign(Y);
Host=abs(Y);
nHost=round(Host*10000); 
% data hiding
Th=0;
count=1;
for i=1:length(nHost)
    if count>len
        break;
    end
    if nHost(i)>Th  
        if ~isequal(rem(nHost(i),2),message_bi(count))
            if nHost(i)==(Th+1)
            nHost(i)=nHost(i)+1; 
            else
             nHost(i)=nHost(i)-1;  
            end
        end
        count=count+1;
    end
end
% inverse DCT
Host1=nHost/10000;
out_Y=idct(Host1.*sign_Y);