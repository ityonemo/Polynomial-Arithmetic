module PolynomialArithmetic

# package code goes here


NUMPRIMES = 3;

PrimesList = [19, 17, 13, 11, 7, 5, 3];

PrimesArray = PrimesList[1:NUMPRIMES];

struct Poly
    length::Int64
    mods::Array{Int64,2}
end;

function copyIntoBigger(a,len)
    out = Poly(len, zeros(Array{Int64}(len,NUMPRIMES)))
    for i = 1:NUMPRIMES
        for j = 1:a.length
            out.mods[j,i] = a.mods[j,i]
        end
    end
    return out
end;

function getMods(a)
    out = Poly(length(a), zeros(Array{Int64}(length(a),NUMPRIMES)))
    for i = 1:NUMPRIMES
        for j = 1:length(a)
            out.mods[j,i] = a[j]%PrimesArray[i]
        end
    end
    return out
end;

function addPolys(a,b)
    if (a.length>b.length)
        len = a.length
        b = copyIntoBigger(b,len)
    elseif (a.length<b.length)
        len = b.length
        a = copyIntoBigger(a,len)
    else
        len = a.length
    end
    out = Poly((len),zeros(Array{Int64}(len,NUMPRIMES)))
    for i = 1:NUMPRIMES
        for j = 1:len
            out.mods[j,i]=(a.mods[j,i]+b.mods[j,i])%PrimesArray[i]
        end
    end
    return out
end;

include("polynomialio.jl")
include("multiplication.jl")

function scalarMultPoly(a,scalar)
    out = Poly(a.length, zeros(Array{Int64}(a.length,NUMPRIMES)))
    for i = 1:NUMPRIMES
        for j = 1:a.length
            out.mods[j,i] = (a.mods[j,i]*scalar)%PrimesArray[i]
        end
    end
    return out
end;

one = [1,15];

two = [1,2];

oneM = getMods(one);

twoM = getMods(two);

threeM = addPolys(oneM,twoM);

fourM = scalarMultPoly(oneM,6);

fiveM = multiplyPolys(oneM,twoM);


end # module
