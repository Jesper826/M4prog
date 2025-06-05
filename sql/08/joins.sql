SELECT * FROM `teamlidv2`;

SELECT
    *
FROM
    teamlidv2
    JOIN teamlidv2_teamv2 ON teamlidv2.id = teamlidv2_teamv2.teamlidid;
    JOIN teamv2_teamv2 ON teamv2.id = teamv2_teamv2.teamid;

