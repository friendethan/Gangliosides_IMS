#Will load files directly from directory, peakpick and sum intensities
#Returns .csv file, a saved peak picked list and summed intensities loaded

DirectPeakIntensitySum = function(folder_wd, snr, filename){
  require(readBrukerFlexData)
  require(MALDIquant)
  setwd(folder_wd)
  data = readBrukerFlexDir(folder_wd)
  #creating peaklist for all spectra
  cat("1) Reads; 2) Analyzes; 3)Exports as CSV\n")
  pb = txtProgressBar(0, 100, initial=0, style=3)
  peaklist=list()
  for(j in 1:length(data)){
    peaklist[[j]] = createMassSpectrum(data[[j]]$spectrum$mass, data[[j]]$spectrum$intensity, metaData=data[[j]]$metaData)
    setTxtProgressBar(pb,round(100/length(data)*j, digits=0))
  }
  cat("\n")
  #Smoothing
  pb = txtProgressBar(0, 100, initial=0, style=3)
  k=0.01
  peaklist = smoothIntensity(peaklist, method="SavitzkyGolay", halfWindowSize=20)
  setTxtProgressBar(pb, 100)
  k=1
  setTxtProgressBar(pb, round(100*k/5, digits=0))
  #Baseline Correction
  peaklist = removeBaseline(peaklist, method="SNIP", iterations=100)
  k=2
  setTxtProgressBar(pb, round(100*k/5, digits=0))
  #warping/alignment
  peaklist = alignSpectra(peaklist,halfWindowSize=20,SNR=3,tolerance=0.01,warpingMethod="lowess")
  k=3
  setTxtProgressBar(pb, round(100*k/5, digits=0))
  #calculating snr
  peaklist = detectPeaks(peaklist, method=c("SuperSmoother"), SNR=snr)
  peaklist <- binPeaks(peaklist, tolerance=0.02)
  k=4
  setTxtProgressBar(pb, round(100*k/5, digits=0))
  pickedPeaks = save(peaklist, file = paste(filename,"_peakList.RData", sep=""))
  k=5
  setTxtProgressBar(pb, round(100*k/5, digits=0))
  #Creating list of summed intensities with file name
  intensity_list = c()
  list_name = c()
  #finding summed intensity
  cat("\n")
  for(j in 1:length(data)){
    intensity_list[[j]] = sum(peaklist[[j]]@intensity)
    list_name[[j]] = peaklist[[j]]@metaData$sampleName
    setTxtProgressBar(pb,round(100/length(data)*j, digits=0))
  }
  #combine list
  summed_peaks = data.frame(list_name, intensity_list)
  names(summed_peaks) =c("Name", "Summed_Intensity")
  #export data
  write.csv(summed_peaks, file=paste(filename,".csv", sep=""))
  cat("\nDone")
  return(summed_peaks)
}
