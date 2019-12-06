plan <- drake_plan(
#-- import des donnees --#
  countries1 = countries_select(),
  tab_species = get_species_list(countries1$iso_a2),
  class_specie = get_species_by_country_and_status(tab_species),
  countries = countries_centroid(countries1),
  carto = carto_uicn(class_specie,countries),
  carto2 = get_category_map(class_specie,countries)
)


