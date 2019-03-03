CREATE TABLE `security_role` (
  `security_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_txt` varchar(30) NOT NULL,
  `access_level` tinyint(4) NOT NULL,
  `description` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`security_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

