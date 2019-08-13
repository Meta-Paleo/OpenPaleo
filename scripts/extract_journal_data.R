# Pull in relevant data from Journal data source files
# Replace with local directory where needed

Journal_data<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/Google_Scholar_journals_list_with_WoS_data.csv")

GS_rank<-Journal_data[,"GS_Rank"]
h5.index<-Journal_data[,"h5.index"]
Journal_names<-Journal_data[,"Publication"]
Journal_cites<-Journal_data[,"Total_cites"]
JIF_2016<-Journal_data[,"JIF_2016"]
WOS_rank<-Journal_data[,"WOS_rank"]


############# Acta Palaeontologica Polonica

# Note that some lines are still corrupted here, even after parsing. These were eliminated to avoid data errors (file version 2)
APP_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/09-Acta_Palaeontologica_Polonica/ActaPalaeontologicaPolonica_Scopus.csv")
APP_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/09-Acta_Palaeontologica_Polonica/ActaPalaeontologicaPolonica_Unpaywall.csv")

# Create a new factor for OA status
APP_OA<-APP_unpaywall[,"is_oa"]

APP_DOI<-APP_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
APP_cite<-APP_scopus[,"Cited.by"]
APP_cite[is.na(APP_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Acta Palaeontologica Polonica/APP_citefreq.png',
         width=1000,height=600)
APP_hist<-hist(APP_cite,col="red",xlab="Citation count",
               main="Acta Palaeontologica Polonica",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(APP_cite),max(APP_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(APP_cite),sd=sd(APP_cite)) 
yfit <- yfit*diff(APP_hist$mids[1:2])*length(APP_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.565,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Acta Palaeontologica Polonica/APP_citedensity.png',
         width=1000,height=600)
plot(density(APP_cite),xlab="Citation count",
     main="Acta Palaeontologica Polonica")
polygon((density(APP_cite)),col = "red")
abline(v=1.565,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(APP_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Acta Palaeontologica Polonica/APP_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(APP_OA)),main="Acta Palaeontologica Polonica, OA proportion")
dev.off()

########### Bulletin of Geosciences

BoG_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/17-Bulletin_of_Geosciences/BulletinofGeosciences_Scopus.csv")
BoG_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/17-Bulletin_of_Geosciences/BulletinofGeosciences_Unpaywall.csv")

# Create a new factor for OA status
BoG_OA<-BoG_unpaywall[,"is_oa"]

BoG_DOI<-BoG_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
BoG_cite<-BoG_scopus[,"Cited.by"]
BoG_cite[is.na(BoG_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Bulletin of Geosciences/BoG_citefreq.png',
         width=1000,height=600)
BoG_hist<-hist(BoG_cite,col="red",xlab="Citation count",
               main="Bulletin of Geosciences",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(BoG_cite),max(BoG_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(BoG_cite),sd=sd(BoG_cite)) 
yfit <- yfit*diff(BoG_hist$mids[1:2])*length(BoG_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.175,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Bulletin of Geosciences/BoG_citedensity.png',
         width=1000,height=600)
plot(density(BoG_cite),xlab="Citation count",
     main="Bulletin of Geosciences")
polygon((density(BoG_cite)),col = "red")
abline(v=1.175,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(BoG_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Bulletin of Geosciences/BoG_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(BoG_OA)),main="Bulletin of Geosciences, OA proportion")
dev.off()


########## Comptes Rendus Palevol

CRP_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/14-Comptes_Rendus_Palevol/ComptesRendusPalevol_Scopus.csv")
CRP_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/14-Comptes_Rendus_Palevol/ComptesRendusPalevol_Unpaywall.csv")

# Create a new factor for OA status
CRP_OA<-CRP_unpaywall[,"is_oa"]

CRP_DOI<-CRP_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
CRP_cite<-CRP_scopus[,"Cited.by"]
CRP_cite[is.na(CRP_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Comptes Rendus Palevol/CRP_citefreq.png',
         width=1000,height=600)
CRP_hist<-hist(CRP_cite,col="red",xlab="Citation count",
               main="Comptes Rendus Palevol",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(CRP_cite),max(CRP_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(CRP_cite),sd=sd(CRP_cite)) 
yfit <- yfit*diff(CRP_hist$mids[1:2])*length(CRP_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.376,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Comptes Rendus Palevol/CRP_citedensity.png',
         width=1000,height=600)
plot(density(CRP_cite),xlab="Citation count",
     main="Comptes Rendus Palevol")
polygon((density(CRP_cite)),col = "red")
abline(v=1.376,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(CRP_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Comptes Rendus Palevol/CRP_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(CRP_OA)),main="Comptes Rendus Palevol, OA proportion")
dev.off()


########## Cretaceous Research

CR_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/03-Cretaceous_Research/CretaceousResearch_Scopus.csv")
CR_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/03-Cretaceous_Research/CretaceousResearch_Unpaywall.csv")

# Create a new factor for OA status
CR_OA<-CR_unpaywall[,"is_oa"]

CR_DOI<-CR_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
CR_cite<-CR_scopus[,"Cited.by"]
CR_cite[is.na(CR_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Cretaceous Research/CR_citefreq.png',
         width=1000,height=600)
CR_hist<-hist(CR_cite,col="red",xlab="Citation count",
               main="Cretaceous Research",breaks=30)

# Add a normal distribution curve
xfit<-seq(min(CR_cite),max(CR_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(CR_cite),sd=sd(CR_cite)) 
yfit <- yfit*diff(CR_hist$mids[1:2])*length(CR_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=2.015,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Cretaceous Research/CR_citedensity.png',
         width=1000,height=600)
plot(density(CR_cite),xlab="Citation count",
     main="Cretaceous Research")
polygon((density(CR_cite)),col = "red")
abline(v=2.015,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(CR_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Cretaceous Research/CR_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(CR_OA)),main="Cretaceous Research, OA proportion")
dev.off()


########## Facies

Facies_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/15-Facies/Facies_Scopus.csv")
Facies_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/15-Facies/Facies_Unpaywall.csv")

# Create a new factor for OA status
Facies_OA<-Facies_unpaywall[,"is_oa"]

Facies_DOI<-Facies_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
Facies_cite<-Facies_scopus[,"Cited.by"]
Facies_cite[is.na(Facies_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Facies/Facies_citefreq.png',
         width=1000,height=600)
Facies_hist<-hist(Facies_cite,col="red",xlab="Citation count",
              main="Facies",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(Facies_cite),max(Facies_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(Facies_cite),sd=sd(Facies_cite)) 
yfit <- yfit*diff(Facies_hist$mids[1:2])*length(Facies_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.576,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Facies/Facies_citedensity.png',
         width=1000,height=600)
plot(density(Facies_cite),xlab="Citation count",
     main="Facies")
polygon((density(Facies_cite)),col = "red")
abline(v=1.576,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(Facies_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Facies/Facies_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(Facies_OA)),main="Facies, OA proportion")
dev.off()


########## Geobios

Geobios_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/18-Geobios/Geobios_Scopus.csv")
Geobios_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/18-Geobios/Geobios_Unpaywall.csv")

# Create a new factor for OA status
Geobios_OA<-Geobios_unpaywall[,"is_oa"]

Geobios_DOI<-Geobios_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
Geobios_cite<-Geobios_scopus[,"Cited.by"]
Geobios_cite[is.na(Geobios_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Geobios/Geobios_citefreq.png',
         width=1000,height=600)
Geobios_hist<-hist(Geobios_cite,col="red",xlab="Citation count",
                  main="Geobios",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(Geobios_cite),max(Geobios_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(Geobios_cite),sd=sd(Geobios_cite)) 
yfit <- yfit*diff(Geobios_hist$mids[1:2])*length(Geobios_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.431,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Geobios/Geobios_citedensity.png',
         width=1000,height=600)
plot(density(Geobios_cite),xlab="Citation count",
     main="Geobios")
polygon((density(Geobios_cite)),col = "red")
abline(v=1.431,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(Geobios_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Geobios/Geobios_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(Geobios_OA)),main="Geobios, OA proportion")
dev.off()


########## Historical Biology

HB_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/16-Historical_Biology/HistoricalBiology_Scopus.csv")
HB_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/16-Historical_Biology/HistoricalBiology_Unpaywall.csv")

# Create a new factor for OA status
HB_OA<-HB_unpaywall[,"is_oa"]

HB_DOI<-HB_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
HB_cite<-HB_scopus[,"Cited.by"]
HB_cite[is.na(HB_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Historical Biology/HB_citefreq.png',
         width=1000,height=600)
HB_hist<-hist(HB_cite,col="red",xlab="Citation count",
                   main="Historical Biology",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(HB_cite),max(HB_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(HB_cite),sd=sd(HB_cite)) 
yfit <- yfit*diff(HB_hist$mids[1:2])*length(HB_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.556,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Historical Biology/HB_citedensity.png',
         width=1000,height=600)
plot(density(HB_cite),xlab="Citation count",
     main="Historical Biology")
polygon((density(HB_cite)),col = "red")
abline(v=1.556,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(HB_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Historical Biology/HB_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(HB_OA)),main="Historical Biology, OA proportion")
dev.off()


########## Journal of Paleontology

JoP_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/06-Journal_of_Paleontology/JournalofPaleontology_Scopus.csv")
JoP_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/06-Journal_of_Paleontology/JournalofPaleontology_Unpaywall.csv")

# Create a new factor for OA status
JoP_OA<-JoP_unpaywall[,"is_oa"]

JoP_DOI<-JoP_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
JoP_cite<-JoP_scopus[,"Cited.by"]
JoP_cite[is.na(JoP_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Journal of Paleontology/JoP_citefreq.png',
         width=1000,height=600)
JoP_hist<-hist(JoP_cite,col="red",xlab="Citation count",
              main="Journal of Paleontology",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(JoP_cite),max(JoP_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(JoP_cite),sd=sd(JoP_cite)) 
yfit <- yfit*diff(JoP_hist$mids[1:2])*length(JoP_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.591,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Journal of Paleontology/JoP_citedensity.png',
         width=1000,height=600)
plot(density(JoP_cite),xlab="Citation count",
     main="Journal of Paleontology")
polygon((density(JoP_cite)),col = "red")
abline(v=1.591,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(JoP_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Journal of Paleontology/JoP_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(JoP_OA)),main="Journal of Paleontology, OA proportion")
dev.off()


########## Journal of Systematic Palaeontology

JSP_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/07-Journal_of_Systematic_Palaeontology/JournalofSystematicPalaeontology_Scopus.csv")
JSP_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/07-Journal_of_Systematic_Palaeontology/JournalofSystematicPalaeontology_Unpaywall.csv")

# Create a new factor for OA status
JSP_OA<-JSP_unpaywall[,"is_oa"]

JSP_DOI<-JSP_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
JSP_cite<-JSP_scopus[,"Cited.by"]
JSP_cite[is.na(JSP_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Journal of Systematic Palaeontology/JSP_citefreq.png',
         width=1000,height=600)
JSP_hist<-hist(JSP_cite,col="red",xlab="Citation count",
               main="Journal of Systematic Palaeontology",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(JSP_cite),max(JSP_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(JSP_cite),sd=sd(JSP_cite)) 
yfit <- yfit*diff(JSP_hist$mids[1:2])*length(JSP_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=2.963,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Journal of Systematic Palaeontology/JSP_citedensity.png',
         width=1000,height=600)
plot(density(JSP_cite),xlab="Citation count",
     main="Journal of Systematic Palaeontology")
polygon((density(JSP_cite)),col = "red")
abline(v=2.963,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(JSP_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Journal of Systematic Palaeontology/JSP_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(JSP_OA)),main="Journal of Systematic Palaeontology, OA proportion")
dev.off()


########## Journal of Vertebrate Paleontology

JVP_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/02-Journal_of_Vertebrate_Paleontology/JournalofVertebratePaleontology_Scopus.csv")
JVP_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/02-Journal_of_Vertebrate_Paleontology/JournalofVertebratePaleontology_Unpaywall.csv")

# Create a new factor for OA status
JVP_OA<-JVP_unpaywall[,"is_oa"]

JVP_DOI<-JVP_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
JVP_cite<-JVP_scopus[,"Cited.by"]
JVP_cite[is.na(JVP_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Journal of Vertebrate Paleontology/JVP_citefreq.png',
         width=1000,height=600)
JVP_hist<-hist(JVP_cite,col="red",xlab="Citation count",
               main="Journal of Vertebrate Paleontology",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(JVP_cite),max(JVP_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(JVP_cite),sd=sd(JVP_cite)) 
yfit <- yfit*diff(JVP_hist$mids[1:2])*length(JVP_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=2.114,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Journal of Vertebrate Paleontology/JVP_citedensity.png',
         width=1000,height=600)
plot(density(JVP_cite),xlab="Citation count",
     main="Journal of Vertebrate Paleontology")
polygon((density(JVP_cite)),col = "red")
abline(v=2.114,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(JVP_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Journal of Vertebrate Paleontology/JVP_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(JVP_OA)),main="Journal of Vertebrate Paleontology, OA proportion")
dev.off()


########## Lethaia

Lethaia_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/12-Lethaia/Lethaia_Scopus.csv")
Lethaia_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/12-Lethaia/Lethaia_Unpaywall.csv")

# Create a new factor for OA status
Lethaia_OA<-Lethaia_unpaywall[,"is_oa"]

Lethaia_DOI<-Lethaia_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
Lethaia_cite<-Lethaia_scopus[,"Cited.by"]
Lethaia_cite[is.na(Lethaia_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Lethaia/Lethaia_citefreq.png',
         width=1000,height=600)
Lethaia_hist<-hist(Lethaia_cite,col="red",xlab="Citation count",
               main="Lethaia",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(Lethaia_cite),max(Lethaia_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(Lethaia_cite),sd=sd(Lethaia_cite)) 
yfit <- yfit*diff(Lethaia_hist$mids[1:2])*length(Lethaia_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=2.281,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Lethaia/Lethaia_citedensity.png',
         width=1000,height=600)
plot(density(Lethaia_cite),xlab="Citation count",
     main="Lethaia")
polygon((density(Lethaia_cite)),col = "red")
abline(v=2.281,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(Lethaia_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Lethaia/Lethaia_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(Lethaia_OA)),main="Lethaia, OA proportion")
dev.off()


########## Marine Micropaleontology

MM_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/10-Marine_Micropaleontology/MarineMicropaleontology_Scopus.csv")
MM_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/10-Marine_Micropaleontology/MarineMicropaleontology_Unpaywall.csv")

# Create a new factor for OA status
MM_OA<-MM_unpaywall[,"is_oa"]

MM_DOI<-MM_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
MM_cite<-MM_scopus[,"Cited.by"]
MM_cite[is.na(MM_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Marine Micropaleontology/MM_citefreq.png',
         width=1000,height=600)
MM_hist<-hist(MM_cite,col="red",xlab="Citation count",
                   main="Marine Micropaleontology",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(MM_cite),max(MM_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(MM_cite),sd=sd(MM_cite)) 
yfit <- yfit*diff(MM_hist$mids[1:2])*length(MM_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.889,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Marine Micropaleontology/MM_citedensity.png',
         width=1000,height=600)
plot(density(MM_cite),xlab="Citation count",
     main="Marine Micropaleontology")
polygon((density(MM_cite)),col = "red")
abline(v=1.889,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
summary(MM_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Marine Micropaleontology/MM_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(MM_OA)),main="Marine Micropaleontology, OA proportion")
dev.off()


########## Palaeobiodiversity and Palaeoenvironments

PP_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/19-Palaeobiodiversity_and_Palaeoenvironments/PalaeobiodiversityandPalaeoenvironments_Scopus.csv")
PP_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/19-Palaeobiodiversity_and_Palaeoenvironments/PalaeobiodiversityandPalaeoenvironments_Unpaywall.csv")

# Create a new factor for OA status
PP_OA<-PP_unpaywall[,"is_oa"]

PP_DOI<-PP_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
PP_cite<-PP_scopus[,"Cited.by"]
PP_cite[is.na(PP_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Palaeobiodiversity and Palaeoenvironments/PP_citefreq.png',
         width=1000,height=600)
PP_hist<-hist(PP_cite,col="red",xlab="Citation count",
              main="Palaeobiodiversity and Palaeoenvironments",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(PP_cite),max(PP_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(PP_cite),sd=sd(PP_cite)) 
yfit <- yfit*diff(PP_hist$mids[1:2])*length(PP_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.278,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Palaeobiodiversity and Palaeoenvironments/PP_citedensity.png',
         width=1000,height=600)
plot(density(PP_cite),xlab="Citation count",
     main="Palaeobiodiversity and Palaeoenvironments")
polygon((density(PP_cite)),col = "red")
abline(v=1.278,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# SuPParise how many articles are OA and how many are not
summary(PP_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Palaeobiodiversity and Palaeoenvironments/PP_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(PP_OA)),main="Palaeobiodiversity and Palaeoenvironments, OA proportion")
dev.off()


############## Palaeogeography, Palaeoclimatology, Palaeoecology

PPP_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/01-Palaeogeography_Palaeoclimatology_Palaeoecology/PalaeogeographyPalaeoclimatologyPalaeoecology_Scopus.csv")
PPP_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/01-Palaeogeography_Palaeoclimatology_Palaeoecology/PalaeogeographyPalaeoclimatologyPalaeoecology_Unpaywall.csv")

# Create a new factor for OA status
PPP_OA<-PPP_unpaywall[,"is_oa"]

PPP_DOI<-PPP_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
PPP_cite<-PPP_scopus[,"Cited.by"]
PPP_cite[is.na(PPP_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Palaeogeography, Palaeoclimatology, Palaeoecology/PPP_citefreq.png',
         width=1000,height=600)
PPP_hist<-hist(PPP_cite,col="red",xlab="Citation count",
              main="Palaeogeography, Palaeoclimatology, Palaeoecology",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(PPP_cite),max(PPP_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(PPP_cite),sd=sd(PPP_cite)) 
yfit <- yfit*diff(PPP_hist$mids[1:2])*length(PPP_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=2.578,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Palaeogeography, Palaeoclimatology, Palaeoecology/PPP_citedensity.png',
         width=1000,height=600)
plot(density(PPP_cite),xlab="Citation count",
     main="Palaeogeography, Palaeoclimatology, Palaeoecology")
polygon((density(PPP_cite)),col = "red")
abline(v=2.578,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# SuPPParise how many articles are OA and how many are not
summary(PPP_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Palaeogeography, Palaeoclimatology, Palaeoecology/PPP_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(PPP_OA)),main="Palaeogeography, Palaeoclimatology, Palaeoecology, OA proportion")
dev.off()


############## Palaeontologia Electronica

# Note these data do not have DOIs

PE_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/13-Palaeontologia_Electronica/PalaeontologiaElectronica_Scopus.csv")
PE_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/13-Palaeontologia_Electronica/PalaeontologiaElectronica_Unpaywall.csv")

# Create a new factor for OA status
PE_OA<-PE_unpaywall[,"is_oa"]

# Pull out citation counts, and replace NAs with zero counts
PE_cite<-PE_scopus[,"Cited.by"]
PE_cite[is.na(PE_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Palaeontologia Electronica/PE_citefreq.png',
         width=1000,height=600)
PE_hist<-hist(PE_cite,col="red",xlab="Citation count",
               main="Palaeontologia Electronica",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(PE_cite),max(PE_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(PE_cite),sd=sd(PE_cite)) 
yfit <- yfit*diff(PE_hist$mids[1:2])*length(PE_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.400,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Palaeontologia Electronica/PE_citedensity.png',
         width=1000,height=600)
plot(density(PE_cite),xlab="Citation count",
     main="Palaeontologia Electronica")
polygon((density(PE_cite)),col = "red")
abline(v=1.400,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Summarise how many articles are OA and how many are not
# Redundant - in this case will be 100%
# summary(PE_OA)

# Plot as a proportional barplot
# dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Palaeontologia Electronica/PE_OAprop.png',
#         width=1000,height=600)
# barplot(prop.table(table(PE_OA)),main="Palaeontologia Electronica, OA proportion")
# dev.off()


############## Palaeontology

Palaeontology_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/04-Palaeontology/Palaeontology_Scopus.csv")
Palaeontology_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/04-Palaeontology/Palaeontology_Unpaywall.csv")

# Create a new factor for OA status
Palaeontology_OA<-Palaeontology_unpaywall[,"is_oa"]

Palaeontology_DOI<-Palaeontology_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
Palaeontology_cite<-Palaeontology_scopus[,"Cited.by"]
Palaeontology_cite[is.na(Palaeontology_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Palaeontology/Palaeontology_citefreq.png',
         width=1000,height=600)
Palaeontology_hist<-hist(Palaeontology_cite,col="red",xlab="Citation count",
               main="Palaeontology",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(Palaeontology_cite),max(Palaeontology_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(Palaeontology_cite),sd=sd(Palaeontology_cite)) 
yfit <- yfit*diff(Palaeontology_hist$mids[1:2])*length(Palaeontology_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=3.132,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Palaeontology/Palaeontology_citedensity.png',
         width=1000,height=600)
plot(density(Palaeontology_cite),xlab="Citation count",
     main="Palaeontology")
polygon((density(Palaeontology_cite)),col = "red")
abline(v=3.132,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# SuPalaeontologyarise how many articles are OA and how many are not
summary(Palaeontology_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Palaeontology/Palaeontology_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(Palaeontology_OA)),main="Palaeontology, OA proportion")
dev.off()


############## Palaios

Palaios_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/11-Palaios/Palaios_Scopus.csv")
Palaios_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/11-Palaios/Palaios_Unpaywall.csv")

# Create a new factor for OA status
Palaios_OA<-Palaios_unpaywall[,"is_oa"]

Palaios_DOI<-Palaios_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
Palaios_cite<-Palaios_scopus[,"Cited.by"]
Palaios_cite[is.na(Palaios_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Palaios/Palaios_citefreq.png',
         width=1000,height=600)
Palaios_hist<-hist(Palaios_cite,col="red",xlab="Citation count",
                         main="Palaios",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(Palaios_cite),max(Palaios_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(Palaios_cite),sd=sd(Palaios_cite)) 
yfit <- yfit*diff(Palaios_hist$mids[1:2])*length(Palaios_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.983,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Palaios/Palaios_citedensity.png',
         width=1000,height=600)
plot(density(Palaios_cite),xlab="Citation count",
     main="Palaios")
polygon((density(Palaios_cite)),col = "red")
abline(v=1.983,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# SuPalaiosarise how many articles are OA and how many are not
summary(Palaios_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Palaios/Palaios_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(Palaios_OA)),main="Palaios, OA proportion")
dev.off()


############## Pal?ontologische Zeitschrift

PZ_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/20-Paläontologische_Zeitschrift/PaläontologischeZeitschrift_Scopus.csv")
PZ_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/20-Paläontologische_Zeitschrift/PaläontologischeZeitschrift_Unpaywall.csv")

# Create a new factor for OA status
PZ_OA<-PZ_unpaywall[,"is_oa"]

PZ_DOI<-PZ_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
PZ_cite<-PZ_scopus[,"Cited.by"]
PZ_cite[is.na(PZ_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Pal?ontologische Zeitschrift/Pal?ontologischeZeitschrift_citefreq.png',
         width=1000,height=600)
PZ_hist<-hist(PZ_cite,col="red",xlab="Citation count",
                   main="Pal?ontologische Zeitschrift",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(PZ_cite),max(PZ_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(PZ_cite),sd=sd(PZ_cite)) 
yfit <- yfit*diff(PZ_hist$mids[1:2])*length(PZ_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.095,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Pal?ontologische Zeitschrift/Pal?ontologischeZeitschrift_citedensity.png',
         width=1000,height=600)
plot(density(PZ_cite),xlab="Citation count",
     main="PZ")
polygon((density(PZ_cite)),col = "red")
abline(v=1.095,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# SuPZarise how many articles are OA and how many are not
summary(PZ_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Pal?ontologische Zeitschrift/Pal?ontologische Zeitschrift_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(PZ_OA)),main="Pal?ontologische Zeitschrift, OA proportion")
dev.off()


############## Paleobiology

Paleobiology_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/08-Paleobiology/Paleobiology_Scopus.csv")
Paleobiology_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/08-Paleobiology/Paleobiology_Unpaywall.csv")

# Create a new factor for OA status
Paleobiology_OA<-Paleobiology_unpaywall[,"is_oa"]

Paleobiology_DOI<-Paleobiology_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
Paleobiology_cite<-Paleobiology_scopus[,"Cited.by"]
Paleobiology_cite[is.na(Paleobiology_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Paleobiology/Paleobiology_citefreq.png',
         width=1000,height=600)
Paleobiology_hist<-hist(Paleobiology_cite,col="red",xlab="Citation count",
              main="Paleobiology",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(Paleobiology_cite),max(Paleobiology_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(Paleobiology_cite),sd=sd(Paleobiology_cite)) 
yfit <- yfit*diff(Paleobiology_hist$mids[1:2])*length(Paleobiology_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.095,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Paleobiology/Paleobiology_citedensity.png',
         width=1000,height=600)
plot(density(Paleobiology_cite),xlab="Citation count",
     main="Paleobiology")
polygon((density(Paleobiology_cite)),col = "red")
abline(v=1.095,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# SuPaleobiologyarise how many articles are OA and how many are not
summary(Paleobiology_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Paleobiology/Paleobiology_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(Paleobiology_OA)),main="Paleobiology, OA proportion")
dev.off()


############## Review of Palaeobotany and Palynology

RPP_scopus<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/05-Review_of_Palaeobotany_and_Palynology/ReviewofPalaeobotanyandPalynology_Scopus.csv")
RPP_unpaywall<-read.csv("C:/Users/PC/Documents/GitHub/OpenPaleo/data/journal_data/05-Review_of_Palaeobotany_and_Palynology/ReviewofPalaeobotanyandPalynology_Unpaywall.csv")

# Create a new factor for OA status
RPP_OA<-RPP_unpaywall[,"is_oa"]

RPP_DOI<-RPP_scopus[,"DOI"]

# Pull out citation counts, and replace NAs with zero counts
RPP_cite<-RPP_scopus[,"Cited.by"]
RPP_cite[is.na(RPP_cite)]<-0

# Histogram plot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Review of Palaeobotany and Palynology/RPP_citefreq.png',
         width=1000,height=600)
RPP_hist<-hist(RPP_cite,col="red",xlab="Citation count",
                        main="Review of Palaeobotany and Palynology",breaks=20)

# Add a normal distribution curve
xfit<-seq(min(RPP_cite),max(RPP_cite),length=100) 
yfit<-dnorm(xfit,mean=mean(RPP_cite),sd=sd(RPP_cite)) 
yfit <- yfit*diff(RPP_hist$mids[1:2])*length(RPP_cite)
lines(xfit,yfit,col="blue",lwd=2)
abline(v=1.817,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# Try a density plot instead
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/Citation analysis/Review of Palaeobotany and Palynology/RPP_citedensity.png',
         width=1000,height=600)
plot(density(RPP_cite),xlab="Citation count",
     main="Review of Palaeobotany and Palynology")
polygon((density(RPP_cite)),col = "red")
abline(v=1.817,col="blue",lwd=2,lty=2) # 2016 JIF
dev.off()

# SuRPParise how many articles are OA and how many are not
summary(RPP_OA)

# Plot as a proportional barplot
dev.copy(png,'C:/Users/PC/Documents/GitHub/OpenPaleo/Results/OA analysis/Review of Palaeobotany and Palynology/RPP_OAprop.png',
         width=1000,height=600)
barplot(prop.table(table(RPP_OA)),main="Review of Palaeobotany and Palynology, OA proportion")
dev.off()