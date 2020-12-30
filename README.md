# Comparing Ganglioside Species Imaging Mass Spectometry Total Ion Current Intensties
This reposistory contains the script and function used for analyzing the relative ganglioside intensities MS results of brain sections. Speficically, this code reads the flex data, keeps signals above a chosen S/N threshold and sums the remaining signals to obtain the total ion current.

## Data Format
The data analyzed are obtained from the Bruker Ultraflex system with flexControl 3.4 and flexImaging 4.0. The data analyzed were all calibrated with quadratic calibration, as cubic calibration is not compatible with readBrukerFlexData.

## Files

* script.R for obtaining the TIC results
* functions.R for functions called during the analysis

## Reference Publication
**Ethan Yang**, Martin Dufresne, Pierre Chaurand, Enhancing ganglioside species detection for MALDI-TOF imaging mass spectrometry in negative reflectron mode,
*International Journal of Mass Spectrometry, Volume 437, 2019, Pages 3-9,ISSN 1387-3806*, [https://doi.org/10.1016/j.ijms.2017.09.011](http://www.sciencedirect.com/science/article/pii/S1387380617302920).

## Contributors 

* Ethan Yang: Wrote 100% of the R codes for exporting and analyzing the IMS data currently available in this repository
* Martin Dufresne: Mentored Ethan throughout his first graduate study
* Pierre Chaurand: Provided guidance and outlined the data analysis pipeline; corrected figures

## Dependencies

* [MALDIquant](https://github.com/sgibb/MALDIquant) for conducting the statistical analysis and TIC calculation
* [readBrukerFlexData](https://github.com/sgibb/readBrukerFlexData) for reading in Bruker flex data

## Disclaimer
This repository contains only the scripts and functions for analyzing all the imaging mass spectrometry data shown in the publication. In particular, the script was used to calculate the total ion current of each of the samples. The scripts have been cleaned to represent the final pipeline and have also been scraped to remove any personal identifying information. The session info provided below were determined post publication and therefore may not be an accurate representation of the actual R enviornment during data analysis.   

## License
Please reference the LICENSE document for details. 

## Session Info
R Studio: Version Unknown  
R version 3.4.4 (2018-03-15)  
Platform: x86_64-w64-mingw32/x64 (64-bit)  
Running under: Windows 7 (Build unknown) 

attached base packages:  

* stats
* graphics
* grDevices 
* utils
* datasets  
* methods   
* base     

other attached packages:
* MALDIquant_1_17
* readBrukerFlexData_1_8_5

loaded via a namespace (and not attached):
* Rcpp_0.12.16        
* BiocGenerics_0.24.0 
* MASS_7.3-49         
* munsell_0.4.3       
* colorspace_1.3-2    
* lattice_0.20-35     
* R6_2.2.2            
* rlang_0.2.0        
* plyr_1.8.4          
* tools_3.4.4         
* parallel_3.4.4      
* grid_3.4.4          
* Biobase_2.38.0      
* gtable_0.2.0        
* irlba_2.3.2         
* ProtGenerics_1.10.0
* lazyeval_0.2.1      
* yaml_2.1.19         
* mmand_1.5.3         
* tibble_1.4.2        
* Matrix_1.2-12       
* Cardinal_1.2.1      
* signal_0.7-6        
* sp_1.2-7           
* pillar_1.2.1        
* compiler_3.4.4      
* scales_0.5.0        
* XML_3.98-1.10       
* stats4_3.4.4       
