function get_bit(n::UInt32, i::T)::Bool where T <: Integer
    return (n >> (i - 1)) & UInt32(1) != 0
end

function Base.getindex(b::BitVector32, i::T)::Bool where T <: Integer
    return get_bit(b.x, i)
end

function set_bit(n::UInt32, x::Bool, i::T)::UInt32 where T <: Integer
    if (n >> (i - 1)) & (x ? UInt32(1) : UInt32(0)) == 0
        n = x ? n | UInt32(1) << (i - 1) : n & ~(UInt32(1) << (i - 1))
    end
    return n
end

function Base.setindex!(b::BitVector32, x::Bool, i::T)::Nothing where T <: Integer
    b.x = set_bit(b.x, x, i)
    return nothing
end

BitVector32() = BitVector32(UInt32(0))

function BitVector32(s::Vector{Int64})::BitVector32
    x = BitVector32()
    for u in s
        setindex!(x, true, u)
    end
    return x
end

function BitVector32(s::Set{Int64})::BitVector32
    return BitVector32(collect(s))
end


(&)(a::BitVector32, b::BitVector32) = BitVector32(a.x & b.x)

(|)(a::BitVector32, b::BitVector32) = BitVector32(a.x | b.x)

(==)(a::BitVector32, b::BitVector32) = (a.x == b.x)

(⊻)(a::BitVector32, b::BitVector32) = BitVector32(a.x ⊻ b.x)

function reset!(a::BitVector32)::BitVector32
    a.x = 0
    return a
end

function set!(a::BitVector32)::BitVector32
    a.x = typemax(UInt32)
    return a
end

function is_subset(n::UInt32, m::UInt32)::Bool
    return n == 0 || (m > 0 && n & m == n)
end

function Base.issubset(a::BitVector32, b::BitVector32)::Bool
    return is_subset(a.x, b.x)
end
function Base.copy!(dst::BitVector32, src::BitVector32)::BitVector32
    dst.x = src.x
    return dst
end
function Base.zero(::Type{BitVector32})::BitVector32
    return BitVector32()
end
function flip!(a::BitVector32)::BitVector32
    a.x = ~a.x
    return a
end
function flip(a::BitVector32)::BitVector32
    return BitVector32(~a.x)
end
