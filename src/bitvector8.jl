function get_bit(n::UInt8, i::T)::Bool where T <: Integer
    return (n >> (i - 1)) & UInt8(1) != 0
end

function Base.getindex(b::BitVector8, i::T)::Bool where T <: Integer
    return get_bit(b.x, i)
end

function set_bit(n::UInt8, x::Bool, i::T)::UInt8 where T <: Integer
    if (n >> (i - 1)) & (x ? UInt8(1) : UInt8(0)) == 0
        n = x ? n | UInt8(1) << (i - 1) : n & ~(UInt8(1) << (i - 1))
    end
    return n
end

function Base.setindex!(b::BitVector8, x::Bool, i::T)::Nothing where T <: Integer
    b.x = set_bit(b.x, x, i)
    return nothing
end

BitVector8() = BitVector8(UInt8(0))

function BitVector8(s::Vector{Int64})::BitVector8
    x = BitVector8()
    for u in s
        setindex!(x, true, u)
    end
    return x
end

function BitVector8(s::Set{Int64})::BitVector8
    return BitVector8(collect(s))
end


(&)(a::BitVector8, b::BitVector8) = BitVector8(a.x & b.x)

(|)(a::BitVector8, b::BitVector8) = BitVector8(a.x | b.x)

(==)(a::BitVector8, b::BitVector8) = (a.x == b.x)

(⊻)(a::BitVector8, b::BitVector8) = BitVector8(a.x ⊻ b.x)

function reset!(a::BitVector8)::BitVector8
    a.x = 0
    return a
end

function set!(a::BitVector8)::BitVector8
    a.x = typemax(UInt8)
    return a
end

function is_subset(n::UInt8, m::UInt8)::Bool
    return n == 0 || (m > 0 && n & m == n)
end

function Base.issubset(a::BitVector8, b::BitVector8)::Bool
    return is_subset(a.x, b.x)
end
function Base.copy!(dst::BitVector8, src::BitVector8)::BitVector8
    dst.x = src.x
    return dst
end
function Base.zero(::Type{BitVector8})::BitVector8
    return BitVector8()
end
function flip!(a::BitVector8)::BitVector8
    a.x = ~a.x
    return a
end
function flip(a::BitVector8)::BitVector8
    return BitVector8(~a.x)
end
