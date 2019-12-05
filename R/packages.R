#==========#
# packages #========#        
# groupe de travail #
# dongarvir #=======#
#===========#
F_loadPack<-function()
{
  #-- CRAN packages vector --# Pour les package sur le CRAN
  cran_packages <- c(         # creation d'un vecteur des package que l'on souhaite
    "devtools",           # permet le telechargement des packages sur github
    "parallel",
    "crayon",
    "drake",              # pour le travail en 
    "tidyverse",          # contient ggplot2, dplyr, purrr, forcat, tidyr, readr, 
    "lubridate",          # pour la manipulation des dates
    "fishualize",
    "taxize",
    "rnaturalearth",       # pour importer des donnees naturalistes ou de géométrie des pays
    "rnaturalearthdata",   # pour importer des donnees naturalistes
    "sf",                  # pour gerer les vecteur en carto
    "raster"             # pour gerer les raster en carto
    )
  
  #-- non installed package list (n_i_p) --#
  n_i_p <- cran_packages[!(cran_packages %in% installed.packages())]
  
  #-- n_i_p installation --#
  lapply(n_i_p, install.packages, dependencies = TRUE)
  
  #-- load an attach packages --#
  lapply(cran_packages, require, character.only = TRUE)
  
  #-- Check CRAN packages --#
  if (sum(unlist(lapply(cran_packages, require, character.only = TRUE))) == length(cran_packages))
     {
       cat("\n >>> All packages loaded !\n")
     } else {
             cat("\n >>> Some packages failed to load !\n")
            }
}
