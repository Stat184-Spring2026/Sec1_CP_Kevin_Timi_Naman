# 2024/25 NBA MVP ANALYSIS

This Repo Is A Statistical Comparison of Shai Gilgeous-Alexander, Nikola Jokić, and Luka Dončić, Based On the 2024/25 Regular NBA Season 

## Overview

This project analyzes game-by-game performance data from the 2024–2025 NBA season to compare three leading MVP candidates: Shai Gilgeous-Alexander, Nikola Jokić, and Luka Dončić. Using detailed statistics such as scoring, efficiency, rebounds, assists, and advanced shooting metrics, we aim to determine who had the most impactful season.

We explore key basketball concepts like volume scoring vs. efficiency, positional differences, and how playing time influences performance. Through data wrangling and visualization, we identify patterns and player strengths to support a data-driven MVP argument.


## Data Provenance
The dataset used in this project is from Basketball Reference
Website: https://www.basketball-reference.com/leagues/NBA_2025_per_game.html

The variables we used are:
- points per game
- assists per game
- rebounds per game
- shooting percentages
- turnovers per game
- minutes per game
We exported the dataset as a CSV file and then cleaned it up using R
Data Cleaning Steps
We cleaned the data by:
- Removing repeated header rows
- Removing duplicate player entries
- Keeping combined team totals for traded players
- Filtering players who played at least 20 games

## FAIR Principles

- **Findable:** Data is publicly available on Basketball Reference  
- **Accessible:** Dataset can be downloaded as CSV  
- **Interoperable:** Data is structured and usable in R and other tools  
- **Reusable:** Data can be reused for analysis, though not version-controlled  

## CARE Principles

The dataset contains publicly available NBA statistics and does not involve sensitive or community-specific data. CARE principles are not directly applicable, but the data is used responsibly for educational purposes.


## Current Plan

This project analyzes game-by-game performance data from the 2024–2025 NBA season to compare MVP candidates Shai Gilgeous-Alexander, Luka Dončić, and Nikola Jokić. Rather than relying on raw statistics alone, we account for positional differences by comparing each player’s performance relative to the league average for their position.

## Repo Structure
This repo has all our files related to our Final Project about the 2024-2025 Finalist for MVP compared to league average Data Analysist
Files include: 
Visualization_Final_code.R
NBA_FinalProj_ST184.qmd
nba_per_game25.csv
README.md



**Naman Joshi**  
- Applied Data Sciences & Supply Chain Management  
- The Pennsylvania State University  
- Email: nfj5099@psu.edu  

**Kevin Nguyen**  
- Computational Data Sciences  
- The Pennsylvania State University  
- Email: kpn5284@psu.edu  

**Timilehin Balogun**  
- Applied Data Sciences  
- The Pennsylvania State University  
- Email: oib5054@psu.edu  

---