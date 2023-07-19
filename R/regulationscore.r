regulationscore <- function(game){
# goal tabulation to get score at end of regulation

# get event type = goal
#which(game$event=="Goal") -> goals

# reg goals
#which(game$period[goals] <= 3) -> rgoals
#lastgoal <- length(rgoals)

#lastgoal <- goals[max(rgoals)]
length(game$home_final) -> events
return(as.data.frame(c(game$home_name[events], game$away_name[events], game$home_final[events], game$away_final[events])))

return(score)
}

