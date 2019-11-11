parent = VariationalLearner(0.01, 0.2, 0.1; age=30, plastic=false)
setprobabilities!(parent, [0.1, 0.9])
for gen in 1:10
  global parent
  child = VariationalLearner(0.01, 0.2, 0.1; age=0, plastic=true)
  for i in 1:10_000
    listen!(child, parent)
  end
  parent = child
end
