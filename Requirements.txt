Requirements Document
---------------------
---------------------
1. Global Variables

    NUMPRIMES
    a. An integer value of how many primes used in the calculations.
        (Higher number of primes means the program can solve problems with large intermediate values).
        
    PrimesArray
    a. A set of primes that can be selected from given the value of NUMPRIMES.
    b. Make sure that NUMPRIMES is less than or equal to the length of PrimesArray.
    
    
---------------------
---------------------
2. Structures

    Poly
    a. length::Int64
    b. mods::Array{Int64,2}
    
    
---------------------    
---------------------
3. Functions

    getMods
    a. Takes in a Poly_m and a primes array
    b. Gets the remainder of every value with respect to the prime associated with the row each number is in.
    c. Replaces the values of the Poly_m.members imported.

    addPolys
    a. Takes in two Poly_m variables and a primes array.
    b. Creates a new Poly_m to store data into with length based on the other two lengths.
    c. Adds all of the values corresponding to each cell together.
        (Be careful adding polynomials of different lengths).
    d. Gets the remainder of every value with respect to the correct primes.
    e. Returns the new Poly_m.
    
    scalarMultPoly
    a. Takes in a Poly_m, a scalar, and a primes array.
    b. Creates a new Poly_m with the same length as the Poly_m brought in.
    c. Multiplies all of the values by the scalar and puts them into the new Poly_m.
    d. Gets the remainder of every value with respect to the correct primes.
    e. Returns the new Poly_m.
    
    multiplyPolys
    a. Takes in two Poly_m variables and a primes array.
    b. Creates a new Poly_m with length = a.length + b.length -1.
    c. 
    
---------------------    
---------------------
4. 