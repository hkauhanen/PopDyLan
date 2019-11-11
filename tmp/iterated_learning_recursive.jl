function iteratedVL(parent::VariationalLearner, N::Int)
  child = VariationalLearner(parent.gamma, parent.advantages; age=0, plastic=true)
  for i in 1:N
    listen!(child, parent)
  end
  (child, child.probabilities)
end

speaker = VariationalLearner(0.01, 0.2, 0.1)
setprobabilities!(speaker, [0.1, 0.9])
for gen in 1:10
  global speaker
  global results
  speaker = iteratedVL(speaker, 10_000)[1]
end
