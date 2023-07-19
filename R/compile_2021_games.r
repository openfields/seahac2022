# getting home/away score data

readRDS('nhl_data/oct21.rds') -> games
readRDS('nhl_data/nov21.rds') -> ngames
rbind(games, ngames) -> games

(unique(games$game_id) -> game_ids)

(HomeTeam <- rep(NA, length(game_ids)))
HomeTeam <- as.character(home_team)
(AwayTeam <- rep(NA, length(game_ids)))
AwayTeam <- as.character(away_team)
(home_score <- rep(0, length(game_ids)))
(away_score <- rep(0, length(game_ids)))
(score_diff <- rep(0, length(game_ids)))

# for each game id
for (i in 1:length(unique(game_ids))){
  # get game id
  which(games$game_id==game_ids[i]) -> current.game
  game <- games[current.game,]
  
  # get stuff
  max(game$home_score) -> home_final
  max(game$away_score) -> away_final
  home_final - away_final -> final_diff
  unique(game$home_name) -> home_bros
  unique(game$away_name) -> away_bros
  
  # write stuff
  HomeTeam[i] <- home_bros
  AwayTeam[i] <- away_bros
  home_score[i] <- home_final
  away_score[i] <- away_final
  score_diff[i] <- final_diff
  
}

as.numeric(as.factor(HomeTeam)) -> home_team
as.numeric(as.factor(AwayTeam)) -> away_team
unique(HomeTeam) -> team_names

# getting prior performance
get_standings(seasons = 2020) -> nhl_stand20
as.data.frame(cbind(nhl_stand20$team_name,nhl_stand20$points)) -> team.pts
names(team.pts) = c("team", "points")
team.pts[order(team.pts$team),] -> team.rank

# need to add in something for Seattle, assume it's league average
krak.pts <- ceiling(mean(as.numeric(team.rank$points)))
seattle <- as.data.frame(cbind('Seattle', krak.pts))
names(seattle) <- c("team", "points")
rbind(team.rank, seattle) -> all.rank
all.rank[order(all.rank$team),] -> all.rank

epl <- c()
epl$home_team       <- home_team
epl$away_team       <- away_team
epl$team_names      <- team_names
epl$home_goals      <- home_score
epl$away_goals      <- away_score
epl$score_diff      <- score_diff
epl$prev_perf       <- all.rank$points
epl$nteams          <- length(unique(epl$home_team))
epl$ngames          <- length(epl$score_diff)
epl$nweeks          <- floor(2*epl$ngames/epl$nteams)

epl$home_week <- c();   epl$away_week <- c();
for (g in 1:epl$ngames) {
  epl$home_week[g]  <-  sum(epl$home_team[1:g] == epl$home_team[g]) + 
    sum(epl$away_team[1:g] == epl$home_team[g]) 
  epl$away_week[g]  <-  sum(epl$away_team[1:g] == epl$away_team[g]) +
    sum(epl$home_team[1:g] == epl$away_team[g])
}

library("rstan")
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())
sm <- stan_model("epl_model.stan")
nsamples <- 1500
a_sims <- array(NA, c(nsamples, epl$nweeks, epl$nteams))
for (w in 1:epl$nweeks) {
  epl_w <- epl
  idx <- c(1:(w*10))
  epl_w$home_team  <- epl$home_team[idx]
  epl_w$away_team  <- epl$away_team[idx]
  epl_w$home_goals <- epl$home_goals[idx]
  epl_w$away_goals <- epl$away_goals[idx]
  epl_w$score_diff <- epl$score_diff[idx]
  epl_w$home_week  <- epl$home_week[idx]
  epl_w$away_week  <- epl$away_week[idx]
  epl_w$ngames     <- w*10
  epl_w$nweeks     <- max(c(epl_w$home_week, epl_w$away_week))
  fit <- sampling(sm, chains = 4, iter = (nsamples/2), data = epl_w)
  saveRDS(fit, paste("FITS/fit_", w, ".rds", sep=""))
  sims <- extract(fit)
  for (g in ((w-1)*10 + 1):(w*10)) {
    a_sims[,epl$home_week[g],epl$home_team[g]] <- 
      sims$a[,epl$home_week[g],epl$home_team[g]]
    a_sims[,epl$away_week[g],epl$away_team[g]] <- 
      sims$a[,epl$away_week[g],epl$away_team[g]]
  }
}

fit <- sampling(sm, chains = 4, iter = nsamples, data = epl)
