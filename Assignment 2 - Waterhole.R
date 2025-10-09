library(readxl)
read_excel("C:/Users/schut/Downloads/Waterhole_Data.xlsx")
wathole=read_excel("C:/Users/schut/Downloads/Waterhole_Data.xlsx")
hist(wathole$WHType)
summary(wathole)
class(wathole)
str(wathole)
class(wathole$Species)
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
hist(wathole$DurationMins, main = "Time Spent at Watering Hole", xlab = "Minutes", ylab = "Frequency")
hist(wathole$NoAnimals, main="Number of Animals at Watering Hole", xlab = "Number of Animals",ylab = "Frequency",ylim = c(0,600))
hist(wathole$WoodySpDensity, main = "Density of Woody Plants Surrounding Watering Hole", xlab = "Density", ylab = "Frequency", ylim = c(0,250))
#I cannot figure out what the units or values are for density. Is it a percentage? If so, does a value of 9 actually mean 90 percent? Or 9 percent? Reading the study, I feel like it is the former. 
hist(wathole$WoodySpHeight)
hist(wathole$WoodySpHeightCM, main = "Height of Woody Plants Surrounding Watering Hole", xlab = "Height (cm)", ylab = "Frequency", ylim = c(0,250))
#The variables I am interested in are:

#Duration of Time (mins) each subject spent at the watering hole. Line 29
#This shows how much use each watering hole received from each subject.
#Important because it ensures that a 20 second visit does not hold the same value that a 6 minute visit does. Length of time can 
#serve as a indicator of each individual's comfort level at the watering hole.
#Right skewed data. Continuous. Gamma. 

#The number of other animals at the watering hole at the same time as the subject. Line 30
#This variable could affect the duration of time/waterhole type chosen by individuals. Elephants and white rhinos are social species 
#while black rhinos live more solitary lives. Inter and intra species behavior should be taken into account while evaluating this variable. 
#Right skewed data. Discrete. Negative Binomial. 

#The density of woody plants surrounding the watering hole. Line 31
#All three species are prey. High density vegetation could provide predator protection. Additionally, black rhinos browse on woody plants. There
#could be a correlation between black rhinos and higher density as they may naturally occur more in those areas. 
#Continuous. If percentage, beta.

#The height of woody plants surrounding the watering hole. Line 34
#Height of plants could show predator trends, along with browsing habits, affecting species count at different watering holes. 
#Slight right skew, generally uniform. Continuous. Lognormal.

#This study aims to find the watering hole type preferences (if any) of 3 African species. In addition to the numeric values listed above
#I would like to examine a few of the integer values. 

#PART 1
#Number of surviving individuals within a forest plot
#Binomial - discrete data with a finite range of 0 to original population. 
#Species abundance (counts of individuals in a plot)
#Lognormal - continuous with a zero to infinite range. 
#Species richness (number of species in a sample)
#Lognormal - continuous with a zero to infinite range. 
#Ages (in years) of surviving individuals within a reserve
#Gamma - commonly used for survival time
#Body size (e.g., body mass, length)
#Lognormal - right skewed
#Population growth rate
#Gamma - continuous with 0-infinate range.
#Proportion of habitat covered by vegetation
#Uniform - 0-1 range, continuous
#Biomass per unit area
#Lognormal - continuous with a 0-infinite range
#Seed counts per plant
#Negative binomial - discrete right skew
#Time to germination
#Gamma - continuous 0-infinite range 
#Distance moved by an animal (step lengths in movement data)
#Gamma - continuous with a 0-infinity range
#Pollinator visitation rate (visits per flower per unit time)
#Gamma - data is continuous since it reads like an average would depending on how the information is recorded
#Leaf area measurements
#Lognormal - range of 0-infinity with a continuous measurement
#Environmental variables (temperature, rainfall, pH)
#Normal - some values can take negative values, no skew, continuous data. 
#Prey consumed per day
#Poisson- Discrete data since it counts individuals. 0-infinity range. 
#Fish counts on reef transects
#Negative binomial- Discrete data 
#Proportion of coral cover on a reef
#Uniform - Continuous data, with a 0-1 range
#Larval settlement success (number settled out of larvae released)
#Uniform or Beta - Continuous data with a 0-1 range
#Time to mortality under hypoxia experiments (fish, invertebrates)
#Gamma- Continuous, commonly used to measure survival times
#Proportion of infected fish in a population (parasite prevalence)
#Uniform or Beta - Both continuous with a 0-1 range
