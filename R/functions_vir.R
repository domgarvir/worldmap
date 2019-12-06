#This function calls on IUCN (with a token) and returns the list of species for all te countries
get_species_list<- function(country_list){
  
  #define the token
  #Sys.setenv(IUCN_KEY="9bb4facb6d23f48efbf424bb05c0c1ef1cf6f468393bc745d42179ac4aca5fee")
  iucn_token="9bb4facb6d23f48efbf424bb05c0c1ef1cf6f468393bc745d42179ac4aca5fee"
  #IUCN API url
  api_url    <- "https://apiv3.iucnredlist.org/api/v3/"
  
  #general query: we ask for the species list in each country
  query      <- "country/getspecies/"
  
  tab_prov<-tibble(taxonid=NA,scientific_name=NA,  subspecies=NA, rank=NA, subpopulation=NA, category=NA, country=NA, Nesp=NA)
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
    #we can try to improve this with %>% 
    datas <- httr::content(response, as = "text")
    results <- jsonlite::fromJSON(datas)
    tab_result<-results$result
    tab_result<-mutate(tab_result,country=results$country,Nesp=results$count)
    tab_prov<-bind_rows(tab_prov,tab_result)
    Sys.sleep(1) #
  }#end for countries
  
  tab_results<-tab_prov[-c(1),]
  return(tab_results)
}

save_species_list<- function(species_df){
  folder="data"
  filename="species_by_country.csv"
  write_csv(species_df, file.path(".",folder,filename))
}

get_species_by_country_and_status<- function(species_df)
{
  species_df %>% count(country, category) -> result
  return(result)
}

#this function takes an species_df and countries and returns the map with countries colored by the number of species in the selected category
get_category_map<-function(species_cat,countries_sf)
{
  categories_n<-pivot_wider(species_cat, names_from = category, values_from = n, values_fill = list(n = 0))
  countries_sf <- countries_sf %>% rename(country = iso_a2)
  jdd_sf<-right_join(countries_sf,categories_n)
  
  ggplot(jdd_sf)+
    geom_sf(aes(fill=CR))+
    scale_fill_gradient(low="white",high="red")+
    theme_void()
  
}
