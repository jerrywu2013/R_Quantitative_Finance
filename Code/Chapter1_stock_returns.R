#Stock Returns
interest_rate <- 10
mult <- 1 + interest_rate / 100
starting_cash <- 90
new_cash <- starting_cash * mult
new_cash

#Multiple Periods
mar_interest_rate <- 10
apr_interest_rate <- 5
mar <- 1 + mar_interest_rate  / 100
apr <- 1 + apr_interest_rate  / 100
new_cash <- starting_cash * mar * apr
new_cash

#Basic Data Types
#Numeric
60
70
#Character
"Hello"
"5"
#Logical
TRUE
FALSE
NA
#Variables and data types
x <- TRUE
x
y <- "Hi"
y
#Class()
x
class(x)
class("Hello")
class(60)
