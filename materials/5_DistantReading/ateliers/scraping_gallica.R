# scraping_gallica

library(rvest)

# Start by reading a HTML page with read_html():
my_file <- "gallica_pages/example_Gallica.html"
my_page <- read_html(my_file)

# (brute-force) extract text
my_text <- html_text2(my_page)
cat(my_text)

# extract via html tag (e.g. "p")
paragraphs <- my_page |> html_elements("p")
paragraphs

# extract the text
my_text_2 <- paragraphs |> 
  html_text2()
my_text_2

# save to text (1)
new_filename <- my_file |>
  gsub(pattern = "gallica_pages/",
       replacement = "gallica_texts/") |>
  gsub(pattern = ".html",
       replacement = ".txt")

cat(my_text, sep = "\n", file = new_filename)

# save to text (2)
new_filename <- my_file |>
  gsub(pattern = "gallica_pages/",
       replacement = "gallica_texts/") |>
  gsub(pattern = ".html",
       replacement = "_paragraphs.txt")

cat(my_text_2, sep = "\n", file = new_filename)
