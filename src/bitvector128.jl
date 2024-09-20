function Base.getindex(b::BitVector128, i::T)::Bool where T <: Integer
    return get_bit(b.x, i)
end

function Base.setindex!(b::BitVector128, x::Bool, i::T)::Nothing where T <: Integer
    b.x = set_bit(b.x, x, i)
    return nothing
end

BitVector128() = BitVector128(UInt128(0))

function BitVector128(s::Vector{T})::BitVector128 where T <: Integer
    x = BitVector128()
    for u in s
        setindex!(x, true, u)
    end
    return x
end

function BitVector128(s::Set{T})::BitVector128 where T <: Integer
    return BitVector128(collect(s))
end


(&)(a::BitVector128, b::BitVector128) = BitVector128(a.x & b.x)

(|)(a::BitVector128, b::BitVector128) = BitVector128(a.x | b.x)

(==)(a::BitVector128, b::BitVector128) = (a.x == b.x)

(⊻)(a::BitVector128, b::BitVector128) = BitVector128(a.x ⊻ b.x)

function reset!(a::BitVector128)::BitVector128
    a.x = 0
    return a
end

function set!(a::BitVector128)::BitVector128
    a.x = typemax(UInt128)
    return a
end

function Base.issubset(a::BitVector128, b::BitVector128)::Bool
    return is_subset(a.x, b.x)
end
function Base.copy!(dst::BitVector128, src::BitVector128)::BitVector128
    dst.x = src.x
    return dst
end
function Base.zero(::Type{BitVector128})::BitVector128
    return BitVector128()
end
function flip!(a::BitVector128)::BitVector128
    a.x = ~a.x
    return a
end
function flip(a::BitVector128)::BitVector128
    return BitVector128(~a.x)
end
