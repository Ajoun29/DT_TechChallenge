WITH PlayerTeams AS (
  SELECT
    lineupPlayerId AS playerId,

    lineupTeamId AS teamId,
    gameId,
    ROW_NUMBER() OVER (PARTITION BY lineupPlayerId ORDER BY startTime DESC) AS rn
  FROM `bigquery-public-data.baseball.games_wide`
  WHERE lineupPlayerId != ""
)
SELECT
  playerId,
  teamId
FROM PlayerTeams
WHERE rn = 1;
