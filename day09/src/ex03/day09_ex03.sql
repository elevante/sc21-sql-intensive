DROP TRIGGER trg_person_insert_audit ON person;
DROP TRIGGER trg_person_update_audit ON person;
DROP TRIGGER trg_person_delete_audit ON person;

DROP FUNCTION fnc_trg_person_insert_audit;
DROP FUNCTION fnc_trg_person_update_audit;
DROP FUNCTION fnc_trg_person_delete_audit;

CREATE
    OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS trigger AS
$trg_person_audit$
BEGIN
    IF
        (TG_OP = 'UPDATE') THEN
        INSERT INTO person_audit
        SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'U', NEW.*;
    ELSIF (TG_OP = 'INSERT') THEN
        INSERT INTO person_audit
        SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'I', NEW.*;
    ELSIF
        (TG_OP = 'DELETE') THEN
        INSERT INTO person_audit
        SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'D', OLD.*;

    END IF;
    RETURN NULL;
END;
$trg_person_audit$
    LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit
    AFTER INSERT OR
        UPDATE OR
        DELETE
    ON person
    FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit();
