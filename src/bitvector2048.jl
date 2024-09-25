function Base.getindex(b::BitVector2048, i::T)::Bool where T <: Integer
    return i <= 1024 ? getindex(b.l, i) : getindex(b.r, i - 1024)
end

function Base.setindex!(b::BitVector2048, x::Bool, i::T)::Nothing where T <: Integer
    if i <= 1024
        setindex!(b.l, x, i)
    else
        setindex!(b.r, x, i - 1024)
    end
    return nothing
end

BitVector2048() = BitVector2048(BitVector1024(), BitVector1024())

function BitVector2048(s::Vector{T})::BitVector2048 where T <: Integer
    x = BitVector2048()
    for u in s
        setindex!(x, true, u)
    end
    return x
end

function BitVector2048(s::Set{T})::BitVector2048 where T <: Integer
    return BitVector2048(collect(s))
end


(&)(a::BitVector2048, b::BitVector2048) = BitVector2048(a.l & b.l, a.r & b.r)

(|)(a::BitVector2048, b::BitVector2048) = BitVector2048(a.l | b.l, a.r | b.r)

(==)(a::BitVector2048, b::BitVector2048) = (a.l == b.l && a.r == b.r)

(⊻)(a::BitVector2048, b::BitVector2048) = BitVector2048(a.l ⊻ b.l, a.r ⊻ b.r)

function reset!(a::BitVector2048)::BitVector2048
    reset!(a.l)
    reset!(a.r)
    return a
end

function set!(a::BitVector2048)::BitVector2048
    set!(a.l)
    set!(a.r)
    return a
end

function Base.issubset(a::BitVector2048, b::BitVector2048)::Bool
    return issubset(a.l, b.l) && issubset(a.r, b.r)
end
function Base.copy!(dst::BitVector2048, src::BitVector2048)::BitVector2048
    copy!(dst.l, src.l)
    copy!(dst.r, src.r)
    return dst
end
function Base.zero(::Type{BitVector2048})::BitVector2048
    return BitVector2048()
end
function flip!(a::BitVector2048)::BitVector2048
    flip!(a.l)
    flip!(a.r)
    return a
end
function flip(a::BitVector2048)::BitVector2048
    return BitVector2048(flip(a.l), flip(a.r))
end
