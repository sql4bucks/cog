CREATE TABLE cog.scripture (
   scripture_id INT(10) AUTO_INCREMENT NOT NULL,
   scripture_txt VARCHAR(512) NOT NULL,
   chapter_verse VARCHAR(75) NOT NULL,
   PRIMARY KEY (`scripture_id`)
) ENGINE = InnoDB COMMENT = 'Scriptures' ROW_FORMAT = DEFAULT;
