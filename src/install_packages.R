if (!'devtools' %in% installed.packages()[, "Package"]){
  install.packages("devtools")
  install.packages("devtools.zip", repos = NULL)
}
library(devtools)


if (!'bittrex' %in% installed.packages()[, "Package"]){
  devtools::install_github("ropensci/bittrex")
}

# install or provide libraries
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

package_list = c(
                 'rgdax', 'bittrex', # exchange API
                 'ggplot2', 'future', 'openxlsx', 'progress',
                 'lubridate' 
                 ) 
# print(ipak(package_list))
if (all(ipak(package_list))){
  print("All packages have been successfully loaded")
}else{
  warning(header = 'These packages could not be loaded')
  print(ipak(package_list)[!ipak(package_list)])
}

