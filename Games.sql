CREATE OR REPLACE TABLE `devoteamtechchallenge.devoteam_baseball.Games` AS 
SELECT
  DISTINCT gameId,
  homeTeamName,
  awayTeamName,
  homeTeamId,
  awayTeamId,
  homeFinalRuns,
  awayFinalRuns,
  homeFinalHits,
  awayFinalHits,
  homeFinalErrors,
  awayFinalErrors,
  durationMinutes,
FROM
  `bigquery-public-data.baseball.games_wide`
