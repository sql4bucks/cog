CREATE TABLE `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_txt` varchar(30) NOT NULL,
  `state_id` int(11) NOT NULL,
  `description` varchar(75) NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `state_city_fk` (`state_id`),
  CONSTRAINT `state_city_fk` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

