#' function that increases the packages version
#' modified version of ...
#' ## by:     alko989
#' ## source: http://stackoverflow.com/q/24209336/1144966

# read in DESCRIPTION file

pversion_inc <- function(){
files <- c("d:/peter/dropbox/rpackages/wikipediatrend/DESCRIPTION",
  "C:/Dropbox/RPackages/wikipediatrend/DESCRIPTION",
  "~/Dropbox/RPackages/wikipediatrend/DESCRIPTION")
fname <- files[file.exists(files)][1]

  f     <- read.dcf(file=fname)
  
  # get positions of ...
  version_iffer <- names(f[1,])=="Version"
  date_iffer    <- names(f[1,])=="Date"
  built_iffer   <- names(f[1,])=="Built"
  
  # get version
  curVer <- package_version(f[version_iffer])
  
  # add one to version
  i<-1
  while(!is.na(curVer[[1,i+1]]) ) i<-i+1
  curVer[[1,i]] <- curVer[[1,i]] + 1 
  f[version_iffer] <- toString(curVer)
   
  ## Update also the date
  f[date_iffer] <- format (Sys.time(), "%Y-%m-%d")
    
  # write back 
  write.dcf(t(f[,!built_iffer]), file=fname)
}

#pversion_inc()
