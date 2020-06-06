CREATE TABLE `admin_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `security_role_id` int(11) NOT NULL,
  `login_id` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `security_role_user_fk` (`security_role_id`),
  CONSTRAINT `security_role_user_fk` FOREIGN KEY (`security_role_id`) REFERENCES `security_role` (`security_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

