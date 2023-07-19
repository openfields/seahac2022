#devtools::install_github("https://github.com/skillalytics/skillalytics-scraper")
#devtools::install_github("https://github.com/skillalytics/skillalytics-scraper")
1. full season models:
  look at footBayes examples, think about breaking up things by week/2-week periods
  want to alter parameterization for attacking/defending strength based on..............xg? cf? some frankenmetric from ordination
  
2. ordination
  get data, think about splitting by period, by 10 min chunk, by 5 min chunk, by 2 min chunk, by 1 min chunk

3. tensor creation
  read in data to location, time, event, home/away, players
  
# game scores at end of regulation 
organize game score data
source('nhl/regulationscore.r')
source("nhl/gamescore.r")

gamescore('nhl_data/oct21.rds') -> oct.scores
gamescore('nhl_data/nov21.rds') -> nov.scores
gamescore('nhl_data/dec21.rds') -> dec.scores
gamescore('nhl_data/jan22.rds') -> jan.scores # err, 0-0 game(s)
gamescore('nhl_data/feb21.rds') -> feb.scores
rep(NA, 4) -> extra.feb
rbind(feb.scores, extra.feb) -> all.feb
all.feb[151,1] <- "Chicago Blackhawks"
all.feb[151, 2] <- "Dallas Stars"
all.feb[151, 3] <- 0
all.feb[151, 4] <- 1
all.feb -> feb.scores
gamescore('nhl_data/mar22.rds') -> mar.scores # err, 0-0 game(s)
mar.scores[124, 3:4] <- c(2,3)
gamescore('nhl_data/apr22.rds') -> apr.scores # err, 0-0 game(s)
gamescore('nhl_data/apr112022.rds') -> xapr.scores
gamescore('nhl_data/may012022.rds') -> may.scores



rbind(oct.scores, nov.scores, dec.scores, jan.scores, feb.scores, mar.scores, apr.scores, xapr.scores, may.scores) -> all.scores
season <- rep(2021, 1312) 
cbind(season, all.scores) -> nhldata
names(nhldata) <- c("season", "home", "away", "home goals", "away goals")
# team strength models
library(footBayes)
library(dplyr)
options(mc.cores=8)
niter <- 4000
fit1_nhl <- stan_foot(data = nhldata,
                      model = 'biv_pois',
                      chains = 4,
                      iter = niter) # error with treedepth warning

fit_nhl_sk <- stan_foot(data = nhldata,
                        model = 'skellam',
                        chains = 4,
                        iter = niter)


fit_nhl_dp <- stan_foot(data = nhldata,
                        model = 'double_pois',
                        chains = 4,
                        iter = niter)

fit_nhl_st <- stan_foot(data = nhldata,
                        model = 'double_pois',
                        chains = 4,
                        iter = niter)

fit_nhl_zsk <- stan_foot(data = nhldata,
                                model = 'zero_infl_skellam',
                                chains = 4,
                                iter = niter)

fit_nhl_zskt <- stan_foot(data = nhldata,
                         model = 'zero_infl_skellam',
                         prior = student_t(4, 0, NULL),
                         chains = 4,
                         iter = niter)


fit_nhl_dibp <- stan_foot(data = nhldata,
                         model = 'diag_infl_biv_pois',
                         chains = 4,
                         iter = niter)


print(fit1_nhl, pars = c('home', 'rho', 'sigma_att', 'sigma_def'))

foot_abilities(object = fit1_nhl, data = nhldata, cex.var = 1)
foot_abilities(object = fit_nhl_zsk, data = nhldata, cex.var =1)

fit2_nhl <- stan_foot(data = nhldata,
                      model = 'biv_pois',
                      dynamic_type = 'weekly',
                      iter = niter)


fit3_nhl <- stan_foot(data = nhldata,
                         model="double_pois",
                         prior = student_t(4,0, NULL), # 4 df
                         prior_sd = cauchy(0,25),
                         dynamic_type = "weekly",
                         #cores = 4,
                         iter = n_iter)  # double poisson
print(fit3_stan_t, pars =c("home", "sigma_att",