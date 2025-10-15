library(readr)

#part2
twoa<-read_rds("https://github.com/bmaitner/Statistical_ecology_course/raw/refs/heads/main/midterm/2a.RDS")
twob<-read_rds("https://github.com/bmaitner/Statistical_ecology_course/raw/refs/heads/main/midterm/2b.RDS")
twoc<-read_rds("https://github.com/bmaitner/Statistical_ecology_course/raw/refs/heads/main/midterm/2c.RDS")
plot(x=twoa$Mass, y=twoa$Wing.Length)
hist(twoa$Mass)
plot(x=twob$Beak.Length,y=twob$Beak.Width)
hist(twob$Beak.Width)
#For both a and b I would use the power law function as y increases with x with a relationship 
#between the two variables. I would use a lognormal distribution for a as there is a strong right skew
#with continuous data and a range of 0-infinity. I would use gamma distribution for b since there is still a 
#right skew with continuous data. 
plot(x=twoc$Functional.Richness,y=twoc$Functional.Evenness)
hist(twoc$Functional.Richness)
#For c, I would use a Michaelis-Menten function and a beta distribution since the data
#falls between 0 and 1, is continuous and does not have a strong skew. 

#part3
sample_size<-10
a<-2
sd<-8
nsim<-400
bvec<-seq(-2,2, by=0.1)
power.b<-numeric(length(bvec))
pval<-numeric(nsim)
for (j in 1:length(bvec)) {
  for (i in 1:nsim){
    x<-sample(x=1:20,
              size=sample_size,
              replace=TRUE)
    b<-bvec[j]
    y_det<-a+b*x
    y<-rnorm(n=length(y_det),
             mean=y_det,
             sd=sd)
    m<-lm(y~x)
    pval[i]<-coef(summary(m))["x","Pr(>|t|)"]
  power.b[j]<-sum(pval<0.05)/nsim
  }
}
plot(power.b~bvec,main=sample_size) #figure 1
sample_size<-20
a<-2
sd<-8
nsim<-400
bvec<-seq(-2,2, by=0.1)
power.b<-numeric(length(bvec))
pval<-numeric(nsim)
for (j in 1:length(bvec)) {
  for (i in 1:nsim){
    x<-sample(x=1:20,
              size=sample_size,
              replace=TRUE)
    b<-bvec[j]
    y_det<-a+b*x
    y<-rnorm(n=length(y_det),
             mean=y_det,
             sd=sd)
    m<-lm(y~x)
    pval[i]<-coef(summary(m))["x","Pr(>|t|)"]
    power.b[j]<-sum(pval<0.05)/nsim
  }
}
plot(power.b~bvec,main=sample_size) #figure 2
sample_size<-40
a<-2
sd<-8
nsim<-400
bvec<-seq(-2,2, by=0.1)
power.b<-numeric(length(bvec))
pval<-numeric(nsim)
for (j in 1:length(bvec)) {
  for (i in 1:nsim){
    x<-sample(x=1:20,
              size=sample_size,
              replace=TRUE)
    b<-bvec[j]
    y_det<-a+b*x
    y<-rnorm(n=length(y_det),
             mean=y_det,
             sd=sd)
    m<-lm(y~x)
    pval[i]<-coef(summary(m))["x","Pr(>|t|)"]
    power.b[j]<-sum(pval<0.05)/nsim
  }
}
plot(power.b~bvec,main=sample_size) #figure 3
sample_size<-80
a<-2
sd<-8
nsim<-400
bvec<-seq(-2,2, by=0.1)
power.b<-numeric(length(bvec))
pval<-numeric(nsim)
for (j in 1:length(bvec)) {
  for (i in 1:nsim){
    x<-sample(x=1:20,
              size=sample_size,
              replace=TRUE)
    b<-bvec[j]
    y_det<-a+b*x
    y<-rnorm(n=length(y_det),
             mean=y_det,
             sd=sd)
    m<-lm(y~x)
    pval[i]<-coef(summary(m))["x","Pr(>|t|)"]
    power.b[j]<-sum(pval<0.05)/nsim
  }
}
plot(power.b~bvec,main=sample_size) #figure 4
sample_size<-160
a<-2
sd<-8
nsim<-400
bvec<-seq(-2,2, by=0.1)
power.b<-numeric(length(bvec))
pval<-numeric(nsim)
for (j in 1:length(bvec)) {
  for (i in 1:nsim){
    x<-sample(x=1:20,
              size=sample_size,
              replace=TRUE)
    b<-bvec[j]
    y_det<-a+b*x
    y<-rnorm(n=length(y_det),
             mean=y_det,
             sd=sd)
    m<-lm(y~x)
    pval[i]<-coef(summary(m))["x","Pr(>|t|)"]
    power.b[j]<-sum(pval<0.05)/nsim
  }
}
plot(power.b~bvec,main=sample_size) #figure 6
#Plots with larger sample sizes yielded a higher power and steeper slope.
#As you increase sample size, the likelihood that significant effects will be detected increases, therefore increasing power. 
#A steeper slope represents a stronger relationship between the variables being tested, once more increasing power. 
#This is evident when comparing figures 1-6 with each other. 

#part1
library(readxl)
read_excel("C:/Users/schut/Downloads/Waterhole_Data.xlsx")
wathole=read_excel("C:/Users/schut/Downloads/Waterhole_Data.xlsx")
read_excel("C:/Users/schut/Downloads/Waterhole_Data 1.xlsx")
Elephant=read_excel("C:/Users/schut/Downloads/Waterhole_Data 1.xlsx")
read_excel("C:/Users/schut/Downloads/Waterhole_Data 2.xlsx")
BlkRhno=read_excel("C:/Users/schut/Downloads/Waterhole_Data 2.xlsx")
read_excel("C:/Users/schut/Downloads/Waterhole_Data 3.xlsx")
WhtRhno=read_excel("C:/Users/schut/Downloads/Waterhole_Data 3.xlsx")
str(wathole)
#Adjust classes and recheck
wathole$Species<-as.integer(wathole$Species)
#Elephant(1),black rhino(2),white rhino(3)
class(wathole$Species)
wathole$WH<-as.integer(wathole$WH)
#IDs for each WH
wathole$WHType<-as.integer(wathole$WHType)
#Earth Dam (1), Concrete (2), Pan (3), Reservoir (4), Trough (5)
wathole$WHSize<-as.integer(wathole$WHSize)
#Small (1), Medium (2), Large (3)
wathole$Date<-as.Date(wathole$Date,format="%m/%d/%Y")
#Somehow Date data was replaced with NA.
wathole$Season<-as.integer(wathole$Season)
#Wet (1) or Dry (2). Somehow Season data was replaced with NA
wathole$Period<-as.integer(wathole$Period)
#Daily period - Morning (1), Midday (2), Afternoon (3), Night (4)
wathole$GroupType<-as.integer(wathole$GroupType)
#Social group type - Bachelor (1), Bachelor Group (2)
#Cow (3),Cow group (4), Cow and calf (5)
#Unknown adult (6),Breeding herd (7), Bull and cow (8)
wathole$GroundAccess<-as.logical(wathole$GroundAccess)

#FiguresPart1
plot(x=wathole$DurationMins, y=wathole$Species, main="Amount of Time Taken at Watering Hole",xlab="Duration (minutes)",ylab="Species Type")
plot(x=wathole$NoAnimals,y=wathole$Species, main="Number of Other Animals at Watering Hole at Time of Sighting",xlab="Number of Animals",ylab="Species Type")
plot(x=wathole$WoodySpHeightCM,y=wathole$Species, main="Species Sighting vs Woody Plant Height",xlab="Height of Woody Plants (cm) Surrounding Watering Holes", ylab="Species Type")

#use these
hist(Elephant$WHType, ylim = c(0,350),main="Elephant Count")
hist(BlkRhno$WHType,ylim=c(0,80),main="Black Rhino Count")
hist(WhtRhno$WHType,ylim=c(0,15),main="White Rhino Count")

hist(Elephant$DurationMins,ylim=c(0,600))
hist(Elephant$NoAnimals, ylim=c(0,500))

#use these
plot(x=Elephant$WHType,y=Elephant$DurationMins,main="Time Recorded at Watering Holes by African Elephants",xlab="Waterhole Type - Earth Dam (1), Concrete (2), Pan (3), Reservoir (4), Trough (5)",ylab="Duration (Minutes)")
plot(x=BlkRhno$WHType,y=BlkRhno$DurationMins,main="Time Recorded at Watering Holes by Black Rhinos",xlab="Waterhole Type - Earth Dam (1), Concrete (2), Pan (3), Reservoir (4), Trough (5)",ylab="Duration (Minutes)")
plot(x=WhtRhno$WHType,y=WhtRhno$DurationMins,main="Time Recorded at Watering Holes by White Rhinos",xlab="Waterhole Type - Earth Dam (1), Concrete (2), Pan (3), Reservoir (4), Trough (5)",ylab="Duration (Minutes)")

#citations
citation("readr")
citation("readxl")
citation()