
# This is what an R script looks like. I'm writing a little bit of background
# using the comment character "#". Text is highlighted differently than in an 
# .Rmd file. To me, the way that the text is colored in an R script draws my eyes 
# immediately to the R code, whereas in an Rmd file both prose and code are 
# highlighted similarly.
  
# Let's practice working in an R script and saving our output using the rat data
# that was introducted at the beginning of today. 

# 1. First load the data. This will be a slightly different process than running
# a code chunk in a notebook. To run a line of code in an R script, put your cursor
# on the line of code that you want to run, then press *Cmd+Enter* (*Ctrl+Enter* 
# on Windows). This will run the line of code *and* move your cursor down to the 
# next line of code. Run both lines of code:

library(tidyverse);
rat_data <- read_csv("rats.csv",
                     col_types = cols(rat = col_character()));

# Notice that I don't need to provide a working
# directory because both the R script and the rats.csv file are associated 
# with my project. This also makes my code friendlier for sharing with others. 

# 2. Now run the next line of code the same way. Since all of the code in the line 
# below belongs to a single command, you can put your cursor on any of the lines
# and type *Cmd+Enter* (*Ctrl+Enter* on Windows) to run it. 

ggplot(rat_data) +
  geom_line(aes(x = age, 
                y = response, 
                group = rat, 
                color = treat)) + 
  scale_y_continuous(name = "Height of skull (units?)") + 
  scale_x_continuous(name = "Age of rat (days)", 
                     breaks = seq(50, 110, by = 10)) + 
  theme(text = element_text(size = 18));

# A plot should have come up. I've used the scale_x_continuous functions to 
# change the labels of the axes and the units that are shown. There is a 
# scale_<aesthetic>_<continous/discrete> function for all combinations of any 
# aesthetic (x, y, color, fill, linetype, etc), both continuous and discrete. 

# If you ever see a function that is new to your or that you have questions about, 
# you can always type '?<function_name>' in the R console to pull up its help page. 


# 3. If you run the code below, R will save the most recent ggplot that you created
# into an external file named 'rats_spaghetti.pdf'. Go ahead and run the code
# below now. Then check the folder where your project lives to confirm that a 
# new pdf was created

ggsave(filename = "rats_spaghetti.pdf", device = "pdf", height = 8, width = 12, units = "in");


# 4. If you want to write a dataset to file, you can use the write_csv function:
# Here I am creating a new version of rat_data that has an added column: the age
# of the rat in months. After creating this new version, run the next line of code
# to write your new dataset to a file named 'rat_data_new.csv'. 

rat_data <- 
  rat_data %>%
  mutate(age_months = age / (365.25/12));
write_csv(x = rat_data, path = "rat_data_new.csv");


#' I've saved the best news for last: you can also knit a standard `R` script just
#' like an `.Rmd` notebook!
#' 
#' Try it now! Press *Cmd+Shift+K* (*Ctrl+Shift+K*), choose the format that you'd
#' like to knit the document into, and select 'Compile'. The pdf option may not 
#' work on your computer if you don't have a Tex installation; the html format should
#' still work. 
#' 
#' Notice that instead of " # " at the beginning of each line, 
#' I'm now using " #' " (starting at line 65). R does not care about this 
#' difference, because both look like comments to it. But when you *knit* the
#' document, these lines will be formatted like text. In your knitted documnet, 
#' compare the look and style of the comments at the beginning to the these 
#' formatted comments. 
#' 
#' Finally, you can add a title, author, and date to your knitted R script, just
#' like a notebook. Fill in the empty strings here:
#' 
#'  
#' ---
#' title: "3: Saving your work"
#' author: ""
#' date: ""
#' ---
#' 
#' If you have finished everything and have some time remaining, read the following
#' articles by Jenny Bryan:
#' 
#' 
#' Render an R script
#' 
#' https://happygitwithr.com/r-test-drive.html
#' 
#' 
#  Project-oriented workflow in `R`:
#'  
#' https://www.tidyverse.org/articles/2017/12/workflow-vs-script/
#'  
#'  








