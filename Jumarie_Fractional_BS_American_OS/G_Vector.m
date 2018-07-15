function g=G_Vector(N,K,S)
g=[];
for i=1:(N+1)
    g(i)=subplus(K-S(i));
end
g=g';