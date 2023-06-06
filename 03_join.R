#install.packages("rnaturalearth")
library(rnaturalearth) # package of spatial vectorial data

# world limits
wld <- ne_countries(returnclass = "sf")

# filter the countries with iso code and select the two columns of interest
wld <- filter(wld, !is.na(iso_a2)) %>%
  select(iso_a2, subregion)

# plot
plot(wld)