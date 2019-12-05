
#
## Fonctions écrites initialement par Guillaume Body
#
## Objectif: cartographies


# Function to download country shapes, which include the key to connect uicn list

countries_southa<-function(){

sf_southa<-ne_countries(scale=50,type="countries",continent='south america',returnclass='sf')
sf_southa %>%
  dplyr::select(
    iso_a2,
    name,
    abbrev,
    geometry) 
}

