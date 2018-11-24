SELECT title, ov.label AS event_type, start_date, end_date, 
	a.street_address, a.postal_code, a.city, 
    created_id, created_date FROM civicrm_event e
LEFT OUTER JOIN civicrm_option_value ov ON ov.value = event_type_id AND ov.option_group_id = 15
LEFT OUTER JOIN civicrm_loc_block lb ON e.loc_block_id = lb.id
LEFT OUTER JOIN civicrm_address a ON lb.address_id = a.id
WHERE e.is_active = 1;
