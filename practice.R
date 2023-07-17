#metafor practice work
#corina july 2023
my_data<-read.csv("r meta analysis data test!.csv", dec=",")
library("metafor")
my_data<- escalc(n1i = n_controls, n2i = n_patients, m1i = mean_controls, m2i = mean_patients,sd1i = sd_controls, sd2i = sd_patients, data = my_data, measure = "SMD",append=TRUE)
ma_model_1 <- rma(yi, vi, data = my_data)
print(summary(ma_model_1))
forest(ma_model_1, slab = paste(my_data$study, as.character(my_data$year), sep = ", "))
funnel(ma_model_1)