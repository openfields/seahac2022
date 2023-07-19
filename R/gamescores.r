game.scores <- function(gchunk){
  # function to format final game scores: home team, away team, home score, away score
  readRDS(gchunk) -> games
  unique(games$game_id) -> oc.gids
  g.final <- matrix(NA, nrow=length(oc.gids), ncol=4)
  as.data.frame(g.final) -> g.final
  names(g.final) <- c("home", "away", "hgoals", "agoals")
  
  for(i in 1:length(oc.gids)){
    which(games$game_id==oc.gids[i]) -> tmp.gid
    games[tmp.gid,] -> tmp.game
    regulationscore(tmp.game) -> g1.score
    g.final[i, 1] <- g1.score[1,1]
    g.final[i, 2] <- g1.score[2,1]
    g.final[i, 3] <- as.numeric(g1.score[3,1])
    g.final[i, 4] <- as.numeric(g1.score[4,1])
  }
  return(g.final)
}
