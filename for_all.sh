#!/bin/bash
# for f in 22_2264CP_KARPAS-422_DMSO_8d_H3K4me3_i87_filtered-hg19-dm6-human.bed \
# 10_2264CP_KARPAS-422_DMSO_8d_EZH2_i74-hg19-dm6-human.bed \
# 19_2264CP_KARPAS-422_DMSO_8d_Suz12_i84_filtered-hg19-dm6-human.bed \
# 25_2264CP_KARPAS-422_DMSO_8d_H3K27me3_i94-hg19-dm6-human.bed \
# 01_2264CP_KARPAS-422_DMSO_8d_H3K9me3_i89_filtered-hg19-dm6-human.bed \
# 04_2264CP_KARPAS-422_DMSO_8d_H3K27me1_i92_filtered-hg19-dm6-human.bed \
# 07_2264CP_KARPAS-422_DMSO_8d_H3K27Ac_i95_filtered-hg19-dm6-human.bed \
# 13_2264CP_KARPAS-422_DMSO_8d_H3K27me2_i82_filtered-hg19-dm6-human.bed \
# 16_2264CP_KARPAS-422_DMSO_8d_EED_i79_filtered-hg19-dm6-human.bed

# # 22_2264CP_KARPAS-422_DMSO_8d_H3K4me3_i87_filtered-hg19-dm6-human.bed \
# # 24_2264CP_KARPAS-422_EZH2i_8d_H3K4me3_i89_filtered-hg19-dm6-human.bed \
# # 10_2264CP_KARPAS-422_DMSO_8d_EZH2_i74-hg19-dm6-human.bed \
# # 12_2264CP_KARPAS-422_EZH2i_8d_EZH2_i76-hg19-dm6-human.bed \
# # 19_2264CP_KARPAS-422_DMSO_8d_Suz12_i84_filtered-hg19-dm6-human.bed \
# # 21_2264CP_KARPAS-422_EZH2i_8d_Suz12_i86_filtered-hg19-dm6-human.bed \
# # 25_2264CP_KARPAS-422_DMSO_8d_H3K27me3_i94-hg19-dm6-human.bed \
# # 27_2264CP_KARPAS-422_EZH2i_8d_H3K27me3_i96-hg19-dm6-human.bed \
# # 01_2264CP_KARPAS-422_DMSO_8d_H3K9me3_i89_filtered-hg19-dm6-human.bed \
# # 03_2264CP_KARPAS-422_EZH2i_8d_H3K9me3_i91_filtered-hg19-dm6-human.bed \
# # 04_2264CP_KARPAS-422_DMSO_8d_H3K27me1_i92_filtered-hg19-dm6-human.bed \
# # 06_2264CP_KARPAS-422_EZH2i_8d_H3K27me1_i94_filtered-hg19-dm6-human.bed \
# # 07_2264CP_KARPAS-422_DMSO_8d_H3K27Ac_i95_filtered-hg19-dm6-human.bed \
# # 09_2264CP_KARPAS-422_EZH2i_8d_H3K27Ac_i73_filtered-hg19-dm6-human.bed \
# # 13_2264CP_KARPAS-422_DMSO_8d_H3K27me2_i82_filtered-hg19-dm6-human.bed \
# # 15_2264CP_KARPAS-422_EZH2i_8d_H3K27me2_i84_filtered-hg19-dm6-human.bed \
# # 16_2264CP_KARPAS-422_DMSO_8d_EED_i79_filtered-hg19-dm6-human.bed \
# # 18_2264CP_KARPAS-422_EZH2i_8d_EED_i81_filtered-hg19-dm6-human.bed

# do
#     IFS='_' eval 'array=($f)'
#     header=${array[3]}"_"${array[4]}"_"${array[5]}
#     echo $header
#     cd /mnt/gtklab01/ahjung/ezh2/results/mapping/chromhmm-all-8/makesegmentation/

# #    flyfactor=$(cat /mnt/officedata/ezh2/results/2015-05-28/normalisation_table.txt | grep $header | cut -f 2)
    
