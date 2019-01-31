#Taken directly from Executive Reports - 
#Freely avaialable at https://www.acha.org/NCHA/NCHA_Home

ACHA_year<-c(2018, 2017.5, 2017, 2016.5, 2016, 2015.5, 2015, 2014.5, 2014, 2013.5, 2013, 2012.5, 2012, 2011.5)

#The degree to which anxiety/depression was severe enough to effect academic performance
ACHA_anx_aca<-c(26.5, 25.1, 24.2, 24.9, 23.2, 23.7, 21.9, 21.3, 21.8, 19.7, 19.7, 19.3, 20.2, 19.9)
ACHA_dep_aca<-c(18.7, 16.8, 15.9, 15.4, 15.4, 14.6, 13.8, 13.2, 13.5, 12.0, 12.6, 11.3, 12.4, 11.9)

#The degree to which anxiety/depression was overwhelming in last 12 months
ACHA_anx_12mo<-c(63.4, 60.9, 60.8, 60.8, 58.4, 57.7, 56.9, 56, 54, 51, 51, 49.9, 50.7, 49.9)
ACHA_dep_12mo<-c(41.9, 39.3, 39.1, 38.2, 36.7, 35.3, 34.5, 33.5, 32.6, 30.9, 31.3, 29.5, 31.3, 30.3)

#Self-Harm (last 12 months) & Suicidal Ideation
ACHA_SH_12mo<-c(7.8, 7.8, 7, 6.9, 6.7, 6.5, 6.3, 6.2, 6.4, 5.9, 5.9, 5.5, 5.5, 5.2)
ACHA_SI_12mo<-c(12.1, 12.1, 10.3, 10.4, 9.8, 9.6, 8.9, 8.7, 8.1, 7.5, 7.4, 6.9, 7.1, 6.6)

dat<-data.frame(Year = ACHA_year, 
                Measure = c(rep("Anxiety Affecting Studies",14), 
                            rep("Depression Affecting Studies",14), 
                            rep("Anxiety, Overwhelming (12mos)", 14), 
                            rep("Depression, Overwhelming (12mos)", 14), 
                            rep("Self-Harm (12mos)", 14), 
                            rep("Suicidal Thoughts (12 mos)", 14)), 
                Percentage = c(ACHA_anx_aca,
                               ACHA_dep_aca, 
                               ACHA_anx_12mo, 
                               ACHA_dep_12mo, 
                               ACHA_SH_12mo, 
                               ACHA_SI_12mo))

library(tidyverse)
g<-ggplot(data=dat, aes(x=Year, y=Percentage, group = Measure, color = Measure))+
  geom_point(aes(shape=Measure), size=2.5)+
  geom_line(lty='dashed')+
  stat_smooth(method='lm', se=FALSE, alpha=.7)+
  labs(caption = "Source: National College Health Assessment (ACHA, 2011-2018)",
       title = "Mental Problems of College Students are on the Rise", 
       subtitle = "Students report increasing rates of mental health problems related to internalizing disorders")
g

wd<-'/home/matthew/Documents/Twitter Stuff'
png(paste0(wd, '/ACHA.png'), 
    res = 900, 
    units = 'in', 
    width = 8, 
    height = 8)
g
dev.off()