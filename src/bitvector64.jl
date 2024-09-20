function get_bit(n::UInt64, i::T)::Bool where T <: Integer
    return (n >> (i - 1)) & UInt64(1) != 0
end

function Base.getindex(b::BitVector64, i::T)::Bool where T <: Integer
    return get_bit(b.x, i)
end

function set_bit(n::UInt64, x::Bool, i::T)::UInt64 where T <: Integer
    if (n >> (i - 1)) & (x ? UInt64(1) : UInt64(0)) == 0
        n = x ? n | UInt64(1) << (i - 1) : n & ~(UInt64(1) << (i - 1))
    end
    return n
end

function Base.setindex!(b::BitVector64, x::Bool, i::T)::Nothing where T <: Integer
    b.x = set_bit(b.x, x, i)
    return nothing
end

BitVector64() = BitVector64(UInt64(0))

function BitVector64(s::Vector{Int64})::BitVector64
    x = BitVector64()
    for u in s
        setindex!(x, true, u)
    end
    return x
end

function BitVector64(s::Set{Int64})::BitVector64
    return BitVector64(collect(s))
end


(&)(a::BitVector64, b::BitVector64) = BitVector64(a.x & b.x)

(|)(a::BitVector64, b::BitVector64) = BitVector64(a.x | b.x)

(==)(a::BitVector64, b::BitVector64) = (a.x == b.x)

(⊻)(a::BitVector64, b::BitVector64) = BitVector64(a.x ⊻ b.x)

function reset!(a::BitVector64)::BitVector64
    a.x = 0
    return a
end

function set!(a::BitVector64)::BitVector64
    a.x = typemax(UInt64)
    return a
end

function is_subset(n::UInt64, m::UInt64)::Bool
    return n == 0 || (m > 0 && n & m == n)
end

function Base.issubset(a::BitVector64, b::BitVector64)::Bool
    return is_subset(a.x, b.x)
end
function Base.copy!(dst::BitVector64, src::BitVector64)::BitVector64
    dst.x = src.x
    return dst
end
function Base.zero(::Type{BitVector64})::BitVector64
    return BitVector64()
end
function flip!(a::BitVector64)::BitVector64
    a.x = ~a.x
    return a
end
function flip(a::BitVector64)::BitVector64
    return BitVector64(~a.x)
end
