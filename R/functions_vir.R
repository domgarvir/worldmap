#This function calls on IUCN (with a token) and returns the list of species for all te countries
get_species_list<- function(country_list){
  #define the token
  #Sys.setenv(IUCN_KEY="9bb4facb6d23f48efbf424bb05c0c1ef1cf6f468393bc745d42179ac4aca5fee")
  iucn_token="9bb4facb6d23f48efbf424bb05c0c1ef1cf6f468393bc745d42179ac4aca5fee"
  #IUCN API url
  api_url    <- "https://apiv3.iucnredlist.org/api/v3/"
  
  #general query: we ask for the species list in each country
  query      <- "country/getspecies/"
  
  tab_prov<-tibble(taxontaid=NA,scientific_name=NA,  subspecies=NA, rank=NA, subpopulation=NA, category=NA, country=NA, Nesp=NA)
  for (country in country_list)
  
  {
    request <- 
      paste0(
      api_url,
      query,
      country,
      "?token=",
      iucn_token
    )
    print(request)
    response <- httr::GET(request)
    httr::http_status(response)
    datas <- httr::content(response, as = "text")
    results <- jsonlite::fromJSON(datas)
    tab_result<-results$result
    tab_result<-mutate(tab_result,country=results$country,Nesp=results$count)
    tab_prov<-bind_rows(tab_prov,tab_result)
    Sys.sleep(1) #
  }#end for countries
  
  tab_results<-tab_prov[-c(1),]
}
