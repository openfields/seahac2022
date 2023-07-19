readRDS('nhl_data/oct21.rds') -> oct.games
# oct.games$home_name
# oct.games$away_name

unique(oct.games$game_id) -> oc.gids
oc.gids[1] 

which(oct.games$game_id==oc.gids[1]) -> tmp.gid
oct.games[tmp.gid,] -> tmp.game

regulationscore(oct.games[tmp.gid,]) -> g1.score

# make object to store data

g.final <- matrix(NA, nrow=length(oc.gids), ncol=4)
as.data.frame(g.final) -> g.final
names(g.final) <- c("home", "away", "hgoals", "agoals")

for(i in 1:length(oc.gids)){
  which(oct.games$game_id==oc.gids[i]) -> tmp.gid
  oct.games[tmp.gid,] -> tmp.game
  regulationscore(oct.games[tmp.gid,]) -> g1.score
  g.final[i, 1] <- g1.score[1,1]
  g.final[i, 2] <- g1.score[2,1]
  g.final[i, 3] <- as.numeric(g1.score[3,1])
  g.final[i, 4] <- as.numeric(g1.score[4,1])
}

game.scores <- function(gchunk){
  readRDS(gchunk) -> games
  unique(games$game_id) -> oc.gids
  g.final <- matrix(NA, nrow=length(oc.gids), ncol=4)
  as.data.frame(g.final) -> g.final
  names(g.final) <- c("home", "away", "hgoals", "agoals")
  
  for(i in 1:length(oc.gids)){
    which(oct.games$game_id==oc.gids[i]) -> tmp.gid
    oct.games[tmp.gid,] -> tmp.game
    regulationscore(oct.games[tmp.gid,]) -> g1.score
    g.final[i, 1] <- g1.score[1,1]
    g.final[i, 2] <- g1.score[2,1]
    g.final[i, 3] <- as.numeric(g1.score[3,1])
    g.final[i, 4] <- as.numeric(g1.score[4,1])
  }
  return(g.final)
}

