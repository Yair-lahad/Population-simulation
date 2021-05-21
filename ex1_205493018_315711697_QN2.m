Matala=ex2_205493018_315711697_QN2(25,4);
disp(Matala);
function x1 = ex2_205493018_315711697_QN2(a, x0)
count=0;
dist=true;
while dist
    x1=(x0/2)+(a/(2*x0));
    d=abs(x1-x0);
    if d<(10^(-8))
        disp('you guessed correctly!');
        dist=false;
    else
        x0=x1;
    end
     if count>1000
         disp('youve gone too far')
         dist=false;
         x1=0;
     end
     count=count+1;
end  
end