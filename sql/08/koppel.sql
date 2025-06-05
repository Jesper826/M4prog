CREATE TABLE `teamlidv2_teamv2` (
  `teamlidid` INT NOT NULL,
  `teamid` INT NOT NULL,
  PRIMARY KEY (`teamlidid`, `teamid`),
  UNIQUE INDEX `teamlid_team_UNIQUE` (`teamlidid` ASC, `teamid` ASC) VISIBLE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
 