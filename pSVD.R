
rm(list=ls())

args <- commandArgs(T)
if(length(args)>0){
 args <- sapply(args,function(x)
 {
  x <- gsub("-","",x)
  x <- gsub("(.*)=(.*)","\\1='\\2'",x)
 })
 for(i in 1:length(args)) eval(parse(text=args[[i]]))

 if(!is.element("indir",ls())) stop("Cannot find the input directory!!\n")

 arg <- c("indir","outdir")
 for(a in gsub("--(.*?)=.*","\\1",names(args))) {
  switch(a,indir = inpath <- indir,
           outdir = outpath <- outdir)
 }
}
dir.create(outpath,showWarnings=F)

pkgs <- .packages(all.available=T)
sapply(c("gtools"),function(x) if(!is.element(x,pkgs)) install.packages(x))

library(gtools)

infile <- mixedsort(dir(inpath,pattern="^aTa.RData",full.name=T,recursive=T))

load(infile[1]) # aTa_*
popu <- gsub("aTa_","",ls(pattern="aTa_"))

for(p in popu) assign(sprintf("aTa_%s_",p),0)

for(i in infile){
 load(i)
 for(p in popu) assign(sprintf("aTa_%s_",p),get(sprintf("aTa_%s_",p)) + get(sprintf("aTa_%s",p)))
}
save(list=ls()[grep("aTa_.*_",ls())],file=sprintf("%s/aTa_wg.RData",outpath))

for(p in popu){
 tmp <- eigen(get(sprintf("aTa_%s_",p)))
 assign(sprintf("V_%s",p),list(eigenvalue=round(tmp$values*1e6)/1e6,eigenvector=tmp$vectors))
}

save(list=ls()[grep("V_",ls())], file = sprintf("%s/V_wg.RData",outpath))

q(save = "no")


