#======#
# make #
#======#

#-- clean workspace --#
rm(list = ls())

#-- sources --#  
#on appelle chaque script pour charger les fonctions 
#cela ne les fait pas tourner
source(file.path("R","packages.R"))
source(file.path("R","functions.R"))
source(file.path("R","plan.R"))
source(file.path("manuscrit",)

#-- make (execute) plan --#
make(plan, verbose = 2)

#-- graph --#  pour faire les graphs des dependances (drake)
config <- drake_config(plan)
vis_drake_graph(config, targets_only = TRUE)

# all in work environment
loadd()

# look at specific target
readd()
readd()
readd()