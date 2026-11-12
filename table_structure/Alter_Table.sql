#Alter-ADD
ALTER TABLE job_applied
ADD contact VARCHAR(50);

#Alter-RENAME
ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name

#Alter-COLUMN
ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT 

#DROP_COLUMN

ALTER TABLE job_applied
DROP COLUMN contact_name;

#DROP_Table

DROP TABLE job_applied;


Select* from job_applied