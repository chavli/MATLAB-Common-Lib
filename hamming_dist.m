function [ hdist, hperc ] = hamming_dist( attr1_v, attr2_v )
%HAMMING_DOST calculate the hamming distance of two vectors
    hdist = sum(attr1_v ~= attr2_v);
    hperc = hdist / max(length(attr1_v),length(attr2_v));

end

