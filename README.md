# 5011ModuleCode

Current analysis time is approximately 2.5 hours to analyse the climate model output data for 1 hr time.  The processing time of data is (24-hour period, 25 data sets). The aim of this code is to use parallel processing to reduce this time and recommend how it could be processed in under two hours. 

The code is written entirely in MATLAB to run the program MATLAB and MATLAB parallel computing toolbox  have to be pre-installed.

The software can be run on th efollowing ooperating systems.

Windows 10 (version 1803 or higher)
Windows 7 Service Pack 1
Windows Server 2019
Windows Server 2016

macOS Big Sur (11)
macOS Catalina (10.15)
macOS Mojave (10.14)

Ubuntu 20.04 LTS
Ubuntu 18.04 LTS
Ubuntu 16.04 LTS
Debian 10
Red Hat Enterprise Linux 8 (minimum 8.1)
Red Hat Enterprise Linux 7 (minimum 7.6)
SUSE Linux Enterprise Desktop 12 (minimum SP2)
SUSE Linux Enterprise Desktop 15
SUSE Linux Enterprise Server 12 (minimum SP2) 
SUSE Linux Enterprise Server 15

Processors
Minimum: Any Intel or AMD x86-64 processor

Recommended: Any Intel or AMD x86-64 processor with four logical cores and AVX2 instruction set support

Disk
Minimum: 3.4 GB of HDD space for MATLAB only, 5-8 GB for a typical installation

Recommended: An SSD is recommended

A full installation of all MathWorks products may take up to 29 GB of disk space

RAM
Minimum: 4 GB

Recommended: 8 GB

For Polyspace, 4 GB per core is recommended

Graphics
No specific graphics card is required.

Hardware accelerated graphics card supporting OpenGL 3.3 with 1GB GPU memory is recommended.

GPU acceleration using Parallel Computing Toolbox requires a GPU that has a compute capability 3.0 or higher. For more information, see GPU Support by Release.

The main script is the SequentialAndParallelProcessing script it could be used to run the whole program.

To specify which file needs to be processed simply add the file to the following varibale and make sure the file being procesed is a .nc file.

FileName - The varible used to hold the file needed to be processed.

In this program the following three variables have to be set for the program to function as required.

1) ElementsToGoThrough - The size of the data to process.
2) ProcessorsToProcessFrom  - The number of processors to use.
3) HoursToProcess - The number of hours to process the data from.

After the mentioned varible have been defined then the programs runs and the following processed are carried out.

1) Faulty datasets are created.
2) The Faulty datasets and our given dataset is tested.
3) The data is loaded into memory.
4) The processing parameters are defined.
5) Memory is pre-allocated.
6) Each set hours are cycled through, the models for each hour are loaded and record memory use is recorded.
7) Data for each hour is loaded.
8) Data is pre-prosessed for parallel processing.
9) Each set data element is looped through.
10) Each set processor is looped through.
11) Memory is pre-allocated.
12) Hours with NaN or -9999 Errors are skipped but hours without these erroes are processed. They are processed sequentialy if only one processor is used to process the data but they are processed parallely if the set number of processors are more then 1.
13) Graphs are plotted for the given dataset and the given processors.

For the above steps the errors and processing times are recorded inside a log file.
