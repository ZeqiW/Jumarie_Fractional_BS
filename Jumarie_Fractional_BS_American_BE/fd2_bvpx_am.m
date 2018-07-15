% Solve the following equation:
% alpha u + beta x*u' + gamma x*x*u'' = f, (a,b)
% alpha1 u + beta1 u' = gamma1, at x=a
% alpha2 u + beta2 u' = gamma2, at x=b


function u = fd2_bvpx_am(n,a,b,alpha,beta,gamma,alpha1,beta1,gamma1,alpha2,beta2,gamma2,f,g)
h = (b-a)/n;
x = [a:h:b]';

% Form the matrix A
A = zeros(n+1,n+1); 
A(1,:) = [2*h*alpha1-3*beta1 4*beta1 -beta1 zeros(1,n-2)];
A(n+1,:) = [zeros(1,n-2) -beta2 4*beta2 -(2*h*alpha2+3*beta2)];
for i = 2:n    
    A(i,i-1) = -(beta*h*x(i)-2*gamma*x(i)*x(i));
    A(i,i) = 2*h*h*alpha-4*gamma*x(i)*x(i);
    A(i,i+1) = beta*h*x(i)+2*gamma*x(i)*x(i);
end

% Form the right-hand-side vector f
f = 2*h*h*f;
f(1) = 2*h*gamma1;
f(n+1) = -2*h*gamma2;

% Solve the linear system
[L, U, P] = lu(A);
f=P*f;
u=solGauLu_am(L,U,f,g);

