#install.packages("rnaturalearth")
library(rnaturalearth) # package of spatial vectorial data

# world limits
wld <- ne_countries(returnclass = "sf")

# filter the countries with iso code and select the two columns of interest
wld <- filter(wld, !is.na(iso_a2)) %>%
  select(iso_a2, subregion)

# plot
plot(wld)

sub_eur <- filter(new_gmob, 
                        is.na(sub_region_1),
                        !is.na(resi)) %>%
  left_join(wld, by = c("country_region_code"="iso_a2")) %>% 
  filter(subregion %in% c("Northern Europe",
                          "Southern Europe",
                          "Western Europe",
                          "Eastern Europe")) %>%
  mutate(resi_real = resi + 100,
         region = fct_reorder(country_region, 
                              resi, 
                              .fun = "max", 
                              .desc = FALSE)) %>% 
  select(-geometry, -sub_region_1)

str(sub_eur)