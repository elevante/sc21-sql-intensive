# Day 04 - Piscine SQL

## _Snapshots, virtual tables… What is going on?_

Resume: Today you will see how to use a virtual view and physical snapshot of data

## Rules of the day

- Please make sure you have an own database and access for it on your PostgreSQL cluster. 
- Please download a [script](materials/model.sql) with Database Model here and apply the script to your database (you can use command line with psql or just run it through any IDE, for example DataGrip from JetBrains or pgAdmin from PostgreSQL community). **Our knowledge way is incremental and linear therefore please be aware all changes that you made in Day03 during exercises 07-13 should be on place (its similar like in real world , when we applied a release and need to be consistency with data for new changes).**
- All tasks contain a list of Allowed and Denied sections with listed database options, database types, SQL constructions etc. Please have a look at the section before you start.
- Please take a look at the Logical View of our Database Model. 

![schema](misc/images/schema.png)


1. **pizzeria** table (Dictionary Table with available pizzerias)
- field id - primary key
- field name - name of pizzeria
- field rating - average rating of pizzeria (from 0 to 5 points)
2. **person** table (Dictionary Table with persons who loves pizza)
- field id - primary key
- field name - name of person
- field age - age of person
- field gender - gender of person
- field address - address of person
3. **menu** table (Dictionary Table with available menu and price for concrete pizza)
- field id - primary key
- field pizzeria_id - foreign key to pizzeria
- field pizza_name - name of pizza in pizzeria
- field price - price of concrete pizza
4. **person_visits** table (Operational Table with information about visits of pizzeria)
- field id - primary key
- field person_id - foreign key to person
- field pizzeria_id - foreign key to pizzeria
- field visit_date - date (for example 2022-01-01) of person visit 
5. **person_order** table (Operational Table with information about persons orders)
- field id - primary key
- field person_id - foreign key to person
- field menu_id - foreign key to menu
- field order_date - date (for example 2022-01-01) of person order 

Persons' visit and persons' order are different entities and don't contain any correlation between data. For example, a client can be in one restraunt (just looking at menu) and in this time make an order in different one by phone or by mobile application. Or another case,  just be at home and again make a call with order without any visits.

## Chapter IV
## Exercise 00 - Let’s create separated views for persons

| Exercise 00: Let’s create separated views for persons |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex00                                                                                                                     |
| Files to turn-in                      | `day04_ex00.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Please create 2 Database Views (with similar attributes like the original table) based on simple filtering of gender of persons. Set the corresponding names for the database views: `v_persons_female` and `v_persons_male`.


## Chapter V
## Exercise 01 - From parts to common view

| Exercise 01: From parts to common view|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex01                                                                                                                     |
| Files to turn-in                      | `day04_ex01.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Please use 2 Database Views from Exercise #00 and write SQL to get female and male person names in one list. Please set the order by person name. The sample of data is presented below.

| name |
| ------ |
| Andrey |
| Anna |
| ... |


## Chapter VI
## Exercise 02 - “Store” generated dates in one place

| Exercise 02: “Store” generated dates in one place|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex02                                                                                                                     |
| Files to turn-in                      | `day04_ex02.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |
| SQL Syntax Construction                        | `generate_series(...)`                                                                                              |

Please create a Database View (with name `v_generated_dates`) which should be “store” generated dates from 1st to 31th of January 2022 in DATE type. Don’t forget about order for the generated_date column.  

| generated_date |
| ------ |
| 2022-01-01 |
| 2022-01-02 |
| ... |


## Chapter VII
## Exercise 03 - Find missing visit days with Database View

| Exercise 03: Find missing visit days with Database View |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex03                                                                                                                     |
| Files to turn-in                      | `day04_ex03.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |


Please write a SQL statement which returns missing days for persons’ visits in January of 2022. Use `v_generated_dates` view for that task and sort the result by missing_date column. The sample of data is presented below.

| missing_date |
| ------ |
| 2022-01-11 |
| 2022-01-12 |
| ... |

## Exercise 04 - Let’s find something from Set Theory


| Exercise 04: Let’s find something from Set Theory |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex04                                                                                                                     |
| Files to turn-in                      | `day04_ex04.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Please write a SQL statement which satisfies a formula `(R - S)∪(S - R)` .
Where R is the `person_visits` table with filter by 2nd of January 2022, S is also `person_visits` table but with a different filter by 6th of January 2022. Please make your calculations with sets under the `person_id` column and this column will be alone in a result. The result please sort by `person_id` column and your final SQL please present in `v_symmetric_union` (*) database view.

(*) to be honest, the definition “symmetric union” doesn’t exist in Set Theory. This is the author's interpretation, the main idea is based on the existing rule of symmetric difference. 



## Exercise 05 - Let’s calculate a discount price for each person


| Exercise 05: Let’s calculate a discount price for each person |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex05                                                                                                                     |
| Files to turn-in                      | `day04_ex05.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Please create a Database View `v_price_with_discount` that returns a person's orders with person names, pizza names, real price and calculated column `discount_price` (with applied 10% discount and satisfies formula `price - price*0.1`). The result please sort by person name and pizza name and make a round for `discount_price` column to integer type. Please take a look at a sample result below.


| name |  pizza_name | price | discount_price |
| ------ | ------ | ------ | ------ | 
| Andrey | cheese pizza | 800 | 720 | 
| Andrey | mushroom pizza | 1100 | 990 |
| ... | ... | ... | ... |




## Exercise 06 - Materialization from virtualization


| Exercise 06: Materialization from virtualization |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex06                                                                                                                     |
| Files to turn-in                      | `day04_ex06.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |

Please create a Materialized View `mv_dmitriy_visits_and_eats` (with data included) based on SQL statement that finds the name of pizzeria Dmitriy visited on January 8, 2022 and could eat pizzas for less than 800 rubles (this SQL you can find out at Day #02 Exercise #07). 

To check yourself you can write SQL to Materialized View `mv_dmitriy_visits_and_eats` and compare results with your previous query.

## Exercise 07 - Refresh our state


| Exercise 07: Refresh our state|                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex07                                                                                                                     |
| Files to turn-in                      | `day04_ex07.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |
| **Denied**                               |                                                                                                                          |
| SQL Syntax Pattern                        | Don’t use direct numbers for identifiers of Primary Key, person and pizzeria                                                                                               |

Let's refresh data in our Materialized View `mv_dmitriy_visits_and_eats` from exercise #06. Before this action, please generate one more Dmitriy visit that satisfies the SQL clause of Materialized View except pizzeria that we can see in a result from exercise #06.
After adding a new visit please refresh a state of data for `mv_dmitriy_visits_and_eats`.

## Exercise 08 - Just clear our database


| Exercise 08: Just clear our database |                                                                                                                          |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Turn-in directory                     | ex08                                                                                                                     |
| Files to turn-in                      | `day04_ex08.sql`                                                                                 |
| **Allowed**                               |                                                                                                                          |
| Language                        | ANSI SQL                                                                                              |           

After all our exercises were born a few Virtual Tables and one Materialized View. Let’s drop them!


