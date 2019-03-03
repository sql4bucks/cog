CREATE TABLE cog.author (
   author_id INT(10) AUTO_INCREMENT NOT NULL,
   first_name VARCHAR(20) NOT NULL,
   last_name VARCHAR(30) NOT NULL,
   PRIMARY KEY (`author_id`)
) ENGINE = InnoDB COMMENT = 'Ministers, singers - content authors' ROW_FORMAT = DEFAULT;
