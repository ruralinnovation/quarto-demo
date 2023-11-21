get_me_cty <- function(){
  library(cori.db)

  sql <- "SELECT
state_abbr,
  geoid_st,
  geoid_co,
  co_category_area,
  cnt_total_locations,
  cnt_fiber_locations,
  cnt_100_20_loc,
  cnt_25_3_loc,
  geom
FROM
  sch_broadband.bb_map_co_2022decareav3e
where state_abbr = ?state;"

  con <- cori.db::connect_to_db("sch_broadband")
  my_query <- DBI::sqlInterpolate(con, sql, state = params$state)
  dat <- sf::st_read(dsn = con, query = my_query)
  DBI::dbDisconnect(con)
  return(dat)
}
