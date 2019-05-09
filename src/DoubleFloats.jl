"""
    DoubleFloats

A package for extended precision floating point math.

exported types: `Double64`, `Double32`, `Double16`
                `ComplexDF64`, `ComplexDF32`, `ComplexDF16`
"""
module DoubleFloats

abstract type MultipartFloat <: AbstractFloat end

export DoubleFloat,
       Double64, Double32, Double16,
       ComplexDF64, ComplexDF32, ComplexDF16,
       ComplexD64, ComplexD32, ComplexD16,   # Deprecated
       @d64_str, @d32_str, @d16_str,         # Deprecated
       @df64_str, @df32_str, @df16_str,      # Current Use
       MultipartFloat, HI, LO, HILO,
       stringtyped, showtyped, showall,
       isnonzero, ispositive, isnegative, isnonpositive, isnonnegative,
       isposinf, isneginf, isfractional, isnormal, issquare,
       nan, inf, posinf, neginf,
       ulp,
       intpart, fracpart, fmod,
       square, cube,
       add2, sub2, mul2, div2,
       ⊕, ⊖, ⊗, ⊘,
       spread, sld, tld,
       signs,
       randpm,
       tanpi,
       agm, agm1, elliptick,
       matrixfunction

using Base.MathConstants: pi, golden, ℯ, eulergamma, catalan

using Random
import Random.rand

using Polynomials
using GenericSVD, GenericSchur, LinearAlgebra

# using LinearAlgebra
import Base: hash, promote_type, promote_rule, convert,
             string, show, parse, tryparse, eltype,
             signbit, sign, abs, flipsign, copysign,
             significand, exponent, precision, widen,
             (+), (-), (*), (/), (\), (^), inv, sqrt, cbrt,
             (==), (!=), (<), (<=), (>=), (>), isequal, isless,
             IEEEFloat, iszero, isone, isinf, isnan, isinf, isfinite, issubnormal,
             isinteger, isodd, iseven, zero, one,
             typemax, typemin, floatmax, floatmin, maxintfloat,
             min, max, minmax, minimum, maximum,
             floor, ceil, trunc, round, div, fld, cld,
             rem, mod, rem2pi, mod2pi, divrem, fldmod
             sqrt, cbrt,
             BigFloat, BigInt,
             Int8, Int16, Int32, Int64, Int128,
             Float64, Float32, Float16

import Base.Math: frexp, ldexp, eps, nextfloat, prevfloat, modf, fma, muladd,
             hypot,
             log, log1p, log2, log10, exp, expm1, exp2, exp10,
             sin, cos, tan, csc, sec, cot, sincos, sinpi, cospi,
             asin, acos, atan, acsc, asec, acot,
             sinh, cosh, tanh, csch, sech, coth,
             asinh, acosh, atanh, acsch, asech, acoth


import LinearAlgebra: mul!

using Random

include("Double.jl")   # Double64, Double32, Double16

include("math/errorfree.jl")
include("math/leasterror.jl")

include("doubletriple/double.jl")
include("doubletriple/double_consts.jl")
include("doubletriple/triple.jl")
include("doubletriple/triple_consts.jl")
include("doubletriple/triple_pi.jl")

include("type/constructors.jl")
include("type/promote.jl")
include("type/convert.jl")
include("type/compare.jl")
include("type/predicates.jl")
include("type/specialvalues.jl")
include("type/string.jl")
include("type/show.jl")
include("type/parse.jl")


include("math/prearith/prearith.jl")
include("math/prearith/floorceiltrunc.jl")
include("math/prearith/divrem.jl")

include("math/arithmetic/fma.jl")
include("math/arithmetic/modpi.jl")
include("math/arithmetic/normalize_hypot.jl")
include("math/arithmetic/mixedarith.jl")
include("math/ops.jl")

#include("math/arithmetic/complex/division.jl")
include("math/special/agm.jl")
include("math/special/elliptic.jl")

include("math/elementary/sequences.jl")
include("math/elementary/explog.jl")
include("math/elementary/trig.jl")
include("math/elementary/arctrig.jl")
include("math/elementary/hyptrig.jl")
include("math/elementary/archyptrig.jl")
include("math/elementary/templated.jl")
include("math/elementary/complex.jl")

include("math/linearalgebra/matmul.jl")
include("math/linearalgebra/support.jl")
include("math/linearalgebra/matrixfunction.jl")

include("extras/random.jl")
include("extras/misc.jl")


end # module DoubleFloats