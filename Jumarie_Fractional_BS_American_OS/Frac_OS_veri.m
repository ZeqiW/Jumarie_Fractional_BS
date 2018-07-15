alpha=0.5;
N=1000; M=200;
K=50; T=1; r=0.01; sigma=0.4;
S=[];
for i=1:N+1
    S(i)=100*(i-1)/N;% we set S [0,2K]
end
S=S';
v1=FracAm_Put_OS(alpha, N, M, K, T, r, sigma, S, 2);

M=400;
v2=FracAm_Put_OS(alpha, N, M, K, T, r, sigma, S, 4);

M=800;
v3=FracAm_Put_OS(alpha, N, M, K, T, r, sigma, S, 8);

error1=norm(v1-v2,Inf)
error2=norm(v2-v3,Inf)
time_error_order=log2((norm(v1-v2,Inf))/norm(v2-v3,Inf))
%order:0.1211