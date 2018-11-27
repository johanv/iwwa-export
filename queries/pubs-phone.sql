SELECT contact_id, location_type_id, is_primary, phone, phone_ext, phone_numeric, phone_type_id 
FROM civicrm_phone p JOIN civicrm_contact c ON p.contact_id = c.id
WHERE c.contact_sub_type LIKE '%caf%' AND c.is_deleted = 0;