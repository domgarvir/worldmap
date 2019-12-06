countries_df=countries_select()
species_df=get_species_list(countries_df$iso_a2)

#get number of species in each cathegory by country; we do a groupby country, and catheogry
cols<-c(country, category)
species_df %>% count(country, category) -> result

#now I want to rank countries by the most endangered: Most number of endangered species. 
#for that I want to associate the good name of the country to the sp_list_table ....
#for that I can do a left jointbetween the sp_df and countries. To do that I have to change the name of column iso_a2 to "country"
species_df2 <- species_df %>% left_join(as_tibble(countries_df) %>% select(name,iso_a2) %>% rename( country = "iso_a2", country_name = "name"), by="country")  
spe

#now we can order them by number of endangered species(total or proportional). We can also add
category_id<-"EN"
result <- species_df2 %>% count(country_name, category,Nesp) %>% filter(category == category_id) %>% arrange(desc(n)) %>% mutate(prop=as.numeric(n)/as.numeric(Nesp)) 

#result <- result %>% mutate(prop=as.numeric(n)/as.numeric(Nesp)) 
#test <- select(species_df2, country_name, Nesp) %>% unique() %>% inner_join(result)
