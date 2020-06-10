-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE IF EXISTS transaction CASCADE;
CREATE TABLE "transaction" (
    "id" SERIAL   NOT NULL,
    "date" TIMESTAMP   NOT NULL,
    "amount" MONEY   NOT NULL,
    "card" VARCHAR(20)   NOT NULL,
    "id_merchant" INT   NOT NULL,
    CONSTRAINT "pk_transaction" PRIMARY KEY (
        "id"
     )
);

DROP TABLE IF EXISTS merchant CASCADE;
CREATE TABLE "merchant" (
    "id" SERIAL   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    "id_merchant_category" INT   NOT NULL,
    CONSTRAINT "pk_merchant" PRIMARY KEY (
        "id"
     )
);

DROP TABLE IF EXISTS credit_card CASCADE;
CREATE TABLE "credit_card" (
    "card" VARCHAR(20)   NOT NULL,
    "id_card_holder" INT   NOT NULL,
    CONSTRAINT "pk_credit_card" PRIMARY KEY (
        "card"
     )
);

DROP TABLE IF EXISTS card_holder CASCADE;
CREATE TABLE "card_holder" (
    "id" SERIAL   NOT NULL,
    "name" VARCHAR(26)   NOT NULL,
    CONSTRAINT "pk_card_holder" PRIMARY KEY (
        "id"
     )
);

DROP TABLE IF EXISTS merchant_category CASCADE;
CREATE TABLE "merchant_category" (
    "id" SERIAL   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_merchant_category" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_card" FOREIGN KEY("card")
REFERENCES "credit_card" ("card");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_id_merchant" FOREIGN KEY("id_merchant")
REFERENCES "merchant" ("id");

ALTER TABLE "merchant" ADD CONSTRAINT "fk_merchant_id_merchant_category" FOREIGN KEY("id_merchant_category")
REFERENCES "merchant_category" ("id");

ALTER TABLE "credit_card" ADD CONSTRAINT "fk_credit_card_id_card_holder" FOREIGN KEY("id_card_holder")
REFERENCES "card_holder" ("id");

