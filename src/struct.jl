mutable struct BitVector8
    x::UInt8
end

mutable struct BitVector16
    x::UInt16
end

mutable struct BitVector32
    x::UInt32
end

mutable struct BitVector64
    x::UInt64
end

mutable struct BitVector128
    x::UInt128
end

mutable struct BitVector256
    l::BitVector128
    r::BitVector128
end

mutable struct BitVector512
    l::BitVector256
    r::BitVector256
end

mutable struct BitVector1024
    l::BitVector512
    r::BitVector512
end

mutable struct BitVector2048
    l::BitVector1024
    r::BitVector1024
end

mutable struct BitVector4096
    l::BitVector2048
    r::BitVector2048
end