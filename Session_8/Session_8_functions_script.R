

## ------------------------------------------------------------------------
## We can use .libPaths() to find where libraries are on your computer. These are directories of packages.
.libPaths()


## --------------------------------------------------------------
## We can see what packages are currently installed by running:
## library()


## ------------------------------------------------------------------------
## Once we have acquired a package, we have to load it into the current session. Use the library command for this.
library(boot)


## ------------------------------------------------------------------------
## Once we have aquired a package, we can find out more about its contents by using help
help(boot)
library(help = "boot")

## ------------------------------------------------------------------------
## From the previous slide, we see that the package ”boot” include a function called ”abc.ci”. I don’t know what this function does, so to find out I can ask R for help on this function
help(abc.ci)


## ------------------------------------------------------------------------
## Calculate BMI's without using functions.
heights <- c(1.50, 1.92, 1.74, 1.67)

weights <- c(80, 94, 78, 58)

weights / ( heights * heights )


## ------------------------------------------------------------------------
## Write a function to calculate BMIs, and then call it with our data.
calcBMI <- function (weights, heights) {
      x <- weights / ( heights * heights )
      return (x)
}

## ------------------------------------------------------------------------
calcBMI(weights, heights)


## --------------------------------------------------------------
## A closer look at a functions syntax.
f <- function(<arguments>) {
## Do something interesting
}


## ------------------------------------------------------------------------
## A closer look at a functions syntax.
calcBMI <- function (weights, heights) {
      x <- weights / ( heights * heights )
      return (x)
}


## ------------------------------------------------------------------------
## Lets take a look at the inner workings of the function: mean
mean.default


## ------------------------------------------------------------------------
## Lets write a function to calculate the average age of a group of rally drivers.
ages <- c(27, 24, 35, 24, 24, 33, 35, 22, 28)

average <- function (x) 
{
    sumx <- sum(x)
    countx <- length(x)
    return (sumx / countx)
}

average(ages)


## ------------------------------------------------------------
## An example of a built in function.
sum()


## Environments.

## ------------------------------------------------------------------------
## Setting up a global variable.
var <- c(1,2,3)


## ------------------------------------------------------------------------
## Taking a look at what we have just created, proving to ourselves we can access the variable in its environment.
print(var)


## ------------------------------------------------------------------------
## Variables set inside functions, are local to functions
create_var <- function () 
{
    var2 <- c(1,2,3)
}


## ------------------------------------------------------------------------
## Call the function
create_var()


## ------------------------------------------------------------------------
## Try see whats inside the variable.
print(var2)
## An error?! This is because the variable was created inside the function, and is not globally accessable... 

## ------------------------------------------------------------------------
## How about the other way around? Can we read variables inside functions, that are declared outside in the global space?
## We can declare a variable here.
var3 <- c(1,2,3)


## ------------------------------------------------------------------------
## Make the function.
print_var <- function () 
{
    print(var3)
}


## ------------------------------------------------------------------------
## Call the function, and lets see if it gives an error...
print_var()
## No error! This is because the function is able to access the global variable we created.


## ------------------------------------------------------------------------
## One last note on environments.
df = data.frame(col1 = 1:10, col2 = rnorm(10))

print(df)



## ------------------------------------------------------------------------
## Can we access those col1 and col2 variables?
print(col1)


## ------------------------------------------------------------------------
## We want to add a third column, which is simply the addition of the first two columns.
df <- transform(df, col3 = col1 + col2)

print(df)
## But thats really strange, how did it know what col1 and 2 were?
## Because we gave it the variable ’myList’, which has its own environmental variables.


## Named arguments
## ------------------------------------------------------------------------
## Functions can be passed named arguments, or positional arguments.
## Named arguments example:
f <- function(first, second){
    x<-first - second
    return(x)
}
f(first = 10, second = 8)


## ------------------------------------------------------------------------
## And we could equally do 
f(second=8, first=10)
## Because these are named, the order in which we pass them to the function does not matter.


## Positional
## ------------------------------------------------------------------------
f <- function(first, second){
    x <- first - second
    return(x)
}


## ------------------------------------------------------------------------
## Now if we swap the order, the results change
f(10, 8)
f(8, 10)


## ------------------------------------------------------------------------
## This means that all of these are equivalent:
seq(from=1, to=10, by=1)
seq(1,10,1)
seq(by=1,1,10)
seq(to=10,by=1,from=1)


## ------------------------------------------------------------------------
## Its possible to skip arguments, or assign defaults
ages <- c(34, 52, 23, 33, 33, 41)
f <- function(a,b,c=TRUE){
    print(mean(a))
    print(c)
}
f(ages)
## This works even without passing in b or c.

## ------------------------------------------------------------------------



## ------------------------------------------------------------------------
## When matching arguments, R will try and match part of a arguments name. This is know as Partial matching.
f <- function(first, second)
{
    print(first)
    print(second)
}
f(first="first argument", sec="second argument")
## We only partly name ”second” as ”sec”. And R still understands.

## ------------------------------------------------------------------------
## We can pass arguments to a function, and functions are able to return values to where they were called.
f <- function()
{
    return(10)
}
f()


## ------------------------------------------------------------------------
## We are able to capture this return value.
x <- f()
print(x)


## ------------------------------------------------------------------------
## Some functions return lots.
year <- c(2000 ,   2001  ,  2002  ,  2003 ,   2004)
rate <- c(9.34 ,   8.50  ,  7.62  ,  6.93  ,  6.60)
fit <- lm(rate ~ year)
attributes(fit)
fit$residuals


