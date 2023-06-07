COMMENT ON TABLE person_discounts IS 'Table of discounts for each person';

COMMENT ON COLUMN person_discounts.id IS 'ID of discount';

COMMENT ON COLUMN person_discounts.person_id IS 'ID of person';

COMMENT ON COLUMN person_discounts.pizzeria_id IS 'ID of pizzeria, where the person has a discount';

COMMENT ON COLUMN person_discounts.discount IS 'Size of the discount';