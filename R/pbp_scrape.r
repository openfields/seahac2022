library(hockeyR)
help(package="hockeyR")
#system.time(scrape_season(2021, type="REG") -> sea21) - this threw a weird error, so I did stuff by day instead, then bundled things by month

system.time(scrape_day(day = "2021-10-12") -> oct12)
scrape_day(day = "2021-10-13") -> oct13
scrape_day(day = "2021-10-14") -> oct14
scrape_day(day = "2021-10-15") -> oct15
scrape_day(day = "2021-10-16") -> oct16
scrape_day(day = "2021-10-17") -> oct17
scrape_day(day = "2021-10-18") -> oct18
scrape_day(day = "2021-10-19") -> oct19
scrape_day(day = "2021-10-20") -> oct20
scrape_day(day = "2021-10-21") -> oct21
scrape_day(day = "2021-10-22") -> oct22
scrape_day(day = "2021-10-23") -> oct23
scrape_day(day = "2021-10-24") -> oct24
scrape_day(day = "2021-10-25") -> oct25
scrape_day(day = "2021-10-26") -> oct26
scrape_day(day = "2021-10-27") -> oct27
scrape_day(day = "2021-10-28") -> oct28
scrape_day(day = "2021-10-29") -> oct29
scrape_day(day = "2021-10-30") -> oct30
scrape_day(day = "2021-10-31") -> oct31

rbind(oct12, oct13, oct14, oct15, oct16, oct17, oct18, oct19, oct20, oct21, oct22, oct23, oct24, oct25, oct26, oct27, oct28, oct29, oct30, oct31) -> octgames
saveRDS(octgames, 'nhl_data/oct21.rds')
# November
scrape_day(day = "2021-11-01") -> nov1
scrape_day(day = "2021-11-02") -> nov2
scrape_day(day = "2021-11-03") -> nov3
scrape_day(day = "2021-11-04") -> nov4
scrape_day(day = "2021-11-05") -> nov5
scrape_day(day = "2021-11-06") -> nov6
scrape_day(day = "2021-11-07") -> nov7
scrape_day(day = "2021-11-08") -> nov8
scrape_day(day = "2021-11-09") -> nov9
scrape_day(day = "2021-11-10") -> nov10
scrape_day(day = "2021-11-11") -> nov11
scrape_day(day = "2021-11-12") -> nov12
scrape_day(day = "2021-11-13") -> nov13
scrape_day(day = "2021-11-14") -> nov14
scrape_day(day = "2021-11-15") -> nov15
scrape_day(day = "2021-11-16") -> nov16
scrape_day(day = "2021-11-17") -> nov17
scrape_day(day = "2021-11-18") -> nov18
scrape_day(day = "2021-11-19") -> nov19
scrape_day(day = "2021-11-20") -> nov20
scrape_day(day = "2021-11-21") -> nov21
scrape_day(day = "2021-11-22") -> nov22
scrape_day(day = "2021-11-23") -> nov23
scrape_day(day = "2021-11-24") -> nov24
scrape_day(day = "2021-11-25") -> nov25 # no games
scrape_day(day = "2021-11-26") -> nov26
scrape_day(day = "2021-11-27") -> nov27
scrape_day(day = "2021-11-28") -> nov28
scrape_day(day = "2021-11-29") -> nov29
scrape_day(day = "2021-11-30") -> nov30
rbind(nov1, nov2, nov3, nov4, nov5, nov6, nov7, nov8, nov9, nov10, nov11, nov12, nov13, nov14, nov15, nov16, nov17, nov18, nov19, nov20, nov21, nov22, nov23, nov24, nov26, nov27, nov28, nov29, nov30) -> novgames
saveRDS(novgames, 'nhl_data/nov21.rds')
# December
scrape_day(day = "2021-12-01") -> dec1
scrape_day(day = "2021-12-02") -> dec2
scrape_day(day = "2021-12-03") -> dec3
scrape_day(day = "2021-12-04") -> dec4
scrape_day(day = "2021-12-05") -> dec5
scrape_day(day = "2021-12-06") -> dec6
scrape_day(day = "2021-12-07") -> dec7
scrape_day(day = "2021-12-08") -> dec8
scrape_day(day = "2021-12-09") -> dec9
scrape_day(day = "2021-12-10") -> dec10
scrape_day(day = "2021-12-11") -> dec11
scrape_day(day = "2021-12-12") -> dec12
scrape_day(day = "2021-12-13") -> dec13 # no games
scrape_day(day = "2021-12-14") -> dec14
scrape_day(day = "2021-12-15") -> dec15
scrape_day(day = "2021-12-16") -> dec16
scrape_day(day = "2021-12-17") -> dec17
scrape_day(day = "2021-12-18") -> dec18
scrape_day(day = "2021-12-19") -> dec19
scrape_day(day = "2021-12-20") -> dec20
scrape_day(day = "2021-12-21") -> dec21
scrape_day(day = "2021-12-22") -> dec22 # no games
scrape_day(day = "2021-12-23") -> dec23 # no games
scrape_day(day = "2021-12-24") -> dec24 # no games
scrape_day(day = "2021-12-25") -> dec25 # no games
scrape_day(day = "2021-12-26") -> dec26 # no games
scrape_day(day = "2021-12-27") -> dec27 # no games
scrape_day(day = "2021-12-28") -> dec28
scrape_day(day = "2021-12-29") -> dec29
scrape_day(day = "2021-12-30") -> dec30
scrape_day(day = "2021-12-31") -> dec31
rbind(dec1, dec2, dec3, dec4, dec5, dec6, dec7, dec8, dec9, dec10, dec11, dec12, dec14, dec15, dec16, dec17, dec18, dec19, dec20, dec21, dec28, dec29, dec30, dec31) -> decgames
saveRDS(decgames, 'nhl_data/dec21.rds')
# January
scrape_day(day = "2022-01-01") -> jan1
scrape_day(day = "2022-01-02") -> jan2
scrape_day(day = "2022-01-03") -> jan3
scrape_day(day = "2022-01-04") -> jan4
scrape_day(day = "2022-01-05") -> jan5
scrape_day(day = "2022-01-06") -> jan6
scrape_day(day = "2022-01-07") -> jan7
scrape_day(day = "2022-01-08") -> jan8
scrape_day(day = "2022-01-09") -> jan9
scrape_day(day = "2022-01-10") -> jan10
scrape_day(day = "2022-01-11") -> jan11
scrape_day(day = "2022-01-12") -> jan12
scrape_day(day = "2022-01-13") -> jan13
scrape_day(day = "2022-01-14") -> jan14
scrape_day(day = "2022-01-15") -> jan15
scrape_day(day = "2022-01-16") -> jan16
scrape_day(day = "2022-01-17") -> jan17
scrape_day(day = "2022-01-18") -> jan18
scrape_day(day = "2022-01-19") -> jan19
scrape_day(day = "2022-01-20") -> jan20
scrape_day(day = "2022-01-21") -> jan21
scrape_day(day = "2022-01-22") -> jan22
scrape_day(day = "2022-01-23") -> jan23
scrape_day(day = "2022-01-24") -> jan24
scrape_day(day = "2022-01-25") -> jan25
scrape_day(day = "2022-01-26") -> jan26
scrape_day(day = "2022-01-27") -> jan27
scrape_day(day = "2022-01-28") -> jan28
scrape_day(day = "2022-01-29") -> jan29
scrape_day(day = "2022-01-30") -> jan30
scrape_day(day = "2022-01-31") -> jan31
rbind(jan1, jan2, jan3, jan4, jan5, jan6, jan7, jan8, jan9, jan10, jan11, jan12, jan13, jan14, jan15, jan16, jan17, jan18, jan19, jan20, jan21, jan22, jan23, jan24, jan25, jan26, jan27, jan28, jan29, jan30, jan31) -> jangames
saveRDS(jangames, 'nhl_data/jan22.rds')
# February
scrape_day(day = "2022-02-01") -> feb1
scrape_day(day = "2022-02-02") -> feb2
scrape_day(day = "2022-02-03") -> feb3 # no games
scrape_day(day = "2022-02-04") -> feb4 # no games
scrape_day(day = "2022-02-05") -> feb5
scrape_day(day = "2022-02-06") -> feb6 # no games
scrape_day(day = "2022-02-07") -> feb7
scrape_day(day = "2022-02-08") -> feb8
scrape_day(day = "2022-02-09") -> feb9
scrape_day(day = "2022-02-10") -> feb10
scrape_day(day = "2022-02-11") -> feb11
scrape_day(day = "2022-02-12") -> feb12
scrape_day(day = "2022-02-13") -> feb13
scrape_day(day = "2022-02-14") -> feb14
scrape_day(day = "2022-02-15") -> feb15
scrape_day(day = "2022-02-16") -> feb16
scrape_day(day = "2022-02-17") -> feb17
scrape_day(day = "2022-02-18") -> feb18 # error: problem while computing 'empty_net = ifelse(is.na(empty_net) | empty_net=FALSE, FALSE, TRUE)'; but game day data were pulled
scrape_day(day = "2022-02-19") -> feb19
scrape_day(day = "2022-02-20") -> feb20
scrape_day(day = "2022-02-21") -> feb21
scrape_day(day = "2022-02-22") -> feb22
scrape_day(day = "2022-02-23") -> feb23
scrape_day(day = "2022-02-24") -> feb24
scrape_day(day = "2022-02-25") -> feb25
scrape_day(day = "2022-02-26") -> feb26
scrape_day(day = "2022-02-27") -> feb27
scrape_day(day = "2022-02-28") -> feb28
rbind(feb1, feb2, feb5, feb7, feb8, feb9, feb10, feb11, feb12, feb13, feb14, feb15, feb16, feb17, feb18, feb19, feb20, feb21, feb22, feb23, feb24, feb25, feb26, feb27, feb28) -> febgames
saveRDS(febgames, 'nhl_data/feb21.rds')
# March
scrape_day(day = "2022-03-01") -> mar1
scrape_day(day = "2022-03-02") -> mar2
scrape_day(day = "2022-03-03") -> mar3
scrape_day(day = "2022-03-04") -> mar4
scrape_day(day = "2022-03-05") -> mar5
scrape_day(day = "2022-03-06") -> mar6
scrape_day(day = "2022-03-07") -> mar7
scrape_day(day = "2022-03-08") -> mar8
scrape_day(day = "2022-03-09") -> mar9
scrape_day(day = "2022-03-10") -> mar10
scrape_day(day = "2022-03-11") -> mar11
scrape_day(day = "2022-03-12") -> mar12
scrape_day(day = "2022-03-13") -> mar13
scrape_day(day = "2022-03-14") -> mar14
scrape_day(day = "2022-03-15") -> mar15
scrape_day(day = "2022-03-16") -> mar16
scrape_day(day = "2022-03-17") -> mar17
scrape_day(day = "2022-03-18") -> mar18
scrape_day(day = "2022-03-19") -> mar19
scrape_day(day = "2022-03-20") -> mar20
scrape_day(day = "2022-03-21") -> mar21
scrape_day(day = "2022-03-22") -> mar22
scrape_day(day = "2022-03-23") -> mar23
scrape_day(day = "2022-03-24") -> mar24
scrape_day(day = "2022-03-25") -> mar25
scrape_day(day = "2022-03-26") -> mar26
scrape_day(day = "2022-03-27") -> mar27
scrape_day(day = "2022-03-28") -> mar28
scrape_day(day = "2022-03-29") -> mar29
scrape_day(day = "2022-03-30") -> mar30
scrape_day(day = "2022-03-31") -> mar31
rbind(mar1, mar2, mar3, mar4, mar5, mar6, mar7, mar8, mar9, mar10, mar11, mar12, mar13, mar14, mar15, mar16, mar17, mar18, mar19, mar20, mar21, mar22, mar23, mar24, mar25, mar26, mar27, mar28, mar29, mar30, mar31) -> margames
saveRDS(margames, 'nhl_data/mar22.rds')
# April
scrape_day(day = "2022-04-01") -> apr1
scrape_day(day = "2022-04-02") -> apr2
scrape_day(day = "2022-04-03") -> apr3
scrape_day(day = "2022-04-04") -> apr4
scrape_day(day = "2022-04-05") -> apr5
scrape_day(day = "2022-04-06") -> apr6
scrape_day(day = "2022-04-07") -> apr7
scrape_day(day = "2022-04-08") -> apr8
scrape_day(day = "2022-04-09") -> apr9
scrape_day(day = "2022-04-10") -> apr10
scrape_day(day = "2022-04-11") -> apr11 # 110 variables?? instead of 111? missing venue_id field; Apr 5 Montreal game was also at home, should be able to grab venue_id from that
scrape_day(day = "2022-04-12") -> apr12
scrape_day(day = "2022-04-13") -> apr13
scrape_day(day = "2022-04-14") -> apr14
scrape_day(day = "2022-04-15") -> apr15
scrape_day(day = "2022-04-16") -> apr16
scrape_day(day = "2022-04-17") -> apr17
scrape_day(day = "2022-04-18") -> apr18
scrape_day(day = "2022-04-19") -> apr19
scrape_day(day = "2022-04-20") -> apr20
scrape_day(day = "2022-04-21") -> apr21
scrape_day(day = "2022-04-22") -> apr22
scrape_day(day = "2022-04-23") -> apr23
scrape_day(day = "2022-04-24") -> apr24
scrape_day(day = "2022-04-25") -> apr25
scrape_day(day = "2022-04-26") -> apr26
scrape_day(day = "2022-04-27") -> apr27
scrape_day(day = "2022-04-28") -> apr28
scrape_day(day = "2022-04-29") -> apr29
scrape_day(day = "2022-04-30") -> apr30 # no games
rbind(apr1, apr2, apr3, apr4, apr5, apr6, apr7, apr8, apr9, apr10, apr12, apr13, apr14, apr15, apr16, apr17, apr18, apr19, apr20, apr21, apr22, apr23, apr24, apr25, apr26, apr27, apr28, apr29) -> aprgames
saveRDS(apr11, 'nhl_data/apr112022.rds')
saveRDS(aprgames, 'nhl_data/apr22.rds')
# May
scrape_day(day = "2022-05-01") -> may1
saveRDS(may1, 'nhl_data/may012022.rds')

