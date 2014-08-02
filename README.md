coffee_analysis: Supplemental data and code for coffee project.
===============

##Requirements
* Linux (Arch Linux and Ubuntu Server 13.10 used). OS X may run the needed software, but is untested.
* A large amount of memory. Approximately 137GB RAM is used during the get.oturep() step, and ~47GB is used during the cluster() step. Amazon EC2 instance type cr1.8xlarge was used for memory intensive steps, which provides 244GB of memory.
* Trimmomatic (version 0.32 used)
* Mothur (version 1.32.1 used)
* Python 2 and 3 (versions 2.7.6 and 3.3.3 used)
* BioPython (version 1.63 used)
* R (version 3.0.2 used)
* R libraries ggplot2, plyr, gridExtra
* Krona

##Obtaining raw reads
Raw reads are deposited in Zenodo (http://dx.doi.org/10.5281/zenodo.11120).

[![DOI](https://zenodo.org/badge/doi/10.5281/zenodo.11120.png)](http://dx.doi.org/10.5281/zenodo.11120)

##Cleaning raw reads
Prior to running mothur, raw fastq sequences need to be cleaned with trimmomatic. A convenience script is provided at scripts/print_trimm_cmd.py if changes to path names need to be made. By default, the scripts assume the raw reads are in fastqs_raw/

    $bash scripts/trimm_raw_reads.sh
    
##Running mothur

    $mothur protocol.batch
    
Annotations are provided in the mothur batch file, explaining steps. The mothur protocol also runs accessory scripts, with additional requirements as seen above.

##A note on sample naming
Sample and sequences have abbreviated names during data analysis.

ICfXX_YY: INT-Coffee, Sample XX, Sequence YY (only for seqences)

ICn: INT-Control

TCf: TRN-Coffee

TCn: TRN-Control

OCf: ORG-Coffee

OCn: ORG-Control

###Contact info
primary email: adam.caldwell@gmail.com
