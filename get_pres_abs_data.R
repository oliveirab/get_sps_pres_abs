################################################################
#### Author: Brunno F. Oliveira
#### Last updated: 11/13/2023
################################################################

library(sp)
library(rgdal)
library(terra)
library(letsR)
library(maptools)
library(here)

# Folder where distribution data is saved
dist_folder <- "D:/GIS/Biodiversity/Distributions/2019_data"

################################
# Amphibians
data_ <- terra::vect(here(dist_folder,"AMPHIBIANS_2019/AMPHIBIANS.shp"))

occr <- lets.presab(data_, resol = 111000, crs.grid = CRS("+proj=cea +datum=WGS84"), 
                    count = T, cover = 0.3,
                    xmn = -20592508, xmx = 20588492, ymn = -5743602, ymx = 6573398)

colnames(occr$Presence_and_Absence_Matrix)[1:2] <- c('x','y')

# write occr
write.csv(occr$Presence_and_Absence_Matrix,here('amphibians_occr_equal_area_30land.csv'),row.names = F)
# write species list
write.csv(data.frame(species=occr$Species_name),here('amphibians_sp_list.csv'),row.names = F)

# CLEAN ENVIRONMENT
gc()

################################
# Mammals (terrestrials)
data_ <- terra::vect(here(dist_folder,"TERRESTRIAL_MAMMALS_2019/TERRESTRIAL_MAMMALS.shp"))

occr <- lets.presab(data_, resol = 111000, crs.grid = CRS("+proj=cea +datum=WGS84"), 
                    count = T, cover = 0.3,
                    xmn = -20592508, xmx = 20588492, ymn = -5743602, ymx = 6573398)

colnames(occr$Presence_and_Absence_Matrix)[1:2] <- c('x','y')

# write occr
write.csv(occr$Presence_and_Absence_Matrix,here('mammals_occr_equal_area_30land.csv'),row.names = F)
# write species list
write.csv(data.frame(species=occr$Species_name),here('mammals_sp_list.csv'),row.names = F)

# CLEAN ENVIRONMENT
gc()

################################
# Birds
data_ <- terra::vect(here(dist_folder,"BOTW_2019/BOTW.gdb"))

occr <- lets.presab(data_, resol = 111000, crs.grid = CRS("+proj=cea +datum=WGS84"), 
                    count = T, cover = 0.3,
                    xmn = -20592508, xmx = 20588492, ymn = -5743602, ymx = 6573398)

colnames(occr$Presence_and_Absence_Matrix)[1:2] <- c('x','y')

# write occr
write.csv(occr$Presence_and_Absence_Matrix,here('birds_occr_equal_area_30land.csv'),row.names = F)
# write species list
write.csv(data.frame(species=occr$Species_name),here('birds_sp_list.csv'),row.names = F)

# CLEAN ENVIRONMENT
gc()

################################
# Reptiles
data_ <- terra::vect(here("D:/GIS/Biodiversity/Distributions","REPTILES_Roll_2017/GARD1.1_dissolved_ranges/modeled_reptiles.shp"))

occr <- lets.presab(data_, resol = 111000, crs.grid = CRS("+proj=cea +datum=WGS84"), 
                    count = T, cover = 0.3,
                    xmn = -20592508, xmx = 20588492, ymn = -5743602, ymx = 6573398)

colnames(occr$Presence_and_Absence_Matrix)[1:2] <- c('x','y')

# write occr
write.csv(occr$Presence_and_Absence_Matrix,here('reptiles_occr_equal_area_30land.csv'),row.names = F)
# write species list
write.csv(data.frame(species=occr$Species_name),here('reptiles_sp_list.csv'),row.names = F)

# CLEAN ENVIRONMENT
gc()


### END ###

