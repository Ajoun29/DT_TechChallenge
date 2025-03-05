CREATE OR REPLACE TABLE devoteamtechchallenge.devoteam_baseball.hitter_performance_by_pitch_type AS
SELECT 
    hitterId,
    hitterFirstName || ' ' || hitterLastName AS hitterName,
    pitchType,
    COUNT(*) AS totalPitches,
    SUM(is_hit) AS hits,
    ROUND(SUM(is_hit) * 1.0 / COUNT(*), 3) AS battingAverage
FROM bigquery-public-data.baseball.games_wide
WHERE pitchType IS NOT NULL
GROUP BY hitterId, hitterFirstName, hitterLastName, pitchType;
