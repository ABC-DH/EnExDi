### 3. A "tidy" approach for SA

library(udpipe)
library(tidyverse)


# process the text with udpipe
novel <- readLines('corpus/Doyle_Study_1887.txt')
text <-  paste(novel, collapse = "\n\n")
text_annotated <- udpipe(x = text, object = "english")
View(text_annotated)

# now it's time to do sentiment analysis!
# with tidyverse, we can rapidly annotate the sentiment
text_annotated <- left_join(text_annotated, syuzhet_dict, by = c("lemma" = "word"))
View(text_annotated)

# get overall values per sentence
sentences_annotated <- text_annotated %>%
  group_by(sentence_id) %>%
  summarize(sentiment = sum(value, na.rm = T))

View(sentences_annotated)

# Plot the sentiment
# with function for rolling plot (taken from https://github.com/mjockers/syuzhet/blob/master/R/syuzhet.R)
rolling_plot <- function (raw_values, window = 0.1){
  wdw <- round(length(raw_values) * window)
  rolled <- rescale(zoo::rollmean(raw_values, k = wdw, fill = 0))
  half <- round(wdw/2)
  rolled[1:half] <- NA
  end <- length(rolled) - half
  rolled[end:length(rolled)] <- NA
  return(rolled)
}

# apply rolling function
sentences_annotated$rolled_sentiment <- rolling_plot(sentences_annotated$sentiment)
View(sentences_annotated)

# create index for percentage of book
sentences_annotated$book_percentage <- 1:length(sentences_annotated$sentence_id)/length(sentences_annotated$sentence_id)*100
View(sentences_annotated)

p1 <- ggplot(data = sentences_annotated) +
  geom_line(mapping = aes(x = book_percentage, y = rolled_sentiment)) +
  ggtitle("my sentiment arc") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(minor_breaks = seq(0,100,5), breaks = seq(0,100,10))
p1  




# read SentiArt dictionary
sentiart <- read.csv("resources/SentiArt.csv", stringsAsFactors = F)
View(sentiart)

# note: Sentiart includes values per word (not lemma) in lowercase, so we need to lowercase the tokens in our text and perform the analysis on them
text_annotated$token_lower <- tolower(text_annotated$token)

# use left_join to add multiple annotations at once
text_annotated <- left_join(text_annotated, sentiart, by = c("token_lower" = "word")) 

# possible issue: the annotation of stopwords!
# workaround: use the POS tags to limit the analysis
sentiart_POS_sel <- c("NOUN", "VERB", "ADV", "ADJ")
text_annotated$token_lower[which(!text_annotated$upos %in% sentiart_POS_sel)] <- NA
text_annotated <- left_join(text_annotated, sentiart, by = c("token_lower" = "word")) 
