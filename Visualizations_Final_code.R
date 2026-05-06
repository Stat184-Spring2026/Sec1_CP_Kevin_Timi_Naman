# NBA MVP Candidate Visualizations ----
# Style Guide: tidyverse Style Guide


## Our goals are:
## - To use visualizations to show analytically, the MVP of the 2024/25 NBA season.
## - Clean the NBA player statistics data
## - Keep players who played at least 20 games
## - Create a smaller dataset for MVP-caliber players
## - Create visualizations comparing these players to the rest of their NBA counterparts


### Wrangling the data and creating the plots

# Step 1: Load packages ----
## Needed packages: {tidyverse}

library(tidyverse)

# Step 2: Load data ----
## Needed data: NBA player per game statistics

nba <- read_csv("nba_per_game25.csv")

# Step 3: Check imported data ----
## View the dataset and check the structure

View(nba)
str(nba)

# Step 4: Clean repeated header rows ----
## Remove repeated header rows if they appear in the data

nba <- nba |>
  filter(Player != "Player")

# Step 5: Remove duplicate player rows ----
## Keep the combined team row for players who played on multiple teams

nba <- nba |>
  filter(Team == "2TM" | !duplicated(Player))

# Step 6: Filter players by games played ----
## Keep players who played at least 20 games

nba <- nba |>
  filter(G >= 20)

# Step 7: Create MVP candidate dataset ----
## Keep the three players we want to compare

mvpCandidates <- nba |>
  filter(Player %in% c(
    "Luka Dončić",
    "Nikola Jokić",
    "Shai Gilgeous-Alexander"
  ))

View(mvpCandidates)

# Step 8: Create points and assists scatterplot ----
## This plot compares scoring and playmaking while highlighting the MVP candidates

pointsAssistsPlot <- ggplot(
  data = nba,
  aes(
    x = PTS,
    y = AST,
    color = Pos
  )
) +
  geom_point(alpha = 0.5) +
  geom_point(
    data = mvpCandidates,
    color = "red",
    size = 4
  ) +
  geom_text(
    data = mvpCandidates,
    aes(label = Player),
    color = "black",
    vjust = -1
  ) +
  labs(
    title = "Points vs Assists",
    subtitle = "MVP candidates are highlighted in red",
    x = "Points Per Game",
    y = "Assists Per Game",
    color = "Position"
  )

# Show plot
pointsAssistsPlot

# Step 9: Create points by position boxplot ----
## This plot compares the distribution of scoring across player positions

pointsPositionPlot <- ggplot(
  data = nba,
  aes(
    x = Pos,
    y = PTS,
    fill = Pos
  )
) +
  geom_boxplot() +
  labs(
    title = "Points Per Game by Position",
    subtitle = "Distribution of scoring across NBA positions",
    x = "Position",
    y = "Points Per Game",
    fill = "Position"
  )

# Show plot
pointsPositionPlot


# Step 10: Create average stats by position table ----
## This summarizes average points, rebounds, and assists by position

positionSummary <- nba |>
  group_by(Pos) |>
  summarize(
    avg_points = mean(PTS, na.rm = TRUE),
    avg_rebounds = mean(TRB, na.rm = TRUE),
    avg_assists = mean(AST, na.rm = TRUE)
  )

positionSummaryLong <- positionSummary |>
  pivot_longer(
    cols = c(avg_points, avg_rebounds, avg_assists),
    names_to = "stat_type",
    values_to = "average_value"
  ) |>
  mutate(
    stat_type = case_when(
      stat_type == "avg_points" ~ "Points",
      stat_type == "avg_rebounds" ~ "Rebounds",
      stat_type == "avg_assists" ~ "Assists"
    )
  )


# Step 11: Create average stats by position bar chart ----
## This plot compares average points, rebounds, and assists for each position

positionStatsPlot <- ggplot(
  data = positionSummaryLong,
  aes(
    x = Pos,
    y = average_value,
    fill = stat_type
  )
) +
  geom_col(position = "dodge") +
  labs(
    title = "Average Points, Rebounds, and Assists by NBA Position",
    subtitle = "2024-25 NBA player per game statistics",
    x = "Position",
    y = "Average Per Game",
    fill = "Statistic"
  )

# Show plot
positionStatsPlot

# Step 12: Create MVP candidate table ----
## This table compares the main statistics for the selected players

mvpTable <- mvpcandidates %>%
  select(
    Player,
    Team,
    Pos,
    G,
    MP,
    PTS,
    AST,
    TRB,
    TOV,
    `FG%`,
    `3P%`,
    `FT%`
  )

# Rename columns to look cleaner
colnames(mvpTable) <- c(
  "Player",
  "Team",
  "Position",
  "Games",
  "Minutes",
  "Points",
  "Assists",
  "Rebounds",
  "Turnovers",
  "FG%",
  "3P%",
  "FT%"
)

# Round numeric columns
mvpTable <- mvpTable %>%
  mutate(
    Minutes = round(Minutes, 1),
    Points = round(Points, 1),
    Assists = round(Assists, 1),
    Rebounds = round(Rebounds, 1),
    Turnovers = round(Turnovers, 1)
  )

# Display table
View(mvpTable)
