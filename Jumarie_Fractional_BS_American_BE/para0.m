function p=para0(alpha,T,k,j,corr,w1,r)
p=((T-k*j)^(1-alpha))*((corr*w1/((k*j)^(1-alpha)))+r/gamma(2-alpha));