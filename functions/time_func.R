# *------------------------------------------------------------------
# | FUNCTION NAME: time_func
# | FILE NAME: time_func.R
# | DATE: 
# | CREATED BY:  Jim Stagge         
# *------------------------------------------------------------------
# | Parameter:
# |     In:        x_time - 
# |                time_origin - 
# |     Out:       time_return - a vector of numbers corresponding to the break
# | 
# |     Desc:      Come back and fix documentation
# |                
# |                
# |                
# *------------------------------------------------------------------

time_func <- function(x_time, time_origin=0, value_timestep=1/4, ppq=96){
	### Make time relative to time_origin
	x_time <- x_time - time_origin
	
	### Calculate the note length given to each time step
	note_length <- ppq*(value_timestep/(1/4))
	
	### 
	on_time <- x_time * note_length
	off_time <- x_time * note_length + note_length
	
	time_return <- list(on_time=on_time, off_time=off_time)
	return(time_return)
}
