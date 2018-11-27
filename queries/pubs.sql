use civi;

SELECT id, organization_name, created_date, modified_date
FROM civicrm_contact WHERE contact_sub_type LIKE '%Caf%' AND is_deleted = 0