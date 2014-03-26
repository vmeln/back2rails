CREATE TABLE "carts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "line_items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "product_id" integer, "cart_id" integer, "created_at" datetime, "updated_at" datetime, "quantity" integer DEFAULT 1, "price" decimal, "order" reference);
CREATE TABLE "orders" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "address" text, "email" varchar(255), "pay_type" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "products" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "description" text, "image_url" varchar(255), "price" decimal, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20140310140453');

INSERT INTO schema_migrations (version) VALUES ('20140310220723');

INSERT INTO schema_migrations (version) VALUES ('20140310221931');

INSERT INTO schema_migrations (version) VALUES ('20140310235648');

INSERT INTO schema_migrations (version) VALUES ('20140311012125');

INSERT INTO schema_migrations (version) VALUES ('20140311031010');

INSERT INTO schema_migrations (version) VALUES ('20140311042840');

INSERT INTO schema_migrations (version) VALUES ('20140317162905');

INSERT INTO schema_migrations (version) VALUES ('20140326180208');
