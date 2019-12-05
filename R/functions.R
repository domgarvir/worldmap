##
#this function reads the list of countries from the data folder
read_country_list<-function(){
  folder="data"
  filename="latin_amercia_country_list.csv"
  country_dfli=read_delim(file.path(".",folder,filename), delim="\t")
  

}

#This function calls on IUCN (with a token) and returns the list of species for all te countries
