#!/bin/sh
#PBS -l walltime=9999:00:00
#cd $PBS_O_WORKDIR

cd ~/NA/UDPCA

R CMD BATCH --args --zvcfile=/1KGP/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr01 blocking.R blocking_chr01
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr02 blocking.R blocking_chr02
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr03 blocking.R blocking_chr03
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr04 blocking.R blocking_chr04
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr05 blocking.R blocking_chr05
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr06 blocking.R blocking_chr06
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr07 blocking.R blocking_chr07
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr8.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr08 blocking.R blocking_chr08
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr09 blocking.R blocking_chr09
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr10 blocking.R blocking_chr10
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr11 blocking.R blocking_chr11
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr12 blocking.R blocking_chr12
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr13.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr13 blocking.R blocking_chr13
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr14 blocking.R blocking_chr14
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr15.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr15 blocking.R blocking_chr15
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr16 blocking.R blocking_chr16
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr17 blocking.R blocking_chr17
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr18 blocking.R blocking_chr18
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr19.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr19 blocking.R blocking_chr19
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr20.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr20 blocking.R blocking_chr20
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr21 blocking.R blocking_chr21
R CMD BATCH --args --zvcfile=/1KGP/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --indfile=integrated_call_samples_v3.20130502.ALL.panel --popu=AFR,AMR,EAS,EUR,SAS --outdir=/UDPCA/chr22 blocking.R blocking_chr22

R CMD BATCH --args --indir=/UDPCA --outdir=/UDPCA pSVD.R # execute after all blocking.R are finished

 