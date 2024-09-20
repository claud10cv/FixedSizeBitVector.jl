function get_bit(n::UInt16, i::T)::Bool where T <: Integer
    return (n >> (i - 1)) & UInt16(1) != 0
end

function Base.getindex(b::BitVector16, i::T)::Bool where T <: Integer
    return get_bit(b.x, i)
end

function set_bit(n::UInt16, x::Bool, i::T)::UInt16 where T <: Integer
    if (n >> (i - 1)) & (x ? UInt16(1) : UInt16(0)) == 0
        n = x ? n | UInt16(1) << (i - 1) : n & ~(UInt16(1) << (i - 1))
    end
    return n
end

function Base.setindex!(b::BitVector16, x::Bool, i::T)::Nothing where T <: Integer
    b.x = set_bit(b.x, x, i)
    return nothing
end

BitVector16() = BitVector16(UInt16(0))

function BitVector16(s::Vector{Int64})::BitVector16
    x = BitVector16()
    for u in s
        setindex!(x, true, u)
    end
    return x
end

function BitVector16(s::Set{Int64})::BitVector16
    return BitVector16(collect(s))
end


(&)(a::BitVector16, b::BitVector16) = BitVector16(a.x & b.x)

(|)(a::BitVector16, b::BitVector16) = BitVector16(a.x | b.x)

(==)(a::BitVector16, b::BitVector16) = (a.x == b.x)

(⊻)(a::BitVector16, b::BitVector16) = BitVector16(a.x ⊻ b.x)

function reset!(a::BitVector16)::BitVector16
    a.x = 0
    return a
end

function set!(a::BitVector16)::BitVector16
    a.x = typemax(UInt16)
    return a
end

function is_subset(n::UInt16, m::UInt16)::Bool
    return n == 0 || (m > 0 && n & m == n)
end

function Base.issubset(a::BitVector16, b::BitVector16)::Bool
    return is_subset(a.x, b.x)
end
function Base.copy!(dst::BitVector16, src::BitVector16)::BitVector16
    dst.x = src.x
    return dst
end
function Base.zero(::Type{BitVector16})::BitVector16
    return BitVector16()
end
function flip!(a::BitVector16)::BitVector16
    a.x = ~a.x
    return a
end
function flip(a::BitVector16)::BitVector16
    return BitVector16(~a.x)
end
