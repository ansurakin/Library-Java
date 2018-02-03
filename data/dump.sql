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

Date: 2018-02-02 23:18:29
*/


-- ----------------------------
-- Table structure for author
-- ----------------------------
DROP TABLE IF EXISTS "public"."author";
CREATE TABLE "public"."author" (
"id" int8 NOT NULL,
"fio" varchar(300) COLLATE "default" NOT NULL,
"birthday" date NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of author
-- ----------------------------

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
"publish_year" date NOT NULL,
"publisher_id" int8 NOT NULL,
"image" bytea
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of book
-- ----------------------------

-- ----------------------------
-- Table structure for genre
-- ----------------------------
DROP TABLE IF EXISTS "public"."genre";
CREATE TABLE "public"."genre" (
"id" int8 NOT NULL,
"name" varchar(100) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of genre
-- ----------------------------

-- ----------------------------
-- Table structure for publisher
-- ----------------------------
DROP TABLE IF EXISTS "public"."publisher";
CREATE TABLE "public"."publisher" (
"id" int8 NOT NULL,
"name" varchar(100) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of publisher
-- ----------------------------

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table author
-- ----------------------------
ALTER TABLE "public"."author" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table book
-- ----------------------------
CREATE UNIQUE INDEX "id_UNIQUE" ON "public"."book" USING btree ("id");
CREATE UNIQUE INDEX "isbn_UNIQUE" ON "public"."book" USING btree ("isbn");
CREATE INDEX "fk_author_idx" ON "public"."book" USING btree ("author_id");
CREATE INDEX "fk_genre_idx" ON "public"."book" USING btree ("genre_id");

-- ----------------------------
-- Primary Key structure for table book
-- ----------------------------
ALTER TABLE "public"."book" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table genre
-- ----------------------------
ALTER TABLE "public"."genre" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table publisher
-- ----------------------------
ALTER TABLE "public"."publisher" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "public"."book"
-- ----------------------------
ALTER TABLE "public"."book" ADD FOREIGN KEY ("author_id") REFERENCES "public"."author" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."book" ADD FOREIGN KEY ("genre_id") REFERENCES "public"."genre" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
