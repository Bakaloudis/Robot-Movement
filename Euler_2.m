function output=Euler_2()
  format long 
  output=zeros(6000,4);
  boundA=0;
  boundB=600;
  h=0.1;
  xN=3.04;
  yN=0;
  psiN =0;
  xN_der=0;
  yN_der=0;
  psiN_der=0;
  %nZ=3040;
  %fy=0;
  %fx=0;
  counter=1;
  for i= boundA:h:boundB
    new_psiN = psiN + h*psiN_der;
    new_psiN_der=psiN_der +(h*((50000*(-0.304-psiN)-6696000*psiN_der)-12000*abs(psiN_der)*psiN_der)/357000);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    new_yN= yN +h*yN_der;
    new_yN_der= yN_der +h*((714425000*(cos(psiN)*psiN_der*xN_der+sin(psiN)*psiN_der*yN_der)+(44800*(30.4-yN)-5000000*yN_der)-14875*abs(yN_der)*yN_der)/(714425000*cos(psiN)));
   
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    new_xN=xN +h*xN_der;
    new_xN_der=xN_der +h*((764000*(sin(psiN)*psiN_der*xN_der-cos(psiN)*psiN_der*yN_der)+(60000*(30.4-xN)-5000000*xN_der)-11835*abs(xN_der)*xN_der)/764000*cos(psiN));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    xN=new_xN;
    xN_der=new_xN_der;
    psiN=new_psiN;
    psiN_der=new_psiN_der;
    yN=new_yN;
    yN_der=new_yN_der;
    output(counter,1)=i;
    output(counter,2)=xN;
    output(counter,3)=yN;
    output(counter,4)=psiN;
    counter+=1;
  endfor
  disp(xN);

  disp(yN);
  
  disp(psiN);
  disp("%%%%%%%%%%%%%%%%");
  save('MyMatrix1.txt','output');
 endfunction 


  
  
  

