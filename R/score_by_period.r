octgames -> game
which(game$game_id==2021020001) -> g.ind
game[g.ind,] -> game

periods <- 1:3
score_by_period <- function(){
# score_by_period
# input: pbp data with index for a game, e.g., game[game.ind,]; periods
# processing: tabulate goals by period
# output: return table with team names and total goals

which(game$event=="Goal") -> goals

game$period[goals] -> per.g

# loop through period list
# append for each additional element in the array
#

}