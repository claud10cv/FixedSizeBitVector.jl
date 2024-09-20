module FixedSizeBitVector
    import Base.getindex
    import Base.setindex!
    import Base.copy!
    import Base.&
    import Base.|
    import Base.==
    import Base.⊻
    import Base.empty!
    import Base.issubset
    import Base.~

    include("struct.jl")
    include("common.jl")
    include("bitvector8.jl")
    include("bitvector16.jl")
    include("bitvector32.jl")
    include("bitvector64.jl")
    include("bitvector128.jl")
    include("bitvector256.jl")
    include("bitvector512.jl")
    include("bitvector1024.jl")
    include("bitvector2048.jl")
    include("bitvector4096.jl")

    export issubset, (==), (⊻), (&), (|), set!, reset!, flip!, flip, zero
    export BitVector8, BitVector16, BitVector32, BitVector64, BitVector128, BitVector256, BitVector512, BitVector1024, BitVector2048, BitVector4096
end # module FixedSizeBitVector