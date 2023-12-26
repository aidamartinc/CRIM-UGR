function [ entropiaAMC ] = entropiaAMC( histograma )
%ENTROPIAAMC Summary of this function goes here
%   Detailed explanation goes here
    prob=histograma./sum(histograma);
    entropiaAMC=-sum(prob(find(prob)).*log2(prob(find(prob))))
end

