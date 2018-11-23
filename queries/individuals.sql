use civi;

SELECT id,preferred_language,first_name,last_name,gender_id,birth_date,created_date,modified_date 
FROM civicrm_contact WHERE CONTACT_TYPE='Individual' AND is_deleted = 0;
