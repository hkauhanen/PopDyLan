# Generic population types and methods


"""
Speaker
"""
abstract type Speaker end


"""
    getolder!(x::Speaker)

Increase x's age by one.
"""
function getolder!(x::Speaker)
  x.age += 1
end
