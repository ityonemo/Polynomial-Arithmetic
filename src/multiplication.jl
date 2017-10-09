function Base.:*(a::Poly, b::Poly)
    len = a.length + b.length - 1
    shorterPoly = (a.length <= b.length ? a : b)
    longerPoly = (a.length <= b.length ? b : a)
    sLength = shorterPoly.length
    lLength = longerPoly.length
    shorterPoly = copyIntoBigger(shorterPoly,len)
    longerPoly = copyIntoBigger(longerPoly,len)
    out = Poly((len),zeros(Array{Int64}(len,NUMPRIMES)))
    for i = 1:NUMPRIMES
        accum = zeros(Array{Int64}(len,1))
        for j = 1:sLength
            for k = 1:lLength
                accum[j+k-1] += shorterPoly.mods[j,i] * longerPoly.mods[k,i]
            end
        end
        for jj = 1:len
            accum[jj] = accum[jj]%PrimesArray[i]
        end
        out.mods[1:end, i] = accum[1:end]
    end
    return out
end;
