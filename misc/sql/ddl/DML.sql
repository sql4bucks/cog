INSERT INTO cog.admin_user
(security_role_id, login_id, first_name, last_name, password, email) 
VALUES (security_role_id, 'login_id', 'first_name', 'last_name', 'password', 'email');
INSERT INTO cog.author
(first_name, last_name) 
VALUES ('first_name', 'last_name');
INSERT INTO cog.city
(name_txt, state_id, description) 
VALUES ('name_txt', state_id, 'description');
INSERT INTO cog.content
(name_txt, content_type_id, topic_id, location_id, content_date, added_date, file_name, path, modified_user, author_id, active_ind) 
VALUES ('name_txt', content_type_id, topic_id, location_id, 'content_date', 'added_date', 'file_name', 'path', modified_user, author_id, 'active_ind');
INSERT INTO cog.content_tag
(content_id, tag_id, modified_user) 
VALUES (content_id, tag_id, modified_user);
INSERT INTO cog.content_type
(content_type, description) 
VALUES ('content_type', 'description');
INSERT INTO cog.location
(name_txt, description, address, city_id, active_ind, google_url) 
VALUES ('name_txt', 'description', 'address', city_id, 'active_ind', 'google_url');
INSERT INTO cog.location_detail
(location_id, type_code, `label`, value, sort_order) 
VALUES (location_id, 'type_code', 'label', 'value', sort_order);
INSERT INTO cog.location_template
(type_code, `label`, value, sort_order) 
VALUES ('type_code', 'label', 'value', sort_order);
INSERT INTO cog.picture
(caption_txt, modified_date, file_name, path, modified_user, description, active_ind) 
VALUES ('caption_txt', 'modified_date', 'file_name', 'path', modified_user, 'description', 'active_ind');
INSERT INTO cog.role
(authority) 
VALUES ('authority');
INSERT INTO cog.scripture
(scripture_txt, chapter_verse) 
VALUES ('scripture_txt', 'chapter_verse');
INSERT INTO cog.security_role
(name_txt, access_level, description) 
VALUES ('name_txt', access_level, 'description');
INSERT INTO cog.state
(state_cd, name_txt) 
VALUES ('state_cd', 'name_txt');
INSERT INTO cog.subscription
(name_txt, description) 
VALUES ('name_txt', 'description');
INSERT INTO cog.tag
(name_txt) 
VALUES ('name_txt');
INSERT INTO cog.topic
(name_txt) 
VALUES ('name_txt');
INSERT INTO cog.user
(user_name, first_name, last_name, password, enabled, password_expired, account_expired, account_locked) 
VALUES ('user_name', 'first_name', 'last_name', 'password', enabled, password_expired, account_expired, account_locked);
INSERT INTO cog.user_role
(user_id, role_id) 
VALUES (user_id, role_id);
INSERT INTO cog.user_subscription
(subscription_id, user_id) 
VALUES (subscription_id, user_id);
