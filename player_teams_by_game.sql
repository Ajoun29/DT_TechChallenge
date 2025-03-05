SELECT
  DISTINCT playerId,
  teamId,
  gameId
FROM (
  SELECT
    teamId,
    fielder AS playerId,
    gameId
  FROM
    `bigquery-public-data.baseball.games_wide`,
    UNNEST([ homeFielder1, homeFielder2, homeFielder3, homeFielder4, homeFielder5, homeFielder6,homeBatter1, homeBatter2, homeBatter3, homeBatter4, homeBatter5, homeBatter6, homeBatter7, homeBatter8, homeBatter9, homeFielder7, homeFielder8, homeFielder9, homeFielder10, homeFielder11, homeFielder12 ]) AS fielder,
    UNNEST([homeTeamId]) AS teamId,
    UNNEST([gameId]) AS gameId
  UNION ALL
  SELECT
    teamId,
    fielder AS playerId,
    gameId
  FROM
    `bigquery-public-data.baseball.games_wide`,
    UNNEST([ awayFielder1, awayFielder2, awayFielder3, awayFielder4, awayFielder5, awayFielder6, awayFielder7, awayFielder8, awayFielder9, awayFielder10, awayFielder11, awayFielder12,awayBatter1, awayBatter2, awayBatter3, awayBatter4, awayBatter5, awayBatter6, awayBatter7, awayBatter8, awayBatter9 ]) AS fielder,
    UNNEST([awayTeamId]) AS teamId,
    UNNEST([gameId]) AS gameId )
WHERE
  playerId != ""
