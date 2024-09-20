######################################## 128 bits ##########################################
function get_bit(n::UInt128, i::Int64)::Bool
    return (n >> (i - 1)) & UInt128(1) != 0
end

function set_bit(n::UInt128, x::Bool, i::Int64)::UInt128
    if (n >> (i - 1)) & (x ? 1 : 0) == 0
        n = x ? n | UInt128(1) << (i - 1) : n & ~(UInt128(1) << (i - 1))
    end
    return n
end

function is_subset(n::UInt128, m::UInt128)::Bool
    return n == 0 || (m > 0 && n & m == n)
end
###########################################################################################

