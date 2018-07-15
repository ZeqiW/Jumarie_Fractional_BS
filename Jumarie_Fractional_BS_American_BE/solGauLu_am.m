function x=solGauLu_am(L,U,B,g)
n=length(B);
Y=[];
for i=1:n
    for j=1:i-1
        B(i)=B(i)-L(i,j)*Y(j);
    end
    Y(i)=B(i)/L(i,i);
end
Y=Y';
x=pback(U,Y,g);
