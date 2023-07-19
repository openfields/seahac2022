# parse pbp data
# 
# home team (numeric code)
# away team (numeric code)
# team names
# home goals
# away goals
# score diff
source('nhl/regulationscore.r')
gids <- unique(octgames$game_id)
# start with october games
for(i in 1:length(unique(octgames$game_id))){
  which(octgames$game_id==gids[i]) -> g.ind
  regulationscore(octgames[g.ind,]) -> score # home, away
  
  # write to 
  
}