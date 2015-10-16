function C = q1_normalized_correlation( I, template )
%Returns the output of normalized cross correlation between image I and template T
%
%
% INPUT:
% I: [m_I x n_I] matrix
% template: [m_T x n_T] matrix
%
% OUTPUT:
% C: [m_I x n_I] matrix containing the output of normalized cross correlation
%
% HINT:
% use Matlab normxcorr2 function
% be aware of the size of the resulting matrix (see description in HW1
% file)

C = normxcorr2(template,I);
C = C(size(template,1):size(C,1), size(template,2):size(C,2));
end

