function[k1, k2] = q2_computedistortionparams(m_X, m_Y, m_Xd, m_Yd)

% Given the original 'm_X' and 'm_Y' values along with the corresponding distorted values, 'm_Xd' and 'm_Yd' this function will compute the distortion params 'k1' and 'k2'
%
% Input : 
% m_X is a q-by-r matrix containing the distortion-free x coordinates
% m_Y is a q-by-r matrix containing the distortion-free y coordinates
% m_Xd is a q-by-r matrix containing the x coordinates after lens distortion
% m_Yd is a q-by-r matrix containing the y coordinates after lens distortion
%
%
% Output:
% k1 is a scalar, distortion parameter
% k2 is a scalar, distortion parameter
%
m_X = m_X(:);
m_Y = m_Y(:);
m_Xd = m_Xd(:);
m_Yd = m_Yd(:);
r2 = m_X.*m_X + m_Y.*m_Y;
AX = [m_X .* r2 , m_X .* r2 .* r2];
AY = [m_Y .* r2 , m_Y .* r2 .* r2];
A = [AX;AY];
dX = m_Xd - m_X;
dY = m_Yd - m_Y;
d = [dX;dY];
k = A\d;
k1 = k(1);
k2 = k(2);
end
