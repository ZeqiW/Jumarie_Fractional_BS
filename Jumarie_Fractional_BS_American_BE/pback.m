function x=pback(U, b, g)
n = length(b);
for i=n:-1:1
    for j=i+1:n
        b(i)=b(i)-U(i,j)*x(j);
    end
    x(i)=b(i)/U(i,i);%back solve
    if(g(i)>x(i))%compare ti with gi
        x(i)=g(i);
    end
end
x=x';
