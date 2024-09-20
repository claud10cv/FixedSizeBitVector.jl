function Base.getindex(b::BitVector1024, i::T)::Bool where T <: Integer
    return i <= 512 ? getindex(b.l, i) : getindex(b.r, i - 512)
end

function Base.setindex!(b::BitVector1024, x::Bool, i::T)::Nothing where T <: Integer
    if i <= 512
        setindex!(b.l, x, i)
    else
        setindex!(b.r, x, i - 512)
    end
    return nothing
end

BitVector1024() = BitVector1024(BitVector512(), BitVector512())

function BitVector1024(s::Vector{T})::BitVector1024 where T <: Integer
    x = BitVector1024()
    for u in s
        setindex!(x, true, u)
    end
    return x
end

function BitVector1024(s::Set{T})::BitVector1024 where T <: Integer
    return BitVector1024(collect(s))
end


(&)(a::BitVector1024, b::BitVector1024) = BitVector1024(a.l & b.l, a.r & b.r)

(|)(a::BitVector1024, b::BitVector1024) = BitVector1024(a.l | b.l, a.r | b.r)

(==)(a::BitVector1024, b::BitVector1024) = (a.l == b.l && a.r == b.r)

(⊻)(a::BitVector1024, b::BitVector1024) = BitVector1024(a.l ⊻ b.l, a.r ⊻ b.r)

function reset!(a::BitVector1024)::BitVector1024
    reset!(a.l)
    reset!(a.r)
    return a
end

function set!(a::BitVector1024)::BitVector1024
    set!(a.l)
    set!(a.r)
    return a
end

function Base.issubset(a::BitVector1024, b::BitVector1024)::Bool
    return issubset(a.l, b.l) && issubset(a.r, b.r)
end
function Base.copy!(dst::BitVector1024, src::BitVector1024)::BitVector1024
    copy!(dst.l, src.l)
    copy!(dst.r, src.r)
    return dst
end
function Base.zero(::Type{BitVector1024})::BitVector1024
    return BitVector1024()
end
function flip!(a::BitVector1024)::BitVector1024
    flip!(a.l)
    flip!(a.r)
    return a
end
function flip(a::BitVector1024)::BitVector1024
    return BitVector1024(flip(a.l), flip(a.r))
end
