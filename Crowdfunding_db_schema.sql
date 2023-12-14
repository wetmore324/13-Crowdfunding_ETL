﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/TljgCf
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_Contacts" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "Campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar(30)   NOT NULL,
    "description" varchar(500)   NOT NULL,
    "goal" int   NOT NULL,
    "pledged" int   NOT NULL,
    "outcome" varchar(30)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar(10)   NOT NULL,
    "currency" varchar(10)   NOT NULL,
    "launched_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "staff_pick" varchar(5)   NOT NULL,
    "spotlight" varchar(5)   NOT NULL,
    "category_subcategory" varchar(30)   NOT NULL,
    "category" varchar(30)   NOT NULL,
    "subcategory" varchar(30)   NOT NULL,
    "category_id" varchar(10)   NOT NULL,
    "subcategory_id" varchar(10)   NOT NULL,
    CONSTRAINT "pk_Campaign" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "Category" (
    "category_id" varchar(10)   NOT NULL,
    "category" varchar(10)   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "Subcategory" (
    "subcategory_id" varchar(10)   NOT NULL,
    "subcategory" varchar(10)   NOT NULL,
    CONSTRAINT "pk_Subcategory" PRIMARY KEY (
        "subcategory_id","subcategory"
     )
);

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "Contacts" ("contact_id");

ALTER TABLE "Category" ADD CONSTRAINT "fk_Category_category" FOREIGN KEY("category")
REFERENCES "Campaign" ("category");

ALTER TABLE "Subcategory" ADD CONSTRAINT "fk_Subcategory_subcategory" FOREIGN KEY("subcategory")
REFERENCES "Campaign" ("subcategory");
