### Welcome!

# This is an R script file, created by Simone
# Everything written after an hashtag is a comment
# Everything else is R code
# To activate the code, place the cursor on the corresponding line
# (or highlight multiple lines/pieces of code) 
# ...and press Ctrl+Enter (or Cmd+Enter for Mac)
# (the command will be automatically copy/pasted into the console)

# before you start, install the required packages
# (if a warning is shown above)

# print something to the screen
cat("Hello world")

# create a variable
my_number <- 1

# print the variable
my_number

# create and print another variable
my_string <- "to be or not to be"
my_string

# create and print another variable
my_vector <- c(1,2,3,4,5)
my_vector

# operate on variables
my_number + 1
my_vector + 1
paste(my_string, "?")
strsplit(my_string, " ")

# loop on variables
for(my_element in my_vector){
  cat("Now comes the number", my_element, "\n")
}

### Some tips

### 1. Cheat sheets
# good practice when you start coding with R is to use cheat sheets
# you can download some from here (or just Google them!)
# https://iqss.github.io/dss-workshops/R/Rintro/base-r-cheat-sheet.pdf
# https://www.rstudio.com/resources/cheatsheets/

### 2. ChatGPT
# Large Language Models are very good in writing code!
# You just need to provide clear instructions
# However, never trust them 100% (especially when task is complex): always test the script!
# Example: https://chat.openai.com/share/ef0e31ba-9136-40ab-9e78-6c046de48b78

