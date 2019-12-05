
#
## Fonctions écrites initialement par Guillaume Body
#
## Objectif: cartographies


# Function to download country shapes, which include the key to connect uicn list

countries_select<-function(continent='south america'){

sf_southa<-ne_countries(scale=50,type="countries",continent=continent,returnclass='sf')
sf_southa %>%
  dplyr::select(
    iso_a2,
    name,
    abbrev,
    geometry) %>%
  dplyr::mutate(
    centroid= sf::st_centroid(geometry)
  )
}

