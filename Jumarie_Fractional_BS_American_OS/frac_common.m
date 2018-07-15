function p=frac_common(alpha,T,k,j,corr)
p=((T-k*j)^(1-alpha))*corr/((k*j)^(1-alpha));