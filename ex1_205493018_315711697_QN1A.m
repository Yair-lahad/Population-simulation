ProbB=0.035; %chance per zebra to give birth
ProbD=0.034; %chance per zebra to die
popNum=10000; %numbers of zebras per cycle of life
zebPop =randi(3,[popNum,1]); % random population of zebras
for n=1:240
    deaths=rand(popNum,1);
    deaths(deaths<ProbD)=0;
    zebPop(deaths==0)=[];
    popNum=length(zebPop);
    births=rand(popNum,1); %who can give birth
    births(births<ProbB)=1;
    childs=zeros(length(zebPop),1);
    for i=1:length(births) % mom can mate with a single zebra that will be the dad (random choosing)
        if births(i)==1 % only the zebras who stochasticly got a change to give birth 
            mom=zebPop(i);
            dadIndex=randi(length(births),1);
            hetro=0; %Condtion to check if random dad is mom
            while(hetro~=1)
                if(dadIndex==i)% mom can not mate with herself
                    dadIndex=randi(length(births),1);
                else
                    hetro=1;
                end
             end
            dad=zebPop(dadIndex); %the dad is random zebra
            child=mating(mom,dad);
            childs(i)=child;
        end
    end
    zebPop=[zebPop; childs];
    zebPop(zebPop==0)=[];
    childs=zeros(length(zebPop),1);
end
[zebUp,zebDown,zebVer]=Types(zebPop);
disp('the relative portion of up stripes (type 1) is: ');
disp((zebUp/popNum));
disp('the relative portion of down stripes (type 2) is: ')
disp((zebDown/popNum));
disp('the relative portion of vertical stripes (type 3) is: ')
disp((zebVer/popNum));

function [zebUp,zebDown,zebVer] = Types(pop)
    zebUp=sum(pop==1);   %number of Zebras with diagonal stripes head-tail direction from total population
    zebDown=sum(pop==2); %number of Zebras with diagonal stripes tail-head direction from total population
    zebVer=sum(pop==3);  %number of Zebras with vertial stripes from total population
end
function value = mating(mom,dad)
    rc=rand(1,1);
    if mom==1 && dad==1
        if rc<=0.9
            value=1;
        elseif (0.9<rc) && (rc<0.99)
            value=2;
        elseif rc>=0.99
            value=3;
        end
    elseif (mom==1 && dad==2)||(mom==2 && dad==1)
        if rc<=0.2
            value=1;
        elseif (0.2<rc) && (rc<0.7)
            value=2;
        elseif rc>=0.7
            value=3;
        end
    elseif (mom==1 && dad==3)||(dad==1 && mom==3)
        if rc<=0.5
            value=1;
        elseif (0.5<rc) && (rc<0.9)
            value=2;
        elseif rc>=0.9
            value=3;
        end
    elseif mom==2 && dad==2
        if rc<=0.99
            value=1;
        elseif (0.99<rc) && (rc<0.999)
            value=2;
        elseif rc>=0.999
            value=3;
        end
    elseif (mom==2 && dad==3)||( dad==2 && mom==3)
        if rc<=0.001
            value=1;
        elseif (0.001<rc) && (rc<0.3)
            value=2;
        elseif rc>=0.3
            value=3;
        end
    elseif mom==3 && dad==3
        if rc<=0.1
            value=1;
        elseif (0.1<rc) && (rc<0.4)
            value=2;
        elseif rc>=0.4
            value=3;
        end
    end 

end


