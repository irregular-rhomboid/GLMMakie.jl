using GLMMakie
using Test
using Aqua
using JET

@testset "GLMMakie.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(GLMMakie; ambiguities = false,)
    end
    @testset "Code linting (JET.jl)" begin
        JET.test_package(GLMMakie; target_defined_modules = true)
    end
    # Write your tests here.
end
