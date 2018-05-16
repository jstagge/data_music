# *------------------------------------------------------------------
# | FUNCTION NAME: cut_equal_breaks
# | FILE NAME: cut_equal_breaks.R
# | DATE: 
# | CREATED BY:  Jim Stagge         
# *------------------------------------------------------------------
# | Parameter:
# |     In:        x - a vector of numbers
# |                breaks - the number of breaks desired
# |     Out:       k - a vector of numbers corresponding to the break
# | 
# |     Desc:      This function cuts a time series into categories with
# |                each bin being the same width.  It uses the min and max
# |                of the original time series so that the lowest and highest
# |                bins start and end with the min and max, respectively. 
# *------------------------------------------------------------------

cut_equal_breaks <- function(x, breaks) {
  r <- range(x, na.rm=TRUE)
  b <- seq(r[1], r[2], length=2*breaks+1)
  brk <- b[0:breaks*2+1]
  mid <- b[1:breaks*2]
  brk[1] <- brk[1]-0.01
  k <- cut(x, breaks=brk, labels=FALSE)
  k <- as.numeric(k)
  return(k)
}
