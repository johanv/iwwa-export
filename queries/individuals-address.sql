SELECT contact_id, location_type_id, is_primary, street_address, city, 
    postal_code, 
	cc.name as country, cc.iso_code 
FROM civicrm_address a JOIN civicrm_contact c ON a.contact_id = c.id
LEFT OUTER JOIN civicrm_country cc ON cc.id = a.country_id
WHERE c.contact_type = 'individual';

