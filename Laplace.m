function output = Laplace()
  format long 
  output=zeros(6000,2);
  boundA=0;
  boundB=600;
  h=0.1;
  counter=1;
  
  b = [-15200];
  a=[357000000 6972000 50000 0];
  [r,p,k]=residue(b,a);
  
  h_s= (r(1)/p(1)) + (r(2)/p(2)) ;
  
  for i =boundA:h:boundB
    #display(i);
    output(counter,1) = i;
    output(counter,2) = exp(p(2)*i)*(r(2)+r(1));
    counter+=1;
  endfor
  save('MyMatrixLaplace.txt','output');
  
endfunction
