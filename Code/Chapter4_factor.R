#Factors
x.data <- c("stock", "bond", "bond", "stock")
investment <- factor(x.data)
investment

class(investment)
as.integer(investment)
levels(investment)

#cut()
ranking <- runif(5, 0, 50)
buckets <- c(0, 10, 20, 30, 40, 50)

ranking_grouped <- cut(ranking, breaks = buckets)
ranking_grouped
summary(ranking_grouped)
summary(investment)

plot(ranking_grouped)

#Order
rank <- c("low", "medium", "low", "medium", "high")
ordered(rank)

rank_order <- factor(rank, ordered=TRUE,
                     levels = c("low", "medium", "high"))

rank_order

#Subsets
rank_order[c(1,3)]
summary(rank_order[c(1,3)])
rank_order[c(1,3), drop = TRUE]
summary(rank_order[c(1,3)], drop = TRUE)
