# scraping_theconversation_simple

library(readxl)

# find all tables of links
my_table_files <- list.files("theconversation_pages", pattern = ".xlsx", full.names = T)

# read the first table
link_table <- read_excel(my_table_files[1])
View(link_table)

# read the first link in the table
my_link <- link_table$`article-link href`[2]
my_page <- read_html(my_link)

# print full text
my_text <- html_text2(my_page)
cat(my_text)
# comments are not there! you need to click button