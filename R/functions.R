##
#this function reads the list of countries from the data folder
read_country_list<-function(){
  folder="data"
  filename="latin_amercia_country_list.csv"
  country_df=read_delim(file.path(".",folder,filename), delim=", ")
  
}

