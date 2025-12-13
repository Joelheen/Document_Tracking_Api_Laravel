PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "migrations" ("id" integer primary key autoincrement not null, "migration" varchar not null, "batch" integer not null);

CREATE TABLE "users" ("id" integer primary key autoincrement not null, "name" varchar not null, "email" varchar not null, "email_verified_at" datetime, "password" varchar not null, "remember_token" varchar, "created_at" datetime, "updated_at" datetime);

CREATE TABLE "password_reset_tokens" ("email" varchar not null, "token" varchar not null, "created_at" datetime, primary key ("email"));

CREATE TABLE "sessions" ("id" varchar not null, "user_id" integer, "ip_address" varchar, "user_agent" text, "payload" text not null, "last_activity" integer not null, primary key ("id"));

CREATE TABLE "cache" ("key" varchar not null, "value" text not null, "expiration" integer not null, primary key ("key"));

CREATE TABLE "cache_locks" ("key" varchar not null, "owner" varchar not null, "expiration" integer not null, primary key ("key"));

CREATE TABLE "jobs" ("id" integer primary key autoincrement not null, "queue" varchar not null, "payload" text not null, "attempts" integer not null, "reserved_at" integer, "available_at" integer not null, "created_at" integer not null);

CREATE TABLE "job_batches" ("id" varchar not null, "name" varchar not null, "total_jobs" integer not null, "pending_jobs" integer not null, "failed_jobs" integer not null, "failed_job_ids" text not null, "options" text, "cancelled_at" integer, "created_at" integer not null, "finished_at" integer, primary key ("id"));

CREATE TABLE "failed_jobs" ("id" integer primary key autoincrement not null, "uuid" varchar not null, "connection" text not null, "queue" text not null, "payload" text not null, "exception" text not null, "failed_at" datetime not null default CURRENT_TIMESTAMP);

CREATE TABLE "documents" ("id" integer primary key autoincrement not null, "title" varchar not null, "description" text, "status" varchar not null default 'draft', "created_at" datetime, "updated_at" datetime);

INSERT INTO "migrations" ("id","migration","batch") VALUES ('1','0001_01_01_000000_create_users_table','1');
INSERT INTO "migrations" ("id","migration","batch") VALUES ('2','0001_01_01_000001_create_cache_table','1');
INSERT INTO "migrations" ("id","migration","batch") VALUES ('3','0001_01_01_000002_create_jobs_table','1');
INSERT INTO "migrations" ("id","migration","batch") VALUES ('4','2025_12_13_000000_create_documents_table','2');



INSERT INTO "sessions" ("id","user_id","ip_address","user_agent","payload","last_activity") VALUES ('7ruHIQTkiQPBSoViPPZL0SX4rg9hpXF8UX7wfmvf',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoid0lTeVF3aUVmWFdKQ3YwdVV5TEJJc01XbkhZbldWMERFRnA0ZUp0TSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==','1765636021');
INSERT INTO "sessions" ("id","user_id","ip_address","user_agent","payload","last_activity") VALUES ('kJJ7R6JPVVZn2jo7Pyc6N6QTJscrVGTJNEtdZV3n',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiejJIb1ZFN1FaSURWdk5Lb204eVNlZGVWc213Tm9qWDFOWkZLZUJjYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==','1765636022');






INSERT INTO "documents" ("id","title","description","status","created_at","updated_at") VALUES ('1','Project Proposal','Proposal for new project','draft','2025-12-13 14:25:24','2025-12-13 14:25:24');
INSERT INTO "documents" ("id","title","description","status","created_at","updated_at") VALUES ('2','Budget Report','Q1 Budget Report','approved','2025-12-13 14:25:24','2025-12-13 14:25:24');
INSERT INTO "documents" ("id","title","description","status","created_at","updated_at") VALUES ('3','Meeting Notes','Notes from team meeting','in-review','2025-12-13 14:25:24','2025-12-13 14:25:24');
INSERT INTO "documents" ("id","title","description","status","created_at","updated_at") VALUES ('4','Contract Agreement','Client contract agreement','approved','2025-12-13 14:25:24','2025-12-13 14:25:24');

COMMIT;
