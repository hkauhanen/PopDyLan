# Generic population types and methods


"""
Speaker
"""
abstract type Speaker end


"""
A `Community` is a collection of [`Speaker`](@ref)s; technically, a `Dict` whose values are [`Speaker`](@ref)s, with integer keys. A `Community` is empty when initialized; see [`inject!`](@ref) and [`eject!`](@ref).
"""
mutable struct Community
  people::Dict{Int,Speaker}
  running_index::Int

  # constructor
  Community() = new(Dict{Int,Speaker}(), 0)
end


"""
    inject!(x::Speaker, y::Community)

Add a [`Speaker`](@ref) to a [`Community`](@ref).
"""
function inject!(x::T, y::Community) where {T <: Speaker}
  y.running_index += 1
  get!(y.people, y.running_index, x)
end


"""
    eject!(x::Int, y::Community)

Remove a [`Speaker`](@ref) with ID `x` from a [`Community`](@ref).
"""
function eject!(x::Int, y::Community)
  delete!(y.people, x)
  # FIXME need also to delete x from the friends lists of all other speakers
end


"""
    getolder!(x::Speaker)

Increase `x`'s age by one.
"""
function getolder!(x::Speaker)
  x.age += 1
end


"""
    getolder!(x::Community)

Increase the age of everyone in `x` by one.
"""
function getolder!(x::Community)
  for y in values(x.people)
    y.age += 1
  end
end
