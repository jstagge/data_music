# *------------------------------------------------------------------
# | PROGRAM NAME: Data Music
# | FILE NAME: data_music.R
# | DATE: 
# | CREATED BY:  Jim Stagge         
# *----------------------------------------------------------------
# | PURPOSE:  This is a code wrapper to generate a midicsv file from data.
# | The resulting file can be processed into a midi file using the program csvmidi.
# | This midi file can then be played using timidity.
# | Check the ToRun.txt file for detailed code             
# |
# *------------------------------------------------------------------
# | COMMENTS:               
# |
# |  1:  
# |  2: 
# |  3: 
# |*------------------------------------------------------------------
# | DATA USED:               
# | This is a test instance using reconstructed climate indices ENSO and PDO
# |
# |*------------------------------------------------------------------
# | CONTENTS:               
# |
# |  PART 1:  
# |  PART 2: 
# |  PART 3: 
# *-----------------------------------------------------------------
# | UPDATES:               
# |
# |
# *------------------------------------------------------------------
 
### Clear any existing data or functions.
rm(list=ls())

###########################################################################
## Set the Paths
###########################################################################
### Path for Data and Output	
data_path <- "../../Data"
output_path <- "../../Output"
global_path <- "../global"
function_path <- "./functions"

### Set global output location
output_path <- file.path(output_path,"data_music")


###########################################################################
###  Load functions
###########################################################################
require(colorout)
require(V8)

source(file.path(function_path,"gen_music.R"))
source(file.path(function_path,"cut_equal_breaks.R"))
source(file.path(function_path,"zipper.R"))
source(file.path(function_path,"time_func.R"))

###########################################################################
## Set Initial Values
###########################################################################
ppq <- 96 #pulses per quarter note, this is standard for midi
bpm <- 110 #beats per minute (Moderato)
time_num <- 4 #time signature numerator
time_denom <- 4 #time signature denominator
title <- "ENSO Test"
subtitle <- "This is a first example using paleoreconstructed ENSO"

###########################################################################
###  Read in Data
###########################################################################
### Read in paleo reconstructed climate indices as a test case
clim_ind <- read.csv(file.path(data_path,"paleo_clim_ind/clim_ind.csv"))
#head(clim_ind)

### Extract only the first 2 columns (time and values)
x_data <- data.frame(time=clim_ind[,1], values=clim_ind[,2])
#head(x_data)

###########################################################################
###  Call the header function
###########################################################################

### Convert to micro seconds per quarter beat, needed for midi
tempo <- round(60000000/bpm)

Need to generate all this stuff
0, 0, Header, 1, 2, 480,,,
1, 0, Start_track,,,
1, 0, Title_t, "Close Encounters",,,
1, 0, Text_t, "Sample for MIDIcsv Distribution",,,
1, 0, Copyright_t, "This file is in the public domain",
1, 0, Time_signature, 4, 2, 24, 8
1, 0, Tempo, 500000,,,,
1, 0, End_track


###########################################################################
###  Call the generation function
###########################################################################

Need to generate all this stuff
2, 0, Start_track
2, 0, Instrument_name_t, "Grand Piano"
2, 0, Program_c, 1, 19


## JIM DONT FORGET TO ADD THE END OF THE FILE
0, 0, End_of_file
###########################################################################
###  Save to csv
###########################################################################

### Need to remove NA rows

### This allows you to append
write.table(note_df, file=file.path(output_path,"example2.csv"), row.names=F,append=T, sep=",", col.names=F)




output










