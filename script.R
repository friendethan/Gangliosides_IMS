#Step 1: Load necessary functions
require("functions.R")
require(MALDIquant)
require(readBrukerFlexData)

#Step 2: Read and export data
folder1="bruker_folder_directory"
filename1="filename"
sample1 = DirectPeakIntensitySum(folder1,snr=3,samplewindow=20,filename1)

##Step 2 is repeated for all other MS data
