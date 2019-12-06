countries_df=countries_select()
species_df=get_species_list(countries_df$iso_a2)

#get number of species in each cathegory by country; we do a groupby country, and catheogry
species_df %>% group_by(country,category) %>% summarise(n_sp = n_count(cathegory)) -> result