%OUTPUT:
% omega -> frequency range
% X ->fourier transform
%INPUT:
%x -> signal
%n -> number of current sampling
%Nw -> number of samples

function [X, omega] = my_DTFT(x, n)

% define the range of omega between -pi,pi with Nw samples
% NW = -floor(Nw/2) : 1 : ceil(Nw/2);
% omega = 2*pi * NW / Nw;
%omega = linspace(-pi,pi,Nw);
omega = [0,pi/3, 2/3*pi, 4/3*pi ];

% converting x and omega to rows
if (iscolumn(x))
    x = x.';
end

if (iscolumn(omega))
    omega = omega.';
end

%converting n to column
if(isrow(n))
    n=n.';
end

X = x * exp(-1i*(n*omega)); 
end
