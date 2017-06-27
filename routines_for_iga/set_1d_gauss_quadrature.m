%--------------------------------------------------------------------------
%  Author: Isaac J. Lee (ijlee2@ices.utexas.edu)
%  
%  
%  Summary:
%  
%  This routine returns the 1D Gauss quadrature points and weights for the
%  domain [a, b].
%  
%  
%  Instructions:
%  
%  Type the following onto Matlab's command window or in a code,
%  
%      [z, w] = set_1d_gauss_quadrature(a, b, q);
%  
%  where,
%  
%      a is the left endpoint
%      b is the right endpoint
%      q is the number of quadrature points (degree of the quadrature)
%  
%  
%  Outputs:
%  
%  1. An array of Gauss points (in increasing nodal order)
%  
%  2. An array of Gauss weights
%--------------------------------------------------------------------------
function [z, w] = set_1d_gauss_quadrature(a, b, q)
    % Find the quadrature rule for the interval [-1, 1]
    switch q
        case 1
            z = 0;
            w = 2;
            
        case 2
            z = [-sqrt(3)/3;  sqrt(3)/3];
            w = [         1;          1];
            
        case 3
            z = [-sqrt(3/5);         0; sqrt(3/5)];
            w = [       5/9;       8/9;       5/9];
            
        case 4
            z = [-sqrt((3 + 2*sqrt(6/5))/7); -sqrt((3 - 2*sqrt(6/5))/7);  sqrt((3 - 2*sqrt(6/5))/7);  sqrt((3 + 2*sqrt(6/5))/7)];
            w = [        (18 - sqrt(30))/36;         (18 + sqrt(30))/36;         (18 + sqrt(30))/36;         (18 - sqrt(30))/36];
            
        case 5
            z = [-sqrt(5 + 2*sqrt(10/7))/3; -sqrt(5 - 2*sqrt(10/7))/3;         0;  sqrt(5 - 2*sqrt(10/7))/3;  sqrt(5 + 2*sqrt(10/7))/3];
            w = [  (322 - 13*sqrt(70))/900;   (322 + 13*sqrt(70))/900;   128/225;   (322 + 13*sqrt(70))/900;   (322 - 13*sqrt(70))/900];
            
        case 6
            z = [-0.9324695142031521; -0.6612093864662645; -0.2386191860831969;  0.2386191860831969;  0.6612093864662645;  0.9324695142031521];
            w = [ 0.1713244923791704;  0.3607615730481386;  0.4679139345726910;  0.4679139345726910;  0.3607615730481386;  0.1713244923791704];
            
        case 7
            z = [-0.9491079123427585; -0.7415311855993945; -0.4058451513773972;                   0;  0.4058451513773972;  0.7415311855993945;  0.9491079123427585];
            w = [ 0.1294849661688697;  0.2797053914892766;  0.3818300505051189;  0.4179591836734694;  0.3818300505051189;  0.2797053914892766;  0.1294849661688697];
            
        case 8
            z = [-0.9602898564975363; -0.7966664774136267; -0.5255324099163290; -0.1834346424956498;  0.1834346424956498;  0.5255324099163290;  0.7966664774136267;  0.9602898564975363];
            w = [ 0.1012285362903763;  0.2223810344533745;  0.3137066458778873;  0.3626837833783620;  0.3626837833783620;  0.3137066458778873;  0.2223810344533745;  0.1012285362903763];
            
        case 9
            z = [-0.9681602395076261; -0.8360311073266358; -0.6133714327005904; -0.3242534234038089;                   0;  0.3242534234038089;  0.6133714327005904;  0.8360311073266358;  0.9681602395076261];
            w = [ 0.0812743883615744;  0.1806481606948574;  0.2606106964029354;  0.3123470770400029;  0.3302393550012598;  0.3123470770400029;  0.2606106964029354;  0.1806481606948574;  0.0812743883615744];
            
        case 10
            z = [-0.9739065285171717; -0.8650633666889845; -0.6794095682990244; -0.4333953941292472; -0.1488743389816312;  0.1488743389816312;  0.4333953941292472;  0.6794095682990244;  0.8650633666889845;  0.9739065285171717];
            w = [ 0.0666713443086881;  0.1494513491505806;  0.2190863625159820;  0.2692667193099963;  0.2955242247147529;  0.2955242247147529;  0.2692667193099963;  0.2190863625159820;  0.1494513491505806;  0.0666713443086881];
            
        otherwise
            fprintf('ERROR: An invalid degree has been specified for the Gaussian quadrature.\n\n');
            
            quit;
            
    end
    
    % Change the quadrature rule to the interval [a, b]
    z = (b - a)/2 * z + (a + b)/2;
    w = (b - a)/2 * w;
end
