using FixedSizeBitVector
using Test

primitive = [BitVector8,
            BitVector16,
            BitVector32,
            BitVector64,
            BitVector128]

composite = [BitVector256,
            BitVector512,
            BitVector1024,
            BitVector2048,
            BitVector4096]

parent = [BitVector128,
            BitVector256,
            BitVector512,
            BitVector1024,
            BitVector2048]



@testset "Constructors" begin
    for T in primitive
        @test T().x == 0
    end
    for (i, T) in enumerate(composite)
        bs = T()
        @test bs.l == bs.r == parent[i]()
    end
end

@testset "Setters" begin
    for T in union(primitive, composite)
        bs = T()
        bs[1] = true
        @test bs == T([1]) == T(Set([1]))
    end
end

@testset "Getters" begin
    for T in union(primitive, composite)
        bs = T([1, 3, 5, 7])
        @test bs[1] == bs[3] == bs[5] == bs[7] == true && bs[2] == bs[4] == bs[6] == bs[8] == false
    end
end

@testset "Flip" begin
    for T in union(primitive, composite)
        bs = T([1, 3, 5, 7])
        f = flip(bs)
        @test flip!(bs) == f && f[2] == f[4] == f[6] == f[8] == true && f[1] == f[3] == f[5] == f[7] == false
    end
end

@testset "Reset" begin
    for T in union(primitive, composite)
        bs = T([1, 3, 5, 7])
        @test reset!(bs) == T()
    end
end

@testset "IsSubset" begin
    for T in union(primitive, composite)
        x = T([1, 3, 5])
        y = T([1, 3, 5, 7])
        z = T([3, 5, 7])
        @test issubset(x, y) && issubset(z, y) && !issubset(x, z) && !issubset(z, x)
    end
end

@testset "Bitwise OR" begin
    for T in union(primitive, composite)
        x = T([2, 4, 6])
        y = T([1, 3, 5, 7])
        z = T(collect(1:7))
        @test x | y == z
    end
end

@testset "Bitwise AND" begin
    for T in union(primitive, composite)
        x = T([2, 4, 6, 8])
        y = T([2, 4, 6])
        z = T(collect(1:7))
        @test z & x == y
    end
end

@testset "Bitwise XOR" begin
    for T in union(primitive, composite)
        x = T([2, 4, 6, 8])
        y = T([1, 3, 5, 7])
        z = T(collect(1:8))
        @test x ⊻ y == z
    end
end