# #    for i in {1..20}; do
# #    	echo "=============================="
# #    	samtools sort /mnt/gtklab01/ahjung/ezh2/results/mapping/chromhmm-all-8/makesegmentation/KARPAS-422_20_segments-filtered-E$i-$header.bam /mnt/gtklab01/ahjung/ezh2/results/mapping/chromhmm-all-8/makesegmentation/KARPAS-422_20_segments-filtered-E$i-$header-sorted
# #    	/mnt/officedata/ezh2/scripts/ngsplot/bin/ngs.plot.r -G hg19 -D refseq -R tss -E /mnt/gtklab01/ahjung/ezh2/results/mapping/chromhmm-all-8/makesegmentation/KARPAS-422_20_segments-filtered-isolatedgenes-E$i-ID.bed -C /mnt/gtklab01/ahjung/ezh2/results/mapping/chromhmm-all-8/makesegmentation/KARPAS-422_20_segments-filtered-E$i-$header-sorted.bam -O /mnt/gtklab01/ahjung/ezh2/results/mapping/chromhmm-all-8/makesegmentation/analysis/E$i-$header-my -T E$i-$header-my -L 3000 -FL 300 -flynorm $flyfactor
# #    	done

#     for i in {1..20}; do
#     	config="config_E"$i"_"${array[5]}".txt"
#     	echo $config
#     	/mnt/officedata/ezh2/scripts/ngsplot/bin/ngs.plot.r -G hg19 -R tss -C config_files/$config -O analysis/$header-E$i -D refseq -FL 300
#     done

# done

cd /mnt/gtklab01/ahjung/ezh2/results/mapping/chromhmm-all-8/makesegmentation/
for ID in H3K4me3 H3K27me3 EZH2 Suz12
do
    for TYPE in bivalent monovalent retention
    do
	echo config_${TYPE}_${ID}.txt
	/mnt/officedata/ezh2/scripts/ngsplot/bin/ngs.plot.r -G hg19 -R tss -C config_file/config_${TYPE}_${ID}.txt -O analysis/${TYPE}_${ID} -D refseq -FL 300
    done
done




#/mnt/officedata/ezh2/scripts/ngsplot/bin/ngs.plot.r -G hg19 -R tss -C config_retention_EZH2.txt -O ../analysis/retention_EZH2 -D refseq -FL 300 ; /mnt/officedata/ezh2/scripts/ngsplot/bin/ngs.plot.r -G hg19 -R tss -C config_bivalent_EZH2.txt -O ../analysis/bivalent_EZH2 -D refseq -FL 300 ; /mnt/officedata/ezh2/scripts/ngsplot/bin/ngs.plot.r -G hg19 -R tss -C config_monovalent_EZH2.txt -O ../analysis/monovalent_EZH2 -D refseq -FL 300 ; /mnt/officedata/ezh2/scripts/ngsplot/bin/ngs.plot.r -G hg19 -R tss -C config_retention_H3K4me3.txt -O ../analysis/retention_H3K4me3 -D refseq -FL 300 ; /mnt/officedata/ezh2/scripts/ngsplot/bin/ngs.plot.r -G hg19 -R tss -C config_bivalent_H3K4me3.txt -O ../analysis/bivalent_H3K4me3 -D refseq -FL 300 ; /mnt/officedata/ezh2/scripts/ngsplot/bin/ngs.plot.r -G hg19 -R tss -C config_monovalent_H3K4me3.txt -O ../analysis/monovalent_H3K4me3 -D refseq -FL 300 ; /mnt/officedata/ezh2/scripts/ngsplot/bin/ngs.plot.r -G hg19 -R tss -C config_retention_Suz12.txt -O ../analysis/retention_Suz12 -D refseq -FL 300 ; /mnt/officedata/ezh2/scripts/ngsplot/bin/ngs.plot.r -G hg19 -R tss -C config_bivalent_Suz12.txt -O ../analysis/bivalent_Suz12 -D refseq -FL 300 ; /mnt/officedata/ezh2/scripts/ngsplot/bin/ngs.plot.r -G hg19 -R tss -C config_monovalent_Suz12.txt -O ../analysis/monovalent_Suz12 -D refseq -FL 300 ; /mnt/officedata/ezh2/scripts/ngsplot/bin/ngs.plot.r -G hg19 -R tss -C config_retention_H3K27me3.txt -O ../analysis/retention_H3K27me3 -D refseq -FL 300 ; /mnt/officedata/ezh2/scripts/ngsplot/bin/ngs.plot.r -G hg19 -R tss -C config_bivalent_H3K27me3.txt -O ../analysis/bivalent_H3K27me3 -D refseq -FL 300 ; /mnt/officedata/ezh2/scripts/ngsplot/bin/ngs.plot.r -G hg19 -R tss -C config_monovalent_H3K27me3.txt -O ../analysis/monovalent_H3K27me3 -D refseq -FL 300 
