library(data.table)
library(dplyr)


rowname_vector<-c()
for (i in 1:6){
  assign(paste0('s',i),read.table(paste0("/home/junwoojo/sample",i,"_matrix"),header = T))
  zzz<-get(paste0('s',i))
  colnames(zzz)<-gsub("\\.","-",colnames(get(paste0('s',i))))
  colnames(zzz)<-paste0("sample",i,"_",colnames(zzz))
  rowname_vector<-append(rowname_vector,zzz%>%colnames())
  assign(paste0('s',i),zzz)
  assign(paste0("s",i,"_t"),t(zzz)%>%as.data.frame())
}
singlecell_microbiome_matrix<-rbindlist(lapply(paste0("s",1:6,"_t"),get),fill = T)%>%as.data.frame()
rownames(singlecell_microbiome_matrix)<-rowname_vector



