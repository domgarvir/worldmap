
#
## Fonctions écrites initialement par Guillaume Body
#
## Objectif: cartographies


# Function to download country shapes, which include the key to connect uicn list

countries_select<-function(continent='south america'){

sf_southa<-ne_countries(scale=50,type="countries",continent=continent,returnclass='sf')
sf_2<-sf_southa %>%
  dplyr::select(
    iso_a2,
    name,
    abbrev,
    geometry)
}


countries_centroid<-function(countries){
sf_countries<-countries %>%
  sf::st_transform(crs=4318) %>%
  dplyr::mutate(
    centroid = sf::st_centroid(geometry)
  )
}



  
carto_uicn<-function(jdd,countries){

  class_uicn<-jdd %>%
    dplyr::filter(category != "LR/cd" & category != "LR/lc", category != "LR/nt") %>%
    dplyr::select(category) %>%
    unique() %>%
    pull()
    
  jdd2<-tidyr::pivot_wider(jdd, names_from = category, values_from = n, values_fill = list(n=0))

  jdd_sf<-right_join(countries,jdd2,by=c("iso_a2"="country"))
  
  jdd_df<-jdd_sf %>%
    mutate(long=st_coordinates(centroid)[,1],
           lat=st_coordinates(centroid)[,2]) %>%
    dplyr::select(-geometry,-centroid) %>%
    as.data.frame()
  
 jdd_df<-jdd_df %>%
   mutate(n_species=rowSums(jdd2[,class_uicn]))
  
  ggplot(jdd_sf)+
    geom_sf(fill=NA)+
    geom_scatterpie(data=jdd_df,aes(x=long,y=lat,group=iso_a2,r=sqrt(n_species/pi)/20),cols=class_uicn)+
    #scale_size(range=c(1:4))+
    scale_fill_manual(breaks=c("CR","DD","EN","EW","EX","LC","NT","VU"),values=c("red","grey20","orange","grey80","black","green","darkgreen","yellow"))+
    theme_void()
  

}

