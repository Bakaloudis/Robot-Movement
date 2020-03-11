function output=Improved_Euler(fx,fy,nZ)
  format long 
  output=zeros(6000,4);
  boundA=0;
  boundB=600;
  h=0.1;
  xN=0;
  yN=-3.04;
  psiN =0;
  xN_der=0;
  yN_der=0;
  psiN_der=0;
  counter=1;
  for i=boundA:h:boundB
   %Normal Euler
    new_psiN_der=psiN_der +(h*(nZ-12000*abs(psiN_der)*psiN_der)/357000);
   %%Compute next iteration with Euler
    new_psiN_derK2=new_psiN_der +(h*(nZ-12000*abs(new_psiN_der)*new_psiN_der)/357000);
    %%Find mean of the previous results
    new_psiN=psiN + (h/2)*(new_psiN_der+new_psiN_derK2);
    %new_psiN_der=psiN_der + (h/2)*((nZ-12000*abs(psiN)*psiN)/357000 + (nZ-12000*abs(psiN_der+h*psiN_der)*(psiN_der+h*psiN_der))/357000);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%Do the same for y function
    new_yN_der= yN_der +h*((714425000*(cos(psiN)*psiN_der*xN_der+sin(psiN)*psiN_der*yN_der)+fy-14875*abs(yN_der)*yN_der)/(714425000*cos(psiN)));
    new_yN_derK2= new_yN_der +h*((714425000*(cos(psiN)*psiN_der*xN_der+sin(psiN)*psiN_der*new_yN_der)+fy-14875*abs(new_yN_der)*new_yN_der)/(714425000*cos(psiN)));
    new_yN=yN + (h/2)*(new_yN_der+new_yN_derK2);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Do the same for x function
    new_xN_der=xN_der +h*((764000*(sin(psiN)*psiN_der*xN_der-cos(psiN)*psiN_der*yN_der)+fx-14875*abs(xN_der)*xN_der)/764000*cos(psiN));
    new_xN_derK2=new_xN_der +h*((764000*(sin(psiN)*psiN_der*new_xN_der-cos(psiN)*psiN_der*yN_der)+fx-14875*abs(new_xN_der)*new_xN_der)/764000*cos(psiN));
    new_xN=xN + (h/2)*(new_xN_der+new_xN_derK2);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%Update x,y,psi and their derivatives for next iteration
    psiN=new_psiN;
    psiN_der=(new_psiN_der+new_psiN_derK2)/2;
    yN=new_yN;
    yN_der=(new_yN_der+new_yN_derK2)/2;
    xN=new_xN;
    xN_der=(new_xN_der+new_xN_derK2)/2;
    %%Put results in array
    output(counter,1)=i;
    output(counter,2)=xN;
    output(counter,3)=yN;
    output(counter,4)=psiN;
    counter+=1;
    %disp(xN);
  endfor
  %%save the matrix in a txt file
  save('MyMatrixImproved.txt','output');

endfunction
