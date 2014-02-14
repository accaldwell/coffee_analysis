coffee_analysis: Supplemental data and code for coffee project.
===============

##Requirements
* Linux or OS X (Arch Linux and Ubuntu Server 13.10 used)
* A large amount of memory (Amazon EC2 instance type cr1.8xlarge was used for memory intensive steps, which provides 244GB of memory)
* Trimmomatic (version 0.32 used)
* Mothur (version 1.32.1 used)
* Python 2 and 3 (versions 2.7.6 and 3.3.3 used)
* BioPython (version 1.63 used)
* R (version 3.0.2 used)
* R libraries ggplot2, plyr, gridExtra

##Cleaning raw reads
Prior to running mothur, raw fastq sequences need to be cleaned with trimmomatic. A convienence script is provided at scripts/print_trimm_cmd.py if changes to path names need to be made. By default, the scripts assume the raw reads are in fastqs_raw/

    $bash scripts/trimm_raw_reads.sh
    
##Running mothur

    $mothur protocol.batch
    
Annotations are provided in the mothur batch file, explaining steps. The mothur protocol also runs accessory scripts, with additional requirements as seen above.