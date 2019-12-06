#======#
# make #
#======#

#-- clean workspace --#
rm(list = ls())

#-- sources --#  
#on appelle chaque script pour charger les fonctions 
#cela ne les fait pas tourner
source(file.path("R","packages.R"))
source(file.path("R","functions_guillaume.R"))
source(file.path("R","functions_vir.R"))
source(file.path("R","plan.R"))

#-- make (execute) plan --#
make(plan, verbose = 2)

#-- graph --#  pour faire les graphs des dependances (drake)
config <- drake_config(plan)
vis_drake_graph(config, targets_only = TRUE, file = file.path("manuscrit","output","drake_plot.png"))

#-- all in work environment --#
#loadd()

#-- look at specific target --#

readd(carto)
readd(carto2)


#-- presentation --#
  presentation = rmarkdown::render(
    knitr_in("presentation.Rmd"),
    output_file = file_out("presentation.html"),
    quiet = FALSE,
    encoding = "UTF-8")
  
  