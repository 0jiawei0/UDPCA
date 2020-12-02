
rm(list = ls())

popu <- NULL

args <- commandArgs(T)
if(length(args)>0){
 args <- sapply(args,function(x)
 {
  x <- gsub("-","",x)
  x <- gsub("(.*)=(.*)","\\1='\\2'",x)
 })
 for(i in 1:length(args)) eval(parse(text=args[[i]]))

 arg <- c("zvcfile","indfile","popu","outdir")
 for(a in gsub("--(.*?)=.*","\\1",names(args))){
  switch(a,zvcfile = zvcfile <- zvcfile,
           indfile = indfile <- indfile,
           popu = popu <- unlist(strsplit(popu,",")),
           outdir = outpath <- outdir)
 }
}

pkgs <- .packages(all.available=T)
sapply(c("inline","Rcpp","RcppArmadillo"),function(x) if(!is.element(x,pkgs)) install.packages(x))

library(inline)
library(Rcpp)
library(RcppArmadillo)


code <- '
 arma::mat A = Rcpp::as<arma::mat>(a);
 int p = A.n_cols;
 arma::mat corA(p,p);
 corA = trans(A)*A;
 return Rcpp::wrap(corA);
'
rcppmultiply <- cxxfunction(signature(a="numeric"),code,plugin="RcppArmadillo")

if(!is.element("outpath",ls())) outpath <- sprintf("%s/Output",dirname(zvcfile))
dir.create(outpath, showWarnings = F)

ind <- read.table(indfile, sep = "\t", header = T, as.is = T, fill = T)

afCountry <- NULL
aTa_all <- 0
for(p in popu) assign(sprintf("aTa_%s",p),0)

nRows <- 1e5
colClasses <- c("NULL", "integer", "character", "character", "character" , rep("NULL", 4), rep("character", nrow(ind)))
part <- 1
part_cont <- T
while(part_cont){
 skip <- nRows*(part-1)

 gtype <- read.table(gzfile(zvcfile), header = F, sep = "\t", as.is = T, nrow = nRows, skip = skip, colClasses = colClasses)
  colnames(gtype) <- c("Phy_posi", "rsID", "REF", "ALT", ind[,1])

 idx.snv <-  which(as.numeric((nchar(gtype[,3])==1)+(nchar(gtype[,4])==1))==2)
 alleleCnt <- gtype[idx.snv,]
 alleleCnt <- lapply(alleleCnt, function(x) replace(x, x=="0|0", 0))
 alleleCnt <- lapply(alleleCnt, function(x) replace(x, x=="0|1", 1))
 alleleCnt <- lapply(alleleCnt, function(x) replace(x, x=="1|0", 1))
 alleleCnt <- as.data.frame(lapply(alleleCnt, function(x) replace(x, x=="1|1", 2)), stringsAsFactors = F)
 gc()
 save(alleleCnt, file = sprintf("%s/alleleCount_part%d.RData", outpath, part))

 alleleCnt <- as.matrix(alleleCnt[,-c(1:4)])
  class(alleleCnt) <- "integer"

 afALT <- rowMeans(alleleCnt,na.rm=T)
 tmp <- alleleCnt - afALT
 aTa_all <- aTa_all + rcppmultiply(tmp)

 if(!is.null(popu)){
  for(p in popu){
   tmp <- alleleCnt[,ind[,3]==p]
   afALT <- rowMeans(tmp,na.rm=T)
   tmp <- tmp - afALT
   assign(sprintf("aTa_%s",p),get(sprintf("aTa_%s",p)) + rcppmultiply(tmp))
  }
 }

 afCountry <- rbind(afCountry, sapply(unique(ind[,2]), function(x) rowMeans(alleleCnt[,ind[,2]==x,drop=F], na.rm=T)))

 part_cont <- !(nrow(alleleCnt)<nRows)
 part <- part + 1
}

save(list=ls()[grep("aTa_",ls())],file=sprintf("%s/aTa.RData",outpath))
save(afCountry,file=sprintf("%s/popuMAF.RData",outpath))

q(save = "no")

