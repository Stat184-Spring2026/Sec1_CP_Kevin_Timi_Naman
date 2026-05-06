# 2024/25 NBA MVP ANALYSIS

This Repo Is A Statistical Comparison of Shai Gilgeous-Alexander, Nikola Jokić, and Luka Dončić, Based On the 2024/25 Regular NBA Season 

---

## Overview

This project analyzes game-by-game performance data from the 2024–2025 NBA season to compare three leading MVP candidates: Shai Gilgeous-Alexander, Nikola Jokić, and Luka Dončić. Using detailed statistics such as scoring, efficiency, rebounds, assists, and advanced shooting metrics, we aim to determine who had the most impactful season.

We explore key basketball concepts like volume scoring vs. efficiency, positional differences, and how playing time influences performance. Through data wrangling and visualization, we identify patterns and player strengths to support a data-driven MVP argument.

---

### Interesting Insight

One key insight from our analysis is that player roles strongly influence performance metrics. Guards tend to have higher assist averages, reflecting their playmaking responsibilities, while centers dominate rebounds due to their positioning near the basket. This highlights how MVP evaluation must consider role-based contributions rather than just scoring totals.

---

## Exploratory Data Analysis (EDA)

Initial exploration of the dataset included:
- Examining distributions of points, assists, and rebounds
- Identifying outliers in scoring data
- Comparing player performance across positions

This helped guide our choice of visualizations and key variables for analysis.

---

## Data Sources and Acknowledgements

The dataset used in this project is from Basketball Reference:

Website: https://www.basketball-reference.com/leagues/NBA_2025_per_game.html

### Variables Used:
- Points per game
- Assists per game
- Rebounds per game
- Shooting percentages
- Turnovers per game
- Minutes per game

### Data Cleaning Steps:
- Removed repeated header rows
- Removed duplicate player entries
- Kept combined totals for traded players
- Filtered players who played at least 20 games

---

## FAIR Principles

- **Findable:** Data is publicly available on Basketball Reference  
- **Accessible:** Dataset can be downloaded as a CSV file  
- **Interoperable:** Data is structured and usable in R and other tools  
- **Reusable:** Data can be reused for analysis with proper citation  

---

## CARE Principles

The dataset contains publicly available NBA statistics and does not involve sensitive or community-specific data. CARE principles are not directly applicable, but the data is used responsibly for educational purposes.

---

## Current Plan

This project analyzes game-by-game performance data from the 2024–2025 NBA season to compare MVP candidates Shai Gilgeous-Alexander, Luka Dončić, and Nikola Jokić. Rather than relying on raw statistics alone, we account for positional differences by comparing each player’s performance relative to the league average for their position.

## Repo Structure
This repository contains all files related to the final project:

- `Visualization_Final_code.R` → Final R code for data cleaning and visualizations  
- `NBA_FinalProj_ST184.qmd` → Quarto report file  
- `nba_per_game25.csv` → Dataset used  
- `README.md` → Project documentation  

---
## Final Insight

Overall, this analysis shows that MVP-level performance is not defined by scoring alone. Players like Nikola Jokić contribute across multiple categories, while guards like Luka Dončić and Shai Gilgeous-Alexander balance scoring with playmaking. This reinforces the importance of evaluating players based on their roles and overall impact rather than a single statistic.

---

**Naman Joshi**  
- Applied Data Sciences & Supply Chain Management  
- The Pennsylvania State University  
- Email: nfj5099@psu.edu  

**Kevin Nguyen**  
- Computational Data Sciences  
- The Pennsylvania State University  
- Email: kpn5284@psu.edu  

### Naman Joshi
- Applied Data Sciences & Supply Chain Management  
- The Pennsylvania State University  
- Email: nfj5099@psu.edu  

### Kevin Nguyen
- Computational Data Sciences  
- The Pennsylvania State University  
- Email: kpn5284@psu.edu  

### Timilehin Balogun
- Applied Data Sciences  
- The Pennsylvania State University  
- Email: oib5054@psu.edu  

---


