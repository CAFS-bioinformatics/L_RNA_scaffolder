# L_RNA_scaffolder
Use long transcriptome reads to scaffold genomes
Manual Reference Pages
NAME L_RNA_scaffolder - using long transcriptome reads to scaffold genome 
CONTENTS 
   DESCRIPTION
   SYSTEM REQUIREMENTS
   INSTALLING
   INPUT FILE
   COMMANDS AND OPTIONS
   OUTPUT FILE
   SPEED

DESCRIPTION
   L_RNA_scaffolder is a genome scaffolding tool with long trancriptome reads. The long transcriptome reads could be generated by 454/Sanger/Ion_Torrent sequencing, or de novo assembled with pair-end Illumina sequencing. The long reads are aligned to genome fragments using BLAT and alignment file (PSL format with no heading) is used as the input file of L_RNA_scaffolder. L_RNA_scaffolder searches "guider" reads, fragment of which were mapped to different genome fragments. Then the "guider" reads orientated and ordered the genome fragments into longer scaffolds. 

SYSTEM REQUIREMENTS
   The software, written with Shell script, consists of C++ programs and Perl programs. The C programs have been precompiled and therefore could be directly executed. To run Perl program, perl and Bioperl modules should be installed on the system. Further, the program required PSL file as input file. Thus, BLAT program should also be installed on the system. L_RNA_scaffolder has been tested and is supported on Linux. 

INSTALLING
   After downloading the sofware, simply type "tar -zxvf L_RNA_scaffolder.tar.gz" in the base installation directory. The software is either written in C++ and compiled, or written in Perl. Therefore, it should not require any special compilation and is already provided as portable precompiled software. 

INPUT FILES
   PSL file and genome fragment fasta file are necessary for scaffolding. The psl file was generated using BLAT program with "-noHead" option. The genome fragment file should be fasta format, consistent with the subject sequences when using BLAT program. Another file, named overlapping file, contain two columns. This file is not necessary but will avoid some interesting genome fragments not being scaffolding. 

COMMANDS AND OPTIONS
   L_RNA_scaffolder is run via the shell script: L_RNA_scaffolder.sh found in the base installation directory.

   Usage info is as follows:

   Required:
   -d : the directory where the programs are in. 
   -i : the output of transcripts alignment with BLAT. SeePSL format
   -j : the genome fragments fasta file which will be scaffolded and was used as the database when aligning transcript reads.
   Optional:
   -r : some fragments which you might be interesting and will not be scaffolded. The file has two columns per row. One row stand for that two fragments might be connected and should not be scaffolded. 
   -l : the threshold of alignment length coverage (default:0.95). If one read has a hit of which length coverage was over the threshold, then this read would be filtered out.
   -p : the threshold of alignment identity (default: 0.9). If one alignment has an identity over the threshold, then the alignment is kept for the further analysis.
   -o : the directory where the output file is stored. The default output directory is equal to the program directory.
   -e : The maximal intron length between two exons (default: 100kb). 
   -f : the minimal number of supporting reads (default: 1). If the number of the supporting reads for the connection is over the frequency, then this connection is reliable.

   Note: a typical L_RNA_scaffolder command might be:
# sh L_RNA_scaffolder.sh -d ./ -i input.psl -j genome.fasta

OUTPUT FILES
   When L_RNA_scaffolder completes, it will create an L_RNA_scaffolder.fasta output file in the output_dir/ output directory. 

SPEED
   L_RNA_scaffolder spent 5 hours in scaffolding human genome fragments with a psl file of 43 GB generated from alignment of 8.3 millions of transcripts. However, the sequencing alignment is time-consuming when using BLAT to alignment nearly ten millions of reads. We recommend splitting the reads into multiple pieces and running the alignments simultaneously.
