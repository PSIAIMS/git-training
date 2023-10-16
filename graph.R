# JOUNRAL A UPDATE
library(tidyverse)

surv<-read.csv("data/whas500.csv")%>%
  mutate(LENFOLY = round(LENFOL/365.25, 2), ## change follow-up days to years for better visualization
         AFB_C = ifelse(AFB==1, "Active", "Non-Active"),
         GENDER_C = ifelse(GENDER==1, "Male", "Female"),
         CVD_C = ifelse(CVD==1, "Yes", "No")) 


pubgraph1<-
  ggplot(data = surv, mapping = aes(x =SYSBP , y =DIASBP)) + 
  geom_point() +
  facet_grid(rows = vars(CVD_C), cols = vars(GENDER_C)) +
  labs(title="Diastolic and Systolic Blood Pressure by Gender and Cardiovascular Disease Status",
       x="Systolic Blood Pressure",
       y="Diastolic Blood Pressure",
       caption="Data source: Survival 500 data") +
  theme_bw()

ggplot2::ggsave(filename="images/pubgraph1-dotJA1.jpg",
                plot=pubgraph1,
                device="jpg",
                dpi = 72,
                width=450,
                height=400,
                units = "px")
