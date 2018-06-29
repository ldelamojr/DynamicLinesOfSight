%%%% For now this only models AB(t) for the simplest case i.e. (page 1)
TimeStart = -100
TimeEnd = 100
u = 1          %time unit in seconds for example %%This will approach zero.

hold all
%objectA
yiA = 1;        %%Initial height of object A
xiA = 100;      %%Initial x-position of object A
xTrajectA = [-TimeStart:-u:-TimeEnd]  %%%THIS IMPLIES MOTION ALONG X-DIRECTION. (I.E. NO Y-COMPONENT)
yTrajectA = 0*xTrajectA + yiA  %This would be linear, but doesnt have to be.

plot(xTrajectA,yTrajectA,'b')   %Plots the trajectory of object A in blue

%objectB
yiB = -1;
xiB = -100;
xTrajectB = [TimeStart:u:TimeEnd]
yTrajectB = 0*xTrajectB + yiB  %This would be linear, but doesnt have to be.

plot(xTrajectB,yTrajectB,'r')

for i= 1:(TimeEnd - TimeStart + 1)
    plot([-100:u:100],(((yiA-yiB)/(xTrajectA(i) + xiA - (xTrajectB(i) + xiB)))*([-100:u:100]-(xTrajectA(i) + xiA))+ yiA))
    
    if
        (( ( ((((yiA-yiB)/(xTrajectA(i) + xiA - (xTrajectB(i) + xiB)))*([-100:u:100]-(xTrajectA(i) + xiA))+ yiA))>0 )   & 
        ((((yiA-yiB)/(xTrajectA(i+1) + xiA - (xTrajectB(i+1) + xiB)))*([-100:u:100]-(xTrajectA(i+1) + xiA))+ yiA))< 0 )    
        |
        (  ( ((((yiA-yiB)/(xTrajectA(i) + xiA - (xTrajectB(i) + xiB)))*([-100:u:100]-(xTrajectA(i) + xiA))+ yiA)) < 0 ) &
        (  ((((yiA-yiB)/(xTrajectA(i+1) + xiA - (xTrajectB(i+1) + xiB)))*([-100:u:100]-(xTrajectA(i+1) + xiA))+ yiA))> 0  )  ))
    
            plot([-100:u:100],(((yiA-yiB)/(xTrajectA(i) + xiA - (xTrajectB(i) + xiB)))*([-100:u:100]-(xTrajectA(i) + xiA))+ yiA),o)
            plot([-100:u:100],(((yiA-yiB)/(xTrajectA(i+1) + xiA - (xTrajectB(i+1) + xiB)))*([-100:u:100]-(xTrajectA(i+1) + xiA))+ yiA),o)
    end
    
    
end
%loop (TimeStart:TimeEnd) for plotting line between objects as well as
%finding the intersection of consecutive lines.  Perhaps also in this loop,
%graph circles at the intersection...yea...that should work.

