%TimeStart = -2*pi
%TimeEnd = 2*pi
%I = pi/12
TimeStart = -20       %Variable
TimeEnd = 20          %Variable
I = .5          %time unit in seconds for example %%This will approach zero.

hold all
%objectA
yiA = 1;        %%Variable Initial height of object A
xiA = 100;      %%Variable Initial x-position of object A
%xTrajectA = cos([TimeStart:I:TimeEnd])
%xTrajectB = sin([TimeStart:I:TimeEnd])
xTrajectAneg = -((36*([TimeStart:I:0].^2)).^(1/3) - 1)/4 %This is where position in the X-axis as a function of time is defined
xTrajectApos =  ((36*([.5:I:TimeEnd].^2)).^(1/3) - 1)/4
yTrajectA = [xTrajectAneg xTrajectApos].^2  %This is where the position in the Y-axis as a function of time is defined or function of xTraject.

plot([xTrajectAneg xTrajectApos],yTrajectA,'b')   %Plots the trajectory of object A in blue

%objectB
yiB = -1;
xiB = -100;
%xTrajectA = cos([TimeStart:I:TimeEnd])
%xTrajectB = sin([TimeStart:I:TimeEnd])
xTrajectB = [TimeStart:I:TimeEnd]  + (20-((36*((-20)^2)).^(1/3) - 1)/4)
yTrajectB = 0*[TimeStart:I:TimeEnd]  %This would be linear, but doesnt have to be.
plot(xTrajectB,yTrajectB,'r')
%r = .001 %resolution of the lines of sight   Not sure if I need this
%depends on whether I can extend the lines of sights as I desire.
for i= 1:1:ceil(((TimeEnd - TimeStart)/I + 1)/2)
%A = [2 3]; 
%B = [4 5]; 
%plot(A,B,'*')
%axis([0 10 0 10])
%hold on
%line(A,B)
%hold off
 %   xlim = get(gca,'XLim');
 %m = (B(2)-B(1))/(A(2)-A(1));
 %n = B(2)*m - A(2);

 %y1 = m*xlim(1) + n;
 %y2 = m*xlim(2) + n;
 %hold on
 %line([xlim(1) xlim(2)],[y1 y2])

    plot([xTrajectB(i) xTrajectAneg(i)],[yTrajectB(i) yTrajectA(i)]) 
    axis([-1000 1000 -1000 1000])
    %line([xTrajectB(i) xTrajectAneg(i)],[yTrajectB(i) yTrajectA(i)])
    
    %xlim = get(gca, 'XLim')
    %m = (yTrajectA(i) - yTrajectB(i))/(xTrajectAneg(i) - xTrajectB(i))
    %n = yTrajectA(i)*m - xTrajectAneg(i)
    
    %y1 = m*xlim(1) + n
    %y2 = m*xlim(2) + n
    hold all
    %plot([xlim(1) xlim(2)],[y1 y2])
    %if
     %   (( ( ((((yiA-yiB)/(xTrajectA(i) + xiA - (xTrajectB(i) + xiB)))*([-100:u:100]-(xTrajectA(i) + xiA))+ yiA))>0 )   & 
      %  ((((yiA-yiB)/(xTrajectA(i+1) + xiA - (xTrajectB(i+1) + xiB)))*([-100:u:100]-(xTrajectA(i+1) + xiA))+ yiA))< 0 )    
       % |
        %(  ( ((((yiA-yiB)/(xTrajectA(i) + xiA - (xTrajectB(i) + xiB)))*([-100:u:100]-(xTrajectA(i) + xiA))+ yiA)) < 0 ) &
        %(  ((((yiA-yiB)/(xTrajectA(i+1) + xiA - (xTrajectB(i+1) + xiB)))*([-100:u:100]-(xTrajectA(i+1) + xiA))+ yiA))> 0  )  ))
    
         %   plot([-100:I:100],(((yiA-yiB)/(xTrajectA(i) + xiA - (xTrajectB(i) + xiB)))*([-100:I:100]-(xTrajectA(i) + xiA))+ yiA),o)
          %  plot([-100:I:100],(((yiA-yiB)/(xTrajectA(i+1) + xiA - (xTrajectB(i+1) + xiB)))*([-100:I:100]-(xTrajectA(i+1) + xiA))+ yiA),o)
    %end
    %end  
end
for i = ceil(((TimeEnd - TimeStart)/I + 1)/2) + 1:1:(TimeEnd - TimeStart)/I
    %A = [2 3]; 
%B = [4 5]; 
%plot(A,B,'*')
%axis([0 10 0 10])
%hold on
%line(A,B)
%hold off
 %   xlim = get(gca,'XLim');

%m = (B(2)-B(1))/(A(2)-A(1));
%n = B(2)*m - A(2);

%y1 = m*xlim(1) + n;
%y2 = m*xlim(2) + n;
%hold on
%line([xlim(1) xlim(2)],[y1 y2])
    
    plot([xTrajectB(i) xTrajectApos(i-41)],[yTrajectB(i) yTrajectA(i)])
    
    %m2 = (yTrajectA(i) - yTrajectB(i))/(xTrajectApos(i-41) - xTrajectB(i))
    %n2 = yTrajectA(i)*m2 - xTrajectApos(i-41)
    
    %y1 = m2*xlim(1) + n2
    %y2 = m2*xlim(2) + n2
    %hold on
    %plot([xlim(1) xlim(2)],[y1 y2])
    
end
%loop (TimeStart:TimeEnd) for plotting line between objects as well as
%finding the intersection of consecutive lines.  Perhaps also in this loop,
%graph circles at the intersection...yea...that should work.

