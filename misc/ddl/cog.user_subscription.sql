CREATE TABLE `user_subscription` (
  `user_subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_subscription_id`),
  KEY `subscription_user_fk` (`subscription_id`),
  KEY `user_user_subscription_fk` (`user_id`),
  CONSTRAINT `subscription_user_fk` FOREIGN KEY (`subscription_id`) REFERENCES `subscription` (`subscription_id`),
  CONSTRAINT `user_user_subscription_fk` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

