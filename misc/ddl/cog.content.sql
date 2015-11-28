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
  PRIMARY KEY (`content_id`),
  KEY `user_content_fk` (`modified_user`),
  KEY `content_type_content_fk` (`content_type_id`),
  KEY `topic_content_fk` (`topic_id`),
  KEY `location_content_fk` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

