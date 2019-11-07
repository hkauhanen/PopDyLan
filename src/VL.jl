"""
Variational Learner (1-parameter)
"""
mutable struct VL
  gamma::Float64 # learning rate
  parprob::Float64 # probability that parameter is on
  age::Int # speaker's age
  plastic::Bool # whether speaker is in the critical period
end


"""
    listen!(x::VL, y::VL, a)

Make learner x listen to learner y with grammatical advantages a.
Learner x's state is (potentially) updated if the learner is plastic.
Learner y's (the speaker) state is not modified.
"""
function listen!(x::VL, y::VL, a)
  if x.plastic
    xpick = rand(Float64)
    ypick = rand(Float64)
    penpick = rand(Float64)
    if xpick < 1 - x.parprob && ypick < 1 - y.parprob
      x.parprob = (1 - x.gamma)*x.parprob
    elseif xpick < x.parprob && ypick < 1 - y.parprob
      if penpick < 1 - a[2]
        x.parprob += x.gamma*(1 - x.parprob)
      else
        x.parprob = (1 - x.gamma)*x.parprob
      end
    elseif xpick < 1 - x.parprob && ypick < y.parprob
      if penpick < 1 - a[1]
        x.parprob = (1 - x.gamma)*x.parprob
      else
        x.parprob += x.gamma*(1 - x.parprob)
      end
    elseif xpick < x.parprob && ypick < y.parprob
      x.parprob += x.gamma*(1 - x.parprob)
    end
  end
end


"""
    getolder!(x::VL)

Increase x's age by one.
"""
function getolder!(x::VL)
  x.age += 1
end
