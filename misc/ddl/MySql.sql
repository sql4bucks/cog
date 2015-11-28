CREATE TABLE `author` (
  `author_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='Ministers, singers - content authors';

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `authority` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Spring security';

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `password` varchar(256) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `password_expired` tinyint(1) NOT NULL DEFAULT '0',
  `account_expired` tinyint(1) NOT NULL DEFAULT '1',
  `account_locked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Spring security authentication';

CREATE TABLE `user_role` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `user_role_role_fk` (`role_id`),
  KEY `user_role_user_fk` (`user_id`),
  CONSTRAINT `user_role_role_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Spring Security';

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_cd` char(2) NOT NULL,
  `name_txt` varchar(30) NOT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

CREATE TABLE `subscription` (
  `subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_txt` varchar(30) NOT NULL,
  `description` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `content_type` (
  `content_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type` varchar(16) NOT NULL,
  `description` varchar(75) NOT NULL,
  PRIMARY KEY (`content_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


CREATE TABLE `picture` (
  `picture_id` int(11) NOT NULL AUTO_INCREMENT,
  `caption_txt` varchar(30) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `file_name` varchar(30) NOT NULL,
  `path` varchar(100) NOT NULL,
  `modified_user` int(11) NOT NULL,
  `description` varchar(75) DEFAULT NULL,
  `active_ind` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`picture_id`),
  KEY `user_picture_fk` (`modified_user`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;


CREATE TABLE `scripture` (
  `scripture_id` int(10) NOT NULL AUTO_INCREMENT,
  `scripture_txt` varchar(512) NOT NULL,
  `chapter_verse` varchar(75) NOT NULL,
  PRIMARY KEY (`scripture_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1 COMMENT='Scriptures';


CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_txt` varchar(30) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_txt` varchar(30) NOT NULL,
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;


CREATE TABLE `user_subscription` (
  `user_subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_subscription_id`),
  KEY `subscription_user_fk` (`subscription_id`),
  KEY `user_user_subscription_fk` (`user_id`),
  CONSTRAINT `subscription_user_fk` FOREIGN KEY (`subscription_id`) REFERENCES `subscription` (`subscription_id`),
  CONSTRAINT `user_user_subscription_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_txt` varchar(30) NOT NULL,
  `state_id` int(11) NOT NULL,
  `description` varchar(75) NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `state_city_fk` (`state_id`),
  CONSTRAINT `state_city_fk` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_txt` varchar(30) NOT NULL,
  `description` varchar(75) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `active_ind` char(1) NOT NULL DEFAULT 'Y',
  `google_url` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  KEY `city_location_fk` (`city_id`),
  CONSTRAINT `city_location_fk` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

CREATE TABLE `location_detail` (
  `location_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `type_code` varchar(20) NOT NULL,
  `label` varchar(30) NOT NULL,
  `value` varchar(50) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`location_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;

CREATE TABLE `location_template` (
  `location_template_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(20) NOT NULL,
  `label` varchar(30) NOT NULL,
  `value` varchar(50) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`location_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;


CREATE TABLE `content` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_txt` varchar(30) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `content_date` date NOT NULL,
  `added_date` date NOT NULL,
  `file_name` varchar(30) NOT NULL,
  `path` varchar(100) NOT NULL,
  `modified_user` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `active_ind` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`content_id`),
  KEY `user_content_fk` (`modified_user`),
  KEY `content_type_content_fk` (`content_type_id`),
  KEY `topic_content_fk` (`topic_id`),
  KEY `location_content_fk` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

CREATE TABLE `content_tag` (
  `content_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `modified_user` int(11) NOT NULL,
  PRIMARY KEY (`content_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `url` varchar(100) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

