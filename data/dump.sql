/*
Navicat PGSQL Data Transfer

Source Server         : PostgreSQL
Source Server Version : 90602
Source Host           : localhost:5432
Source Database       : library_java
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90602
File Encoding         : 65001

Date: 2018-02-04 15:36:03
*/


-- ----------------------------
-- Sequence structure for id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."id_seq";
CREATE SEQUENCE "public"."id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 15
 CACHE 1;
SELECT setval('"public"."id_seq"', 15, true);

-- ----------------------------
-- Table structure for author
-- ----------------------------
DROP TABLE IF EXISTS "public"."author";
CREATE TABLE "public"."author" (
"id" int8 DEFAULT nextval('id_seq'::regclass) NOT NULL,
"fio" varchar(300) COLLATE "default" NOT NULL,
"birthday" date NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS "public"."book";
CREATE TABLE "public"."book" (
"id" int8 NOT NULL,
"name" varchar(45) COLLATE "default" NOT NULL,
"content" bytea NOT NULL,
"page_count" int4 NOT NULL,
"isbn" varchar(100) COLLATE "default" NOT NULL,
"genre_id" int8 NOT NULL,
"author_id" int8 NOT NULL,
"publish_year" int4 NOT NULL,
"publisher_id" int8 NOT NULL,
"image" bytea
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for genre
-- ----------------------------
DROP TABLE IF EXISTS "public"."genre";
CREATE TABLE "public"."genre" (
"id" int8 DEFAULT nextval('id_seq'::regclass) NOT NULL,
"name" varchar(100) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for publisher
-- ----------------------------
DROP TABLE IF EXISTS "public"."publisher";
CREATE TABLE "public"."publisher" (
"id" int8 DEFAULT nextval('id_seq'::regclass) NOT NULL,
"name" varchar(100) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table author
-- ----------------------------
ALTER TABLE "public"."author" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table genre
-- ----------------------------
ALTER TABLE "public"."genre" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table publisher
-- ----------------------------
ALTER TABLE "public"."publisher" ADD PRIMARY KEY ("id");