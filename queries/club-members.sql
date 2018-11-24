SELECT r.contact_id_a AS individual_id, r.contact_id_b AS club_id FROM civicrm_contact i
JOIN civicrm_relationship r ON r.contact_id_a = i.id AND r.relationship_type_id=11
JOIN civicrm_contact c ON r.contact_id_b = c.id AND c.is_deleted = 0