
### Alcohol- related fatalities over time
# count alcohol-related fatalities by year
dat_alc_fatal <- dat8 %>% 
  filter(drinking_desc == "Yes (Alcohol Involved)",
         inj_sev_desc == "Fatal Injury") %>% 
  group_by(year) %>% 
  count()
# plot alcohol-related fatalities over time
ggplot(dat_alc_fatal, aes(year, n)) + geom_point()  + 
  stat_smooth(method = "loess", se = FALSE, span = 0.5, method.args = list(degree = 2)) +
  ylab("Number of Fatalities of those who consumed alcohol in Vehicular Accidents")


# Heatmap
# create dataframe for heat map
dat.heat <- dat8 %>% 
  group_by(inj_sev_desc, drinking_desc) %>% 
  summarise(number=n())
# create heatmap plot
ggplot(dat.heat, aes(x = drinking_desc, y = inj_sev_desc, fill = number)) + geom_tile() +
  scale_fill_gradient(low = "yellow", high = "red")
