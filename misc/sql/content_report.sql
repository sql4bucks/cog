-- SELECT * FROM cog.content;
use cog;

select 
content.content_id, content.name_txt as title,
concat(author.first_name, ' ', author.last_name) as author_name, 
content_type.content_type, 
location.name_txt as location_name, content.content_date, 
content.file_name, content.path, content.active_ind
from content
left join author on content.author_id = author.author_id
left join location on content.location_id = location.location_id
left join content_type on content.content_type_id = content_type.content_type_id
INTO OUTFILE '/home/javabucks/content-report.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- Get's a reference to the file via http
echo "select 
content.content_id, content.name_txt as title,
concat(author.first_name, ' ', author.last_name) as author_name,
location.name_txt as location_name, content.content_date, 
content.file_name, 
case 
	when content_type.content_type = 'Sunday School' then substring(content.name_txt, 1, position(' ' IN content.name_txt))
	else '' 
END as series,
case 
	when content_type.content_type = 'Sunday School' then substring(content.name_txt, 1, position(' ' IN content.name_txt))
	else '' 
END as book,
content_type.content_type, content.active_ind
from content
left join author on content.author_id = author.author_id
left join location on content.location_id = location.location_id
left join content_type on content.content_type_id = content_type.content_type_id" | mysql --user=root -p cog > content-report.txt;


-- Version to run from command line
-- June 2025
echo "select
    content.content_id, content.name_txt as title,
    concat(author.first_name, ' ', author.last_name) as author_name,
    content_type.content_type,
    topic.name_txt as topic_txt,
    location.name_txt as location_name, content.content_date,
    content.file_name, content.path,
    content.active_ind, concat('http://www.churchofgodportland.org/content/file/', content.content_id) as url
from content
         left join author on content.author_id = author.author_id
         left join location on content.location_id = location.location_id
         left join topic on content.topic_id = topic.topic_id
         left join content_type on content.content_type_id = content_type.content_type_id" | mysql --user=root -p cog > content-with-topic.txt


-- Get simple version with only message content and file name
select 
content.content_id, content.name_txt as title,
concat(author.first_name, ' ', author.last_name) as author_name,
location.name_txt as location_name, content.content_date, 
content.file_name, content_type.content_type, content.active_ind
from content
left join author on content.author_id = author.author_id
left join location on content.location_id = location.location_id
left join content_type on content.content_type_id = content_type.content_type_id;


-- Get version that handles sunday school fields
select 
content.content_id, content.name_txt as title,
concat(author.first_name, ' ', author.last_name) as author_name,
location.name_txt as location_name, content.content_date, 
content.file_name, 
case 
	when content_type.content_type = 'Sunday School' then substring(content.name_txt, 1, position(' ' IN content.name_txt))
	else '' 
END as series,
case 
	when content_type.content_type = 'Sunday School' then substring(content.name_txt, 1, position(' ' IN content.name_txt))
	else '' 
END as book,
content_type.content_type, content.active_ind
from content
left join author on content.author_id = author.author_id
left join location on content.location_id = location.location_id
left join content_type on content.content_type_id = content_type.content_type_id;

-- Executing this from command line

echo "select 
content.content_id, content.name_txt as title,
concat(author.first_name, ' ', author.last_name) as author_name,
location.name_txt as location_name, content.content_date, 
content.file_name, 
case 
	when content_type.content_type = 'Sunday School' then substring(content.name_txt, 1, position(' ' IN content.name_txt))
	else '' 
END as series,
case 
	when content_type.content_type = 'Sunday School' then substring(content.name_txt, 1, position(' ' IN content.name_txt))
	else '' 
END as book,
content_type.content_type, content.active_ind
from content
left join author on content.author_id = author.author_id
left join location on content.location_id = location.location_id
left join content_type on content.content_type_id = content_type.content_type_id" | mysql --user=root -p cog > content-report.txt;
