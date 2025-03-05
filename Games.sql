CREATE OR REPLACE TABLE `devoteamtechchallenge.devoteam_baseball.Games` AS 
SELECT
  gameId,
  ANY_VALUE(homeTeamName) as homeTeamName,
  ANY_VALUE(awayTeamName) as awayTeamName,
  ANY_VALUE(homeFinalRuns) as homeFinalRuns,
  ANY_VALUE(awayFinalRuns) as awayFinalRuns,
  ANY_VALUE(homeFinalHits) as homeFinalHits,
  ANY_VALUE(awayFinalHits) as awayFinalHits,
  ANY_VALUE(homeFinalErrors) as homeFinalErrors,
  ANY_VALUE(awayFinalErrors) as awayFinalErrors,
  ANY_VALUE(durationMinutes) as durationMinutes,
FROM `bigquery-public-data.baseball.games_wide`
group by gameid
