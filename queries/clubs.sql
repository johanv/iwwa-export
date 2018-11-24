use civi;

SELECT id, organization_name, created_date, modified_date
FROM civicrm_contact WHERE CONTACT_SUB_TYPE LIKE '%Club%' AND is_deleted = 0