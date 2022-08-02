CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" serial NOT NULL,
	"e-mail" TEXT NOT NULL UNIQUE,
	"cpf" varchar(11) NOT NULL UNIQUE,
	"password" TEXT NOT NULL UNIQUE,
	"address" TEXT NOT NULL UNIQUE,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" integer NOT NULL,
	"pictures" TEXT NOT NULL,
	"mainPicture" TEXT NOT NULL,
	"category" TEXT NOT NULL,
	"size" TEXT NOT NULL,
	"stock" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.carts" (
	"id" serial NOT NULL,
	"userId" serial NOT NULL,
	"productId" serial NOT NULL,
	"quantity" integer NOT NULL,
	"state" TEXT NOT NULL DEFAULT 'criada',
	"purchaseDate" DATE,
	"address" TEXT NOT NULL,
	CONSTRAINT "carts_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("category") REFERENCES "categories"("name");

ALTER TABLE "carts" ADD CONSTRAINT "carts_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "carts" ADD CONSTRAINT "carts_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "carts" ADD CONSTRAINT "carts_fk2" FOREIGN KEY ("address") REFERENCES "users"("address");






