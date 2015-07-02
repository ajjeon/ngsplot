setwd("/mnt/gtklab01/ahjung/ezh2/results/mapping/chromhmm-all-8/makesegmentation")

antibodies <- c("H3K4me3", "EZH2", "Suz12", "H3K27me3", "H3K9me3", "H3K27me1", "H3K27Ac", "H3K27me2", "EED")
treatment <- c("DMSO","EZH2i")
preheader <- "KARPAS-422_20_segments-filtered"
states <- sapply(1:20, function(x) paste("E",x,sep=""))
file_dir <- "/mnt/gtklab01/ahjung/ezh2/results/mapping/chromhmm-all-8/makesegmentation/"

normfactors <- read.table("/mnt/officedata/ezh2/results/2015-05-28/normalisation_table.txt")

create_config_file <- function(antibody, state){
    config_df <- data.frame("bamfile"=NA, "flynorm"=NA, "genefile"=NA, "title"=NA)
    DMSO_bam_file <- paste(file_dir,preheader,"-",state,"-",treatment[1],"_8d_",antibody,"-sorted.bam",sep="")
    EZH2i_bam_file <- paste(file_dir,preheader,"-",state,"-",treatment[2],"_8d_",antibody,"-sorted.bam",sep="")
    gene_file <- paste(file_dir,preheader,"-isolatedgenes-",state,"-ID.bed",sep="")
    DMSO_title <- paste(state,"_DMSO_8d_",antibody,sep="")
    EZH2i_title <- paste("EZH2i_8d_",antibody,sep="")
    flynorm <- normfactors$V2[normfactors$V1==EZH2i_title]
    config_df <- rbind(config_df,data.frame("bamfile"=DMSO_bam_file,"flynorm"=1,"genefile"=gene_file,"title"=DMSO_title))
    config_df <- rbind(config_df,data.frame("bamfile"=EZH2i_bam_file,"flynorm"=flynorm,"genefile"=gene_file,"title"=paste(state,"_",EZH2i_title,sep="")))
    file_name <- paste("config_files/config_",state,"_",antibody,".txt",sep="")
    write.table(config_df[-1,],file_name,quote=FALSE,sep="\t",row.names=FALSE,col.names=FALSE)
}

for (i in 1:length(states)) {
    for (j in 1:length(antibodies)) {
        create_config_file(antibodies[j],states[i])
    }
}
