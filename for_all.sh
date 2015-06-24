#!/bin/bash
for f in config.eed.txt config.ezh2.txt config.suz12.txt config.h3k27ac.txt config.h3k27me1.txt config.h3k27me2.txt config.h3k27me3.txt config.h3k4me3.txt config.h3k9me3.txt

do

header=$(basename $f .txt | cut -c 8-)
echo "=============================="
echo $header
/mnt/officedata/ezh2/scripts/ngsplot/bin/ngs.plot.r -G hg19 -R genebody -C /mnt/officedata/ezh2/results/2015-05-28/mapping/plots/tss/$f -O /mnt/officedata/ezh2/results/2015-05-28/mapping/plots/genebody/$header -T $header -L 3000 -FL 300 -flynorm 1.3

done
