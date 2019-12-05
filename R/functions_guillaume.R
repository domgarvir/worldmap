
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

