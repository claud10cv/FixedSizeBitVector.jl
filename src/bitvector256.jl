function Base.getindex(b::BitVector256, i::T)::Bool where T <: Integer
    return i <= 128 ? getindex(b.l, i) : getindex(b.r, i - 128)
end

function Base.setindex!(b::BitVector256, x::Bool, i::T)::Nothing where T <: Integer
    if i <= 128
        setindex!(b.l, x, i)
    else
        setindex!(b.r, x, i - 128)
    end
    return nothing
end

BitVector256() = BitVector256(BitVector128(), BitVector128())

function BitVector256(s::Vector{T})::BitVector256 where T <: Integer
    x = BitVector256()
    for u in s
        setindex!(x, true, u)
    end
    return x
end

function BitVector256(s::Set{T})::BitVector256 where T <: Integer
    return BitVector256(collect(s))
end


(&)(a::BitVector256, b::BitVector256) = BitVector256(a.l & b.l, a.r & b.r)

(|)(a::BitVector256, b::BitVector256) = BitVector256(a.l | b.l, a.r | b.r)

(==)(a::BitVector256, b::BitVector256) = (a.l == b.l && a.r == b.r)

(⊻)(a::BitVector256, b::BitVector256) = BitVector256(a.l ⊻ b.l, a.r ⊻ b.r)

function reset!(a::BitVector256)::BitVector256
    reset!(a.l)
    reset!(a.r)
    return a
end

function set!(a::BitVector256)::BitVector256
    set!(a.l)
    set!(a.r)
    return a
end

function Base.issubset(a::BitVector256, b::BitVector256)::Bool
    return issubset(a.l, b.l) && issubset(a.r, b.r)
end
function Base.copy!(dst::BitVector256, src::BitVector256)::BitVector256
    copy!(dst.l, src.l)
    copy!(dst.r, src.r)
    return dst
end
function Base.zero(::Type{BitVector256})::BitVector256
    return BitVector256()
end
function flip!(a::BitVector256)::BitVector256
    flip!(a.l)
    flip!(a.r)
    return a
end
function flip(a::BitVector256)::BitVector256
    return BitVector256(flip(a.l), flip(a.r))
end
