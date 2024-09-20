# FixedSizeBitVector.jl
Fixed-size bit vectors in Julia. Their use may be convenient if it their size is known at compile-time

## Installation
From a Package REPL execute
```julia
(v1.11)> add FixedSizeBitVector
```

## Definitions
This package exports structs `BitVectorX`, where `X = 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096`. It exports several bitset methods. Here we exemplify them using `BitVector8`:
```julia
x = BitVector8([2, 3]) # Constructs a BV from an array of integers. Also works with Set{Int64}
y = BitVector8() # Default constructor, initializes the bitvector as 0
z = x | y # Bitwise OR
w = x & y # Bitwise AND
t = x ⊻ z # Bitwise XOR
v = flip(t) # Flips the bits, returns a new BitVector
flip!(v) # Flips the bits, in-place
set!(v) # Sets the bits all to true, in-place
reset!(v) # Sets the bits all to false, in-place
issubset(t, v) # Returns true if t ⊆ v
x[3] # Returns true if the bit at position 3 is set, false otherwise
x[3] = false # Sets the third bit to false
t = zero(BitVector8) # Equivalent to BitVector8()
```
