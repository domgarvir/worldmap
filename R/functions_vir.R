#This function calls on IUCN (with a token) and returns the list of species for all te countries
get_species_list<- function(country_list){
  #define the token
  #Sys.setenv(IUCN_KEY="9bb4facb6d23f48efbf424bb05c0c1ef1cf6f468393bc745d42179ac4aca5fee")
  iucn_token="9bb4facb6d23f48efbf424bb05c0c1ef1cf6f468393bc745d42179ac4aca5fee"
  #IUCN API url
  api_url    <- "https://apiv3.iucnredlist.org/api/v3/"
  #general query: we ask for the species list in each country
  query      <- "country/getspecies/"
  
  for (country in country_list){
    request <- 
      paste0(
      api_url,
      query,
      country,
      "?token=",
      iucn_token
    )
    print(request)
    #response <- httr::GET(request)
   
    Sys.sleep(1) #
  }#end for countries
  
}
