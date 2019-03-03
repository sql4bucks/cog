CREATE TABLE `picture` (
  `picture_id` int(11) NOT NULL AUTO_INCREMENT,
  `caption_txt` varchar(30) NULL,
  `added_date` date NOT NULL,
  `file_name` varchar(30) NOT NULL,
  `path` varchar(100) NOT NULL,
  `modified_user` int(11) NOT NULL,
  PRIMARY KEY (`picture_id`),
  KEY `user_picture_fk` (`modified_user`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

