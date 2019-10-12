
library(ggplot2)

desc <- c("Pay day", "ATM", "ATM Fees", "Savings", "Centennial Lanes", "Owed Dalton $20", "Dominos", "Isaac gave me $10", "Dillions Groceries", "H20 Float", "Tiger Burger")
amount <- read.csv("waterfall.csv", header = TRUE)
as.vector(amount)

type <- c("Income", "Outcome", "Outcome", "Outcome", "Outcome", "Outcome", "Outcome", "Income", "Outcome", "Outcome", "Outcome")


start <- c(0, 1227.78, 1205.78, 1203.28, 1003.28, 997.43, 977.43, 941.56, 951.56, 903.55, 843.55 )

end <- c(1227.78, 1205.78, 1203.28, 1003.28, 997.43, 977.43, 941.56, 951.56, 903.55, 843.55, 833.77)

is_income <- c(TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE)

ref <- c(1227.78, -22, -2.5, -200.00, -5.85, -20, -35.87, 10, -48.01, -60, -9.78)

account <- data.frame(desc, amount, type, start, end, is_income, ref, 1:11)



account$ID <- account$X1.11
account$X1.11 <- NULL 

account$type <- as.factor(account$type)

ggplot(account, aes(desc, fill = type)) + geom_rect(aes(x = desc, xmin = ID - 0.45, xmax = ID + .45, ymin = end, ymax = start)) + scale_fill_manual(values = c("green","red"))
+ theme_dark()

#p1 <- ggplot(account, aes(x = ID,y = ref, fill=is_income)) +
 #     geom_bar(stat="identity", position="identity") +  scale_fill_manual(values = c("red","green")) + theme_dark()
 

#p2 <-  ggplot(csub, aes(x=Year, y=ref, fill=pos)) +
 #     geom_bar(stat="identity", position="identity")

#multiplot(p1, p2,  cols=1)