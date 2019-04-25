#dat = name of data set
#colnm = name of the column where year is located, put in quotes, e.g., 'YEAR'
#yrs = the years as a vector (must have c(yr,yr,etc)). Can be any integer values (i.e., c(2001, 2003:2007,2009,1999))
#nmcol = name of additional column to add that indicates the years specified
#subset = whether or not to return a dataframe with only rows that meet criteria
year.fn<-function(dat,colnm,yrs,nmcol=paste(colnm,"new",sep=""),subset=F) {
  if(!(colnm %in% colnames(dat))) {
    stop("colnm ",colnm," is not a name in the dataframe\n")
  }
  z <- as.integer(yrs)
  dat[,nmcol] <- NA
  if(subset) {
     out <- dat[dat[,colnm] %in% z,]
     out[,nmcol] <- out[,colnm]
  }
  if(!subset) {
     out <- dat
     out[dat[,colnm] %in% z,nmcol] <- out[dat[,colnm] %in% z,colnm]  #put in years to new column and keep not selected as NA
  }
  return(invisible(out))
}