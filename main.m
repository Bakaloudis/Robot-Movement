output=Euler_2();
output1=Improved_Euler_2();
output2=Laplace();
figure;
plot(output(:,1),output(:,4),'g',output1(:,1),output1(:,4),'r',real(output2(:,1)),real(output2(:,2)),'b');
xlabel("h=0.1");
ylabel("psi");
legend('Euler','Improved Euler','Laplace');
#output=Euler_2();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%output=Euler(-3040,0,0);
%output1=Improved_Euler(-3040,0,0);
%figure;
%plot(output(:,1),output(:,4),'g',output1(:,1),output1(:,4),'r');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%output=Euler(0,-3040,0);
%output1=Improved_Euler(0,-3040,0);
%figure;
%plot(output(:,1),output(:,4),'g',output1(:,1),output1(:,4),'r');
%output=Laplace();
%b = [-15200];
%a=[357000000 6972000 50000 ];
%[r,p,k]=residue(b,a);

%display(r);
%display(p);


