CREATE TABLE `scripture` (
  `scripture_id` int(10) NOT NULL AUTO_INCREMENT,
  `scripture_txt` varchar(512) NOT NULL,
  `chapter_verse` varchar(75) NOT NULL,
  PRIMARY KEY (`scripture_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Scriptures';

