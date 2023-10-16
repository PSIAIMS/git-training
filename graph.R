# EXPLORING BLOOD PRESSURE DATA
library(tidyverse)

surv<-read.csv("data/whas500.csv")%>%
  mutate(LENFOLY = round(LENFOL/365.25, 2), ## change follow-up days to years for better visualization
         AFB_C = ifelse(AFB==1, "Active", "Non-Active"),
         GENDER_C = ifelse(GENDER==1, "Male", "Female"),
         CVD_C = ifelse(CVD==1, "Yes", "No")) 


pubgraph1<-
  ggplot(data = surv, mapping = aes(x =SYSBP , y =DIASBP, color = CVD_C, shape = GENDER_C)) + 
  geom_point() 

ggplot2::ggsave(filename="images/pubgraph1-dot1.jpg",
                plot=pubgraph1,
                device="jpg",
                dpi = 72,
                width=450,
                height=400,
                units = "px"
                )
