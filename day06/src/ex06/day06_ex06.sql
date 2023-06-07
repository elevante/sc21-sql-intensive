CREATE SEQUENCE seq_person_discounts START WITH 1 INCREMENT BY 1;

SELECT
    SETVAL(
        'seq_person_discounts',
        (
            SELECT
                max(id)
            FROM
                person_discounts
        )
    );

ALTER TABLE
    person_discounts ALTER id
SET
    DEFAULT NEXTVAL('seq_person_discounts');