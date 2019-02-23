UPDATE location 
SET 
    google_url = '<iframe width="480" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?source=s_q&hl=en&geocode=&q=255+E+Exeter+Street,+Gladstone,+OR+97027&t=h&ie=UTF8&output=embed"></iframe>',
    name_txt = 'Gladstone',
    description = 'The Gladstone Community Club',
    address = '255 E. Exeter St.',
    active_ind = 'Y'
WHERE
    location_id = '2';

UPDATE location
SET
    active_ind = 'N'
WHERE
        location_id = '1';

UPDATE location
SET
    google_url = '<iframe width="480" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=14810+Skelton+Rd+SE+Jefferson,+OR&amp;&t=h&ie=UTF8&output=embed"></iframe>'
WHERE
    location_id = '4';

UPDATE location
SET
    google_url = '<iframe width="480" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=8500+Frankoma+Road,+Sapulpa,+OK&amp;&t=h&ie=UTF8&output=embed"></iframe>'
WHERE
        location_id = '5';

UPDATE location
SET
    google_url = '<iframe width="480" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=18762+Linden+Drive+Neosho,+MO+64850&amp;&t=h&ie=UTF8&output=embed"></iframe>'
WHERE
        location_id = '6';

UPDATE location
SET
    google_url = '<iframe width="480" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=444+E.+Evergreen+Springfield,+MO&amp;&t=h&ie=UTF8&output=embed"></iframe>'
WHERE
        location_id = '7';

UPDATE location
SET
    google_url = '<iframe width="480" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&source=s_q&hl=en&geocode=&q=6438+Northeast+23rd+Street,+Oklahoma+City,+OK&t=h&ie=UTF8&output=embed"></iframe>'
WHERE
        location_id = '8';
