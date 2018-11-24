SELECT contact_id, location_type_id, email, is_primary, on_hold, hold_date 
FROM civicrm_email e JOIN civicrm_contact c ON e.contact_id = c.id
WHERE c.contact_type = 'individual' AND c.is_deleted = 0