# sources
source("R/packages.R")
source("R/functions.R")
source("R/plan.R")

# make (execute) plan
make(plan, verbose = 2)
# graph
# 
config <- drake_config(plan)
vis_drake_graph(config, targets_only = TRUE)

# all in work environment
loadd()

# look at specific target
readd()
readd()
readd()