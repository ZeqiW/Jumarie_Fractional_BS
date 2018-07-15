function v=FracEu_Put_Be(alpha, N, M, K, T, r, sigma, S, i)
k=T/M;
h=(S(N+1)-S(1))/N;
%create a matrix to store value for each time step
val_matrix=zeros(N+1,M+1);
%the first column of the matrix is the option value at maturity time
val_matrix(:,1)=G_Vector(N,K,S);
%use corr to represent rou(alpha,k)
corr=1/(gamma(2-alpha)*(k^alpha));
w1=frac_w(alpha, 1);
%we calculate the parameter of Vj
%para0=frac_para0(alpha,T,k,j,corr,w1,r);
%we calculate the parameter of Vj prime
%para1=frac_para1(alpha,T,k,j,sigma,r);
%we calculate the parameter of Vj double prime
%para2=frac_para2(alpha,sigma);
% if j=1(the first step)
%we find para0,para1,common_mult change when j changes
%para2 does not change when j changes
% if j=2(the second step), then j becomes 2
% we also need to calculate para0, para1 and common_mult again
for j=1:M
    p0=para0(alpha,T,k,j,corr,w1,r);
    p1=para1(alpha,T,k,j,r);
    p2=para2(alpha,sigma);
    common_mult=frac_common(alpha,T,k,j,corr);
    fir_mult=common_mult*(frac_w(alpha, 1));
    sec_mult=0;
    for n=2:j
        sec_mult =sec_mult + frac_w(alpha, n)*(val_matrix(:,j-n+2)-val_matrix(:,j-n+1));
    end
    sec_mult = -common_mult * sec_mult;
    loop_mult=fir_mult * val_matrix(:,j)+sec_mult;
    val_matrix(:,j+1)=fd2_bvpx(N,S(1),S(N+1),p0,p1,p2,0,1,-1,1,0,0,loop_mult);
end
v=val_matrix(:,M+1-i);

%fid = 1;
%pname = 'newpic1.eps';
%figure (fid)
%hold on
%plot(S,val_matrix(:,1));
%plot(S,val_matrix(:,M));
%legend('Maturity', 'Present');
%xlabel('Stock Price S');
%ylabel('Vanilla European Put Option Price');
%print('-f1', '-depsc2', pname);

