function Base.getindex(b::BitVector512, i::T)::Bool where T <: Integer
    return i <= 256 ? getindex(b.l, i) : getindex(b.r, i - 256)
end

function Base.setindex!(b::BitVector512, x::Bool, i::T)::Nothing where T <: Integer
    if i <= 256
        setindex!(b.l, x, i)
    else
        setindex!(b.r, x, i - 256)
    end
    return nothing
end

BitVector512() = BitVector512(BitVector256(), BitVector256())

function BitVector512(s::Vector{T})::BitVector512 where T <: Integer
    x = BitVector512()
    for u in s
        setindex!(x, true, u)
    end
    return x
end

function BitVector512(s::Set{T})::BitVector512 where T <: Integer
    return BitVector512(collect(s))
end


(&)(a::BitVector512, b::BitVector512) = BitVector512(a.l & b.l, a.r & b.r)

(|)(a::BitVector512, b::BitVector512) = BitVector512(a.l | b.l, a.r | b.r)

(==)(a::BitVector512, b::BitVector512) = (a.l == b.l && a.r == b.r)

(⊻)(a::BitVector512, b::BitVector512) = BitVector512(a.l ⊻ b.l, a.r ⊻ b.r)

function reset!(a::BitVector512)::BitVector512
    reset!(a.l)
    reset!(a.r)
    return a
end

function set!(a::BitVector512)::BitVector512
    set!(a.l)
    set!(a.r)
    return a
end

function Base.issubset(a::BitVector512, b::BitVector512)::Bool
    return issubset(a.l, b.l) && issubset(a.r, b.r)
end
function Base.copy!(dst::BitVector512, src::BitVector512)::BitVector512
    copy!(dst.l, src.l)
    copy!(dst.r, src.r)
    return dst
end
function Base.zero(::Type{BitVector512})::BitVector512
    return BitVector512()
end
function flip!(a::BitVector512)::BitVector512
    flip!(a.l)
    flip!(a.r)
    return a
end
function flip(a::BitVector512)::BitVector512
    return BitVector512(flip(a.l), flip(a.r))
end
