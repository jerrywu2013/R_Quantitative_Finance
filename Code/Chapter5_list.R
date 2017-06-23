#List
year <- c("2014", "2015", "2016", "2017")
dividends <- c(3, 4.5, 6, 7)
periods <- c(1, 2, 3, 4)
interest <- 5
tsmc_all <- data.frame(year, dividends, periods)
tsmc_all

tsmc_name <- "Taiwan Semiconductor Manufacturing Company, Limited"

tsmc_list<- list(tsmc_name, tsmc_all)

tsmc_list[1]
tsmc_list[2]

#Split
tsmc_list_new <- split(tsmc_all, tsmc_all$year)
tsmc_list_new_un<-unsplit(tsmc_list_new, tsmc_all$year)

tsmc_list_new
tsmc_list_new$`2016`
tsmc_list_new$`2016`$dividends


#FunTime

tsmc_list_new$prices <- tsmc_list_new_un$dividends * 1000
tsmc_list_new
tsmc_list_new_un$prices <- tsmc_list_new_un$dividends * 1000
tsmc_list_new_un

#Attributes
# my_matrix and my_factor
my_matrix <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3)
rownames(my_matrix) <- c("Row1", "Row2")
colnames(my_matrix) <- c("Col1", "Col2", "Col3")

my_factor <- factor(c("A", "A", "B"), ordered = T, levels = c("A", "B"))
# attributes of my_matrix
attributes(my_matrix)
# Just the dim attribute of my_matrix
attr(my_matrix, "dim")
# attributes of my_factor
attributes(my_factor)
