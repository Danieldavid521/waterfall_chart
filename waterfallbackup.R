#getwd()
library(ggplot2)

desc <- c("loan1", "loan2", "loan3", "loan4", "loan5", "loan6")
#amount <- read.csv("waterfall.csv", header = TRUE)
#as.vector(amount)

type <- c("Outcome", "Outcome", "Outcome", "Outcome", "Outcome", "Outcome")


start <- c(0, 5500.00, 11000.00, 12851.00, 1452.28, 1452.28)

end <- c( 5500.00,  11000.00 ,  12851.00 , 1452.28, 1458.13, 1478.13)

is_income <- c(FALSE, FALSE, FALSE, FALSE, FALSE, FALSE)

ref <- c(5500.00, 5500.00,  1851.00 ,  3250.00,  7500,7500,5500)

account <- data.frame(desc, amount, type, start, end, is_income, ref, 1:6)



account$ID <- account$X1.6
account$X1.11 <- NULL 

account$type <- as.factor(account$type)

ggplot(account, aes(desc, fill = type)) + geom_rect(aes(x = desc, xmin = ID - 0.45, xmax = ID + .45, ymin = end, ymax = start)) + scale_fill_manual(values = c("red","green"))


#p1 <- ggplot(account, aes(x = ID,y = ref, fill=is_income)) +
 #     geom_bar(stat="identity", position="identity") +  scale_fill_manual(values = c("red","green")) + theme_dark()
 

#p2 <-  ggplot(csub, aes(x=Year, y=ref, fill=pos)) +
 #     geom_bar(stat="identity", position="identity")

#multiplot(p1, p2,  cols=1)