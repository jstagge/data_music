# *------------------------------------------------------------------
# | FUNCTION NAME: gen_music
# | FILE NAME: gen_music.R
# | DATE: 
# | CREATED BY:  Jim Stagge         
# *------------------------------------------------------------------
# | Parameter:
# |     In:        char cGrade - the letter grade for the course
# |                 int iCreditHours - the course credit hours
# |     Out:       none
# |     In/Out:    none
# | 
# |  Returns:       the quality points for the course
# | 
# | Desc:          multiplies the credit hours by the course weight.   
# *------------------------------------------------------------------

gen_music <- function( x_input, track_n, velocity_on, note_range){ 

min_note <- note_range[1]
max_note <- note_range[2]



######################### Jim, you might consider adding some dead air at start

###########################################################################
###  Process time 
###########################################################################
### Find minimum time
t_min <- min(x_input$time, na.rm=TRUE)

### Calculate the time of notes
time_list <- time_func(x_input$time, time_origin=t_min, value_timestep=1/8, ppq=96)


###########################################################################
###  Process note values 
###########################################################################

### This is where you would cut to scales
### Major scale
root, whole step, whole step, half step, whole step, whole step, whole step, half step

maj_scale <- c(0,2,2,1,2,2,2,1)
maj_scale <- cumsum(maj_scale)
maj_scale <- seq(0,11) %in% maj_scale

note_list <- seq(min_note,max_note)
note_list <- note_list[rep(maj_scale, length.out=length(note_list))]

n_notes <- length(note_list)

### Calculate notes by cutting into equal bins
x_notes <- cut_equal_breaks(x_input$values, breaks=n_notes)
### The result of this has a min of 1, so subtract 1 and add to the minimum note
x_notes <- note_list[x_notes]


### Determine the number of bins from the min and maximum notes
### This assumes we want to use all notes in between
#n_notes <- max_note - min_note + 1

### Calculate notes by cutting into equal bins
#x_notes <- cut_equal_breaks(x_input$values, breaks=n_notes)
### The result of this has a min of 1, so subtract 1 and add to the minimum note
#x_notes <- x_notes - 1 + min_note


### Need to remove NA rows


note_on <- data.frame(track=track_n, time=time_list$on_time, command="Note_on_c", channel=1, note=x_notes, velocity=velocity_on)
note_off <- data.frame(track=track_n, time=time_list$off_time, command="Note_off_c", channel=1, note=x_notes, velocity=0)

## Remove NAs
note_on <- note_on[complete.cases(note_on),]
note_off <- note_off[complete.cases(note_off),]

### You can put a check here for continuous notes by comparing note_on to note_off
### Deleting the note_off row and the following note_on row if the values are the same

note_df <- zipper(note_on, note_off, 1)


return(note_df)

}
