CREATE
    OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS trigger AS
$trg_person_delete_audit$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO person_audit
        SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'D', OLD.*;
    END IF;
    RETURN NULL;
END;
$trg_person_delete_audit$
    LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit
    AFTER DELETE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE
FROM person
WHERE id = 10;

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
UPDATE person
SET name = 'Bulat'
WHERE id = 10;
UPDATE person
SET name = 'Damir'
WHERE id = 10;
DELETE
FROM person
WHERE id = 10;
