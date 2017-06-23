#Vectors and stock prices
foxconn <- 90.60
faxconn_stock <- c(90.60, 90.80, 91.00)
faxconn_stock

#Vector names()
faxconn_stock <- c(90.60, 90.80, 91.00)
names(faxconn_stock) <- c("Mon", "Tue", "Wed")
faxconn_stock

#Vector manipulation
jerry <- c(100, 200, 300)
frank <- c(33, 66, 99)

monthly_total <- jerry + frank
monthly_total

sum(monthly_total)

#A 2D vector
my_matrix <- matrix(c(2, 3, 4, 5), nrow = 2, ncol = 2)
my_matrix 

my_matrix2 <- matrix(c(2, 3, 4, 5), nrow = 2, ncol = 2, byrow = TRUE)
my_matrix2

#cbind() and rbind()
tsmc <- c(100.10, 110.23, 121.55, 130.34)
foxconn <- c(80.11, 90.34, 100.43, 110.56)

cbind(tsmc, foxconn)
rbind(tsmc, foxconn)

#subsetting
M_tsmc_foxconn <- cbind(tsmc, foxconn)
M_tsmc_foxconn
M_tsmc_foxconn[1,]
M_tsmc_foxconn[,1]
M_tsmc_foxconn[1,2]
M_tsmc_foxconn[,c("tsmc", "foxconn")]

#Col()relation
cor(tsmc, foxconn)
cor(cbind(tsmc, foxconn))

#plot
plot(tsmc, foxconn)
plot(tsmc, foxconn, type = "l")
plot(tsmc, foxconn, type = "o")