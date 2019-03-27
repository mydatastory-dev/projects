##Spring 2019 - Health Science Center Library RNA seq demo
##Description of demo dataset:
  ## 1) The example data used here is subsetted from study GSE52778
  ## 2) Information regarding GSE52778 can be found at NCBI GEO (https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE52778)
  ## 3) The publication corresponding to this study has Pubmed ID (PMID: 24926665)
  ## 4) The example data used only contains RNA sequencing reads that land on human chromosome 1
##For this demo, DESeq2 from the Bioconductor suites will be used for differential gene expression analysis
##There are other tools from Bioconductor such as edgeR and Lima

##STEP 1: Set working directory
##directory for DELL latitude E7440 at home
##setwd("C:/Users/joe/OneDrive - University of Florida/JOE - bioinformationist/course - teaching/spring2019-RNAseq/RNAseq-spring2019samples/airwayRNAseq")
##dir <- file.path("C:", "Users", "joe", "OneDrive - University of Florida", "JOE - bioinformationist", "course - teaching", "spring2019-RNAseq", "RNAseq-spring2019samples", "airwayRNAseq")
##directory for thinkpad x270
setwd("D:/OneDrive - University of Florida/JOE - bioinformationist/course - teaching/spring2019-RNAseq/RNAseq-spring2019samples/airwayRNAseq")
dir <- file.path("D:", "OneDrive - University of Florida", "JOE - bioinformationist", "course - teaching", "spring2019-RNAseq", "RNAseq-spring2019samples", "airwayRNAseq")

##STEP 2: Install Bioconductor's package manager and activate it once installed
install.packages("BiocManager")
library("BiocManager")

##STEP 3: Import sample table
##        The sample table contains information such as sample ID and treatment condition
sample_table <- read.csv("sample_table.csv")

##STEP 4: Import BAM files
##        BAM or binary alignment map files tells where in the reference genome our
##        RNA sequencing reads fall on
BiocManager::install("Rsamtools", version = "3.8")
library(Rsamtools)
## The line below creates the path to the bam files and stores in variable bamfilenames
bamfilenames <- file.path(dir, paste0(sample_table$run, "_subset.bam"))  
## The line below imports the RNA sequencing bam files to the R workspace
bamfiles <- BamFileList(bamfilenames, yieldSize = 2000000) ##reading in the bam files

##STEP 5: Extract features of the reference  genome
##        This allows us to know which exon or transcript
##        the sequencing reads are landing on 
##        Note:  aligning sequencing reads to reference genome
##               generates a BAM file that tells us where in
##               the genome the reads are coming from, but it
##               does not tell us which exon or transcript the
##               reads come from so we have to perform this step
##               to find out
BiocManager::install("GenomicFeatures", version = "3.8")
library(GenomicFeatures)
gtffile <- file.path(dir, "Homo_sapiens.GRCh37.75_subset.gtf")
txdb <- makeTxDbFromGFF(file=gtffile, organism = "Homo sapiens", format="gtf")
## Retrieving exon information by gene
exonsbygene <- exonsBy(txdb, by="gene") 
exons.by.gene <- data.frame(exonsbygene)

## STEP 6:  Getting read counts by gene
BiocManager::install("GenomicAlignments", version = "3.8")
library(GenomicAlignments)
count_table <- summarizeOverlaps(exonsbygene, bamfiles, mode="Union", singleEnd=FALSE, ignore.strand = TRUE, fragments=TRUE)

## STEP 7:  Obtaining differentially expressed genes
BiocManager::install("DESeq2", version = "3.8")
library(DESeq2)
airwayscount <- data.frame(assay(count_table))
##airwayscoldata <- DataFrame(sample_table)
airways1 <- DESeqDataSetFromMatrix(countData = airwayscount, colData = sample_table, design=~cell+dexamethasone)
airways2 <- DESeq(airways1)
airways_results <- results(airways2, contrast = c("dexamethasone", "trt", "untrt"))
airways.results <- data.frame(airways_results)
airways.results$ensembl.gene.id <- rownames(airways_results)
##plotCounts(airways2, gene=which.min(airways_results$log2FoldChange), intgroup="dexamethasone")

## STEP 8:  Adding annotations for differential gene expression results
##          While the differential gene expression analysis done by DESeq2 provides the
##          Ensembl gene ids, it does not provide the gene symbols
##          This step uses the biomaRt package to extract gene symbols and appends them to the results of
##          the differential gene expression analysis results
BiocManager::install("biomaRt", version = "3.8")
library(biomaRt)
##listMarts()
listEnsemblArchives()
listMarts(host="http://feb2014.archive.ensembl.org")
ensembl_grch37_75 <- useMart(host="http://feb2014.archive.ensembl.org", biomart="ENSEMBL_MART_ENSEMBL")
listDatasets(ensembl_grch37_75)
ensembl_grch37_75 <- useMart(host="http://feb2014.archive.ensembl.org", biomart="ENSEMBL_MART_ENSEMBL", dataset = "hsapiens_gene_ensembl")
ensemble_grch37_75_attributes <- data.frame(listAttributes(ensembl_grch37_75))
genes <- getBM(attributes=c("ensembl_gene_id", "hgnc_symbol"), mart=ensembl_grch37_75)
matching_gene_ids <- match(airways.results$ensembl.gene.id, genes$ensembl_gene_id)
airways.results$gene.names <- genes$hgnc_symbol[matching_gene_ids]
