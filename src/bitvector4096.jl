function Base.getindex(b::BitVector4096, i::T)::Bool where T <: Integer
    return i <= 2048 ? getindex(b.l, i) : getindex(b.r, i - 2048)
end

function Base.setindex!(b::BitVector4096, x::Bool, i::T)::Nothing where T <: Integer
    if i <= 2048
        setindex!(b.l, x, i)
    else
        setindex!(b.r, x, i - 2048)
    end
    return nothing
end

BitVector4096() = BitVector4096(BitVector2048(), BitVector2048())

function BitVector4096(s::Vector{T})::BitVector4096 where T <: Integer
    x = BitVector4096()
    for u in s
        setindex!(x, true, u)
    end
    return x
end

function BitVector4096(s::Set{T})::BitVector4096 where T <: Integer
    return BitVector4096(collect(s))
end


(&)(a::BitVector4096, b::BitVector4096) = BitVector4096(a.l & b.l, a.r & b.r)

(|)(a::BitVector4096, b::BitVector4096) = BitVector4096(a.l | b.l, a.r | b.r)

(==)(a::BitVector4096, b::BitVector4096) = (a.l == b.l && a.r == b.r)

(⊻)(a::BitVector4096, b::BitVector4096) = BitVector4096(a.l ⊻ b.l, a.r ⊻ b.r)

function reset!(a::BitVector4096)::BitVector4096
    reset!(a.l)
    reset!(a.r)
    return a
end

function set!(a::BitVector4096)::BitVector4096
    set!(a.l)
    set!(a.r)
    return a
end

function Base.issubset(a::BitVector4096, b::BitVector4096)::Bool
    return issubset(a.l, b.l) && issubset(a.r, b.r)
end
function Base.copy!(dst::BitVector4096, src::BitVector4096)::BitVector4096
    copy!(dst.l, src.l)
    copy!(dst.r, src.r)
    return dst
end
function Base.zero(::Type{BitVector4096})::BitVector4096
    return BitVector4096()
end
function flip!(a::BitVector4096)::BitVector4096
    flip!(a.l)
    flip!(a.r)
    return a
end
function flip(a::BitVector4096)::BitVector4096
    return BitVector4096(flip(a.l), flip(a.r))
end
