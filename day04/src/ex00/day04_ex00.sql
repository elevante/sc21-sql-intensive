CREATE VIEW v_persons_female AS
SELECT
  *
FROM
  person
WHERE
  gender = 'female';

CREATE VIEW v_persons_male AS
SELECT
  *
FROM
  person
WHERE
  gender = 'male';
