install.packages("tidyverse", dependencies = TRUE)
install.packages("ggplot2", dependencies = TRUE)
install.packages("readr", dependencies = TRUE)
install.packages("tidytext", dependencies = TRUE)
install.packages("dplyr", dependencies = TRUE)
install.packages("textdata",dependencies = TRUE)
install.packages("readtext", dependencies = TRUE)
library(tidyverse)
library(ggplot2)
library(readr)
library(tidytext)
library(dplyr)
library(textdata)
library(readtext)

Net_titles <- read.csv("netflix_titles.csv")
View(Net_titles)
Net_titles <- Net_titles %>% select(title)

Words_token <- Net_titles %>% unnest_tokens(word, title)
View(Words_token)

Words_token <- anti_join(Words_token, get_stopwords())
View(Words_token)

Word_frequencies <- table(Words_token)
View(Words_token)

Word_frequencies <- data.frame(Word_frequencies) %>% arrange(desc(Freq))
View(Word_frequencies)

install.packages("wordcloud2")
library(wordcloud2)

wordcloud2(Word_frequencies, size=1)

Top50 <- head(Word_frequencies, 50)
View(Top50)

wordcloud2(Top50, size=1)