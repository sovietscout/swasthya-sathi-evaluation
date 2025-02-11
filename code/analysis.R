library(haven)
library(tidyverse)
library(hrbrthemes)
library(stargazer)


# SETUP -------------------------------------------------------------------

df_stata <- read_dta("../data/SSA_Master.dta")

# Convert labelled variables to factors
df <- mutate(df_stata, across(where(is.labelled), as_factor))

view(df)

summary_stats <- function(df, col) {
    status_table <- table(df[[col]], df[["e1"]])
    
    total_counts <- rowSums(status_table)
    with_ss_proportion <- status_table[, "Yes"] / total_counts * 100
    without_ss_proportion <- status_table[, "No"] / total_counts * 100
    
    with_ss_proportion <- round(with_ss_proportion, 2)
    without_ss_proportion <- round(without_ss_proportion, 2)
    
    result_df <- data.frame(
        with_ss = with_ss_proportion,
        without_ss = without_ss_proportion,
        total = total_counts
    )
    
    result_df <- result_df[total_counts > 0, ]
    return(result_df)
}
likert_table <- function(df, cols) {
  df %>%
    select(all_of(cols)) %>%
    pivot_longer(everything()) %>%
    filter(!is.na(value)) %>%
    group_by(name, value) %>%
    summarise(n = n(), .groups = "drop") %>%
    group_by(name) %>%
    mutate(prop = round(n / sum(n) * 100, 2)) %>% 
    select(-n) %>%
    pivot_wider(names_from = name, 
                values_from = prop) %>%
    arrange(value)
}
logit <- function(df, formula) {
    m <- glm(formula, data = df, family = "binomial")
    summary(m)
    
    return(m)
}

import_roboto_condensed()
box_plot <- function(df, col, title, x_label, filename, scale = 1,
                     x_breaks = seq(0, 600, by = 50)) {
    p <- ggplot(df, aes(x = {{ col }})) + 
        geom_boxplot(fill = "#3badef", colour = "#205a7a") +
        labs(x = x_label, title = title) +
        scale_x_continuous(breaks = x_breaks) +
        scale_y_continuous(labels = NULL, breaks = NULL) +
        theme_ipsum_rc(
            base_family = "sans",
            base_size = 10,
            plot_title_size = 14,
            grid = "X"
        )
    
    # Save the plot
    ggsave(filename, path = "../images/", plot = p, scale = scale, 
           bg = "#ffffff", device = "png")
    
    return(p)
}

appendix <- NULL

# PROFILE OF RESPONDENTS --------------------------------------------------

nrow(df) # 129 Respondents

summary_stats(df, "area_c")

mean(df$p2[df$p3 == "Male"]) # Mean male age: 43.8
mean(df$p2[df$p3 == "Female"]) # Median female age: 44.37
median(df$p2[df$p3 == "Male"]) # Median male age: 38
median(df$p2[df$p3 == "Female"]) # Median female age: 45

p_age <- ggplot(df, aes(x = p2, y = p3)) + 
    geom_boxplot(fill = "#3badef", colour = "#205a7a") +
    scale_x_continuous(breaks = seq(20, 80, by = 10)) +
    labs(x = "in Years", title = "Breakdown of Age by Sex") +
    theme_ipsum_rc(
        base_family = "sans",
        base_size = 10,
        plot_title_size = 14,
        grid = "X"
    )

ggsave(plot = p_age, "../images/age-breakdown-by-sex.png", scale = 1.5, bg = "#ffffff")

summary_stats(df, "p3") # Sex
summary_stats(df, "p4") # Religion
summary_stats(df, "p5") # Caste
summary_stats(df, "p6") # Marital Status
summary_stats(df, "p7") # Educational Qualifications
summary_stats(df, "p8_c") # Occupation
summary_stats(df, "p9_c") # Number of Family Members (base 4)
summary_stats(df, "p10_c") # Number of Aged Members
summary_stats(df, "p11") # Total Household Income
summary_stats(df, "p12_c") # Number of Earning Members
summary_stats(df, "p13") # BPL card holder


# Demography & Enrolment
logit(df, e1 ~ p2) # Age: insignificant
logit(df, e1 ~ p4) -> appendix.3 # Religion: Hindu significant
logit(df, e1 ~ p5) # Caste: General significant
logit(df, e1 ~ p6) # Marital Status: Married significant
logit(df, e1 ~ p7) # Education: all insignificant
logit(df, e1 ~ p8_c) # Occupation: Salaried significant (at 5%)
logit(df, e1 ~ p9_c) -> appendix.7 # Family size: 4 significant (at 1%); >4 significant at (5%)
logit(df, e1 ~ p10_c) # Aged members: insignificant
logit(df, e1 ~ p11) # Income: all insignificant
logit(df, e1 ~ p12_c) # Earning members: significant at 5% (more, higher the chance)
logit(df, e1 ~ p13) -> appendix.6 # BPL card: non-holders significant at 0.1%, holders at 5%

logit(df, e1 ~ p4 + p5 + p6 + p8_c + p9_c + p12 + p13)

t.test(e1 ~ p2, df) # Age: Insignificant
kruskal.test(e1 ~ p4, df) -> appendix.2 # Religion: Significant (at 10%)
kruskal.test(e1 ~ p5, df) # Caste: Insignificant (at 10%)
kruskal.test(e1 ~ p11, df) -> appendix.4
kruskal.test(e1 ~ p13, df) -> appendix.5

# ENROLMENT ---------------------------------------------------------------

likert_table(df, "e2")
likert_table(df, "e3")

box_plot(df, e9, "Duration of Enrolment", "in Minutes", 
         "duration-enrolment.png", scale = 1.5, x_breaks = seq(0, 600, by = 60))

summary_stats(df, "e9_c")


# AWARENESS ---------------------------------------------------------------

likert_table(df, c("a1", "a2", "a4", "a5"))
likert_table(df, c("a3", "a6", "a7"))


# EXPERIENCE --------------------------------------------------------------

# Hospitalisation Episode - Differences in Time
kruskal.test(h5 ~ hs_c, df) # Insignificant
kruskal.test(h6 ~ hs_c, df) # Insignificant
kruskal.test(h7 ~ hs_c, df) # Insignificant
kruskal.test(h8 ~ hs_c, df) # Insignificant
kruskal.test(h9 ~ hs_c, df) # Insignificant

# Hospitalisation Episode - Ratings
likert_table(df, c("h11a", "h11b", "h11c", "h11d", "h11e", "h11f"))

# Hospitalisation Episode - Differences in Ratings
kruskal.test(h11a ~ hs_c, df) # Insignificant
kruskal.test(h11b ~ hs_c, df) # Insignificant
kruskal.test(h11c ~ hs_c, df) # Insignificant
kruskal.test(h11d ~ hs_c, df) # Insignificant
kruskal.test(h11e ~ hs_c, df) # Insignificant
kruskal.test(h11f ~ hs_c, df) # Insignificant

# Hospitalisation Episode - Information, Charges & Documents
mean(df$hs1a == "Yes", na.rm = TRUE) # 80.9%
mean(df$hs1b == "Yes", na.rm = TRUE) # 30.0%
mean(df$hs1c == "Yes", na.rm = TRUE) # 22.9%

# Swasthya Sathi - Experience
mean(df$ex2 == 1, na.rm = TRUE) # 90.1%

# Swasthya Sathi - Ratings
likert_table(df, c("ex3a", "ex3b", "ex3c", "ex3d"))

# Reasons for not using Swasthya Sathi card
likert_table(df, c("hs2a", "hs2b", "hs2c", "hs2d", "hs2e", "hs2f"))
# 70.27% did not use due to non-empanelment of hospitals & doctors


# STATUS OF RESPONDENT ----------------------------------------------------

# Accessibility of Health Care Facilities w/ Swasthya Sathi
df[df$e1 == 0, ] %>% likert_table(c("s2"))
df[df$e1 == 1, ] %>% likert_table(c("s2"))

# Discussion of Health Issues
likert_table(df, c("s1"))

df[df$e1 == 0, ] %>% likert_table(c("s1"))
df[df$e1 == 1, ] %>% likert_table(c("s1"))

kruskal.test(s1 ~ hs, df[df$e1 == "Yes",]) # Significant difference in ratings between those who used their cards v who did not.

kruskal.test(s2 ~ hs, df[df$e1 == "Yes",]) # Inignificant difference between those who felt their accessibility to health care changed


# APPENDIX ----------------------------------------------------------------
stargazer(appendix.3, type = 'latex', dep.var.labels=c('Enrolment'))
stargazer(appendix.6, type = 'latex', dep.var.labels=c('Enrolment'))
stargazer(appendix.7, type = 'latex', dep.var.labels=c('Enrolment'))

