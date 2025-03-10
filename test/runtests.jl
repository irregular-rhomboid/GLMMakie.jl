using GLMMakie
using Test
using GLM
using StableRNGs
using CairoMakie

@testset "GLMMakie.jl" begin
    @testset "Utility functions" begin
        using GLMMakie: leverage, standardized_residuals
        rng = StableRNG(2025)
        X = randn(rng,10,3)
        y = randn(rng,10)
        l = lm(X,y)
        h = leverage(l)
        r = standardized_residuals(l)
        @test all(!isnan, r)
        @test all(>=(0.0), h)
    end
    @testset "Makie Recipes" begin
        rng = StableRNG(2025)
        X = randn(rng, 10, 3)
        y = randn(rng, 10)
        l = lm(X,y)
        @testset "residualplot" begin
            fig, ax, plt = GLMMakie.residualplot(l)
            @test plt isa Makie.Plot
        end
        @testset "residualsleverageplot" begin
            fig, ax, plt = GLMMakie.residualsleverageplot(l)
            @test plt isa Makie.Plot
        end
        @testset "scalelocationplot" begin
            fig, ax, plt = GLMMakie.scalelocationplot(l)
            @test plt isa Makie.Plot
        end
        @testset "qqplot" begin
            fig, ax, plt = CairoMakie.qqplot(l)
            @test plt isa Makie.Plot
        end
        @testset "cooksleverageplot" begin
            fig, ax, plt = GLMMakie.cooksleverageplot(l)
            @test plt isa Makie.Plot
        end
        @testset "lmplot" begin
            fig = GLMMakie.lmplot(l)
            @test fig isa Makie.Figure
        end
    end
end
