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
## Needed packages: {tidyverse}, {knitr} 

library(tidyverse)
library(knitr)

# Step 2: Load data ----
## Needed data: NBA player game statistics

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
##Keep the combined team row for players who played on multiple teams

nba <- nba |>
  filter(Team == "2TM" | !duplicated(Player))

# Step 6: Filter players by games played ----
## Keep players who played at least 20 games

nba <- nba |>
  filter(G >= 20)

# Step 7: Create MVP candidate dataset ----
## Keep the three players we want to compare

mvpcandidates <- nba |>
  filter(Player %in% c(
    "Luka Dončić",
    "Nikola Jokić",
    "Shai Gilgeous-Alexander"
  ))

View(mvpcandidates)

# Step 8: Create points and assists scatterplot ----
## Code Header:
## Primary Author: Naman Joshi
## Reviewer: Kevin Nguyen
## This plot compares scoring and playmaking while highlighting the MVP candidates

pointsassistsplot <- ggplot(
  data = nba,
  aes(
    x = PTS,
    y = AST,
    color = Pos
  )
) +
  geom_point(alpha = 0.5) +
  geom_point(
    data = mvpcandidates,
    color = "red",
    size = 4
  ) +
  geom_text(
    data = mvpcandidates,
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
pointsassistsplot

# Step 8B: Create points and assists table ----
## Code Header:
## Primary Author: Naman Joshi
## Reviewer: Kevin Nguyen
## This table supports the points vs assists plot by comparing scoring and playmaking.

namanpointsassiststable <- mvpcandidates |>
  select(
    Player,
    Team,
    Pos,
    PTS,
    AST
  )

colnames(namanpointsassiststable) <- c(
  "Player",
  "Team",
  "Position",
  "Points Per Game",
  "Assists Per Game"
)

namanpointsassiststable <- namanpointsassiststable |>
  mutate(
    `Points Per Game` = round(`Points Per Game`, 1),
    `Assists Per Game` = round(`Assists Per Game`, 1)
  )

knitr::kable(
  namanPointsAssistsTable,
  caption = "Points and assists comparison for MVP candidates"
)


# Step 9: Create points by position boxplot ----
## Code Header:
## Primary Author: Kevin Nguyen
## Reviewer: Naman Joshi
## This plot compares the distribution of scoring across player positions

pointspositionplot <- ggplot(
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
pointspositionplot

# Step 9B: Create scoring summary by position table ----
## Code Header:
## Primary Author: Kevin Nguyen
## Reviewer: Naman Joshi
## This table summarizes scoring by position using average, median, and highest points per game.

positionscoringtable <- nba |>
  group_by(Pos) |>
  summarize(
    `Average Points` = round(mean(PTS, na.rm = TRUE), 1),
    `Median Points` = round(median(PTS, na.rm = TRUE), 1),
    `Highest Points` = round(max(PTS, na.rm = TRUE), 1)
  )

knitr::kable(
  positionscoringtable,
  caption = "Scoring Summary by NBA Position"
)

# Step 10: Create average stats by position table ----
## Code Header:
## Primary Author: Timilehin Balogun
## Reviewer: Naman Joshi
## This summarizes average points, rebounds, and assists for each NBA position

positionstats <- nba |>
  group_by(Pos) |>
  summarize(
    points = mean(PTS, na.rm = TRUE),
    rebounds = mean(TRB, na.rm = TRUE),
    assists = mean(AST, na.rm = TRUE)
  )

positionstatslong <- positionstats |>
  pivot_longer(
    cols = c(points, rebounds, assists),
    names_to = "stat",
    values_to = "average"
  )

positionstatslong <- positionstatslong |>
  mutate(
    stat = case_when(
      stat == "points" ~ "Points",
      stat == "rebounds" ~ "Rebounds",
      stat == "assists" ~ "Assists"
    )
  )

# Step 11: Create average stats by position bar chart ----
## Code Header:
## Primary Author: Timilehin Balogun
## Reviewer: Naman Joshi
## This plot compares average points, rebounds, and assists for each position

positionstatsplot <- ggplot(
  data = positionstatslong,
  aes(
    x = Pos,
    y = average,
    fill = stat
  )
) +
  geom_col(position = "dodge") +
  labs(
    title = "Average Points, Rebounds, and Assists by Position",
    x = "Position",
    y = "Average Per Game",
    fill = "Stat"
  ) +
  theme_minimal()

# Show plot
positionstatsplot

# Step 12: Create MVP candidate table ----
## Code Header:
## Primary Author: Timilehin Balogun
## Reviewer: Kevin Nguyen
## This table compares the main statistics for the selected players

mvptable <- mvpcandidates |>
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
colnames(mvptable) <- c(
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
mvptable <- mvptable |>
  mutate(
    Minutes = round(Minutes, 1),
    Points = round(Points, 1),
    Assists = round(Assists, 1),
    Rebounds = round(Rebounds, 1),
    Turnovers = round(Turnovers, 1)
  )

# Display table
View(mvptable)
