library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)

dau <- read_csv("part-00000-48df0f60-2023-408f-9603-41b03edb7536-c000.csv")  

cat_stats <- read_csv("part-00000-30910b75-8429-4a4b-b9f5-b274e2664171-c000.csv")

library(dplyr)
library(ggplot2)
library(tidyr)

dau_std <- dau %>%
  transmute(date = as.Date(.[[1]]), cnt = suppressWarnings(as.numeric(.[[2]]))) %>%
  filter(!is.na(date), !is.na(cnt))

p_dau <- ggplot(dau_std, aes(date, cnt)) + geom_line() +
  labs(title = "Daily Active Users (DAU) Over Time", x = "Date", y = "Active Users")
print(p_dau)
ggsave("plot_dau.png", p_dau, width = 8, height = 4.5, dpi = 150)

cat_std <- cat_stats %>%
  transmute(category = as.character(.[[1]]),
            views    = suppressWarnings(as.numeric(.[[2]])),
            buys     = suppressWarnings(as.numeric(.[[3]])))

cat_long <- cat_std %>%
  pivot_longer(c(views, buys), names_to = "metric", values_to = "value")

p_views_buys <- ggplot(cat_long, aes(category, value, fill = metric)) +
  geom_col(position = "dodge") +
  labs(title = "Category: Views vs Buys", x = "Category", y = "Count", fill = "Metric")
print(p_views_buys)
ggsave("plot_views_vs_buys.png", p_views_buys, width = 9, height = 5, dpi = 150)

cat_conv <- cat_std %>%
  mutate(conv_rate = buys / pmax(views, 1))

p_conv <- ggplot(cat_conv, aes(reorder(category, -conv_rate), conv_rate)) +
  geom_col() +
  labs(title = "Conversion Rate by Category", x = "Category (sorted by conversion)", y = "Conversion Rate")
print(p_conv)
ggsave("plot_conversion_rate.png", p_conv, width = 9, height = 5, dpi = 150)
