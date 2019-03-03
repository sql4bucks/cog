CREATE TABLE `content_tag` (
  `content_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `modified_user` int(11) NOT NULL,
  PRIMARY KEY (`content_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

