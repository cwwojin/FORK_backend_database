-- CREATE tables

CREATE TABLE "user" (
  "id" SERIAL PRIMARY KEY,
  "account_id" varchar(20) UNIQUE NOT NULL,
  "user_type" smallint NOT NULL,
  "password" varchar(72) NOT NULL,
  "email" varchar(255) NOT NULL,
  "profile_img_uri" varchar(255) DEFAULT '',
  "register_date" date DEFAULT (current_date),
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "preference" (
  "id" SERIAL PRIMARY KEY,
  "type" smallint NOT NULL,
  "name" varchar(50) NOT NULL,
  "slug" varchar(50),
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "user_preference" (
  "user_id" integer NOT NULL,
  "preference_id" integer NOT NULL,
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp),
  PRIMARY KEY ("user_id", "preference_id")
);

CREATE TABLE "facility" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(50) NOT NULL,
  "english_name" varchar(50) DEFAULT '',
  "slug" varchar(50),
  "type" varchar(50) DEFAULT '',
  "business_id" varchar(255) NOT NULL,
  "profile_img_uri" varchar(255) DEFAULT '',
  "phone" varchar(50) DEFAULT '',
  "email" varchar(255) DEFAULT '',
  "url" varchar(255) DEFAULT '',
  "description" varchar(255) DEFAULT '',
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "address" (
  "facility_id" integer PRIMARY KEY,
  "post_number" varchar(50) DEFAULT '',
  "country" varchar(50) DEFAULT '',
  "city" varchar(50) DEFAULT '',
  "road_address" varchar(255) DEFAULT '',
  "jibun_address" varchar(255) DEFAULT '',
  "english_address" varchar(255) DEFAULT '',
  "lat" float8 NOT NULL,
  "lng" float8 NOT NULL,
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "opening_hours" (
  "id" SERIAL PRIMARY KEY,
  "facility_id" integer NOT NULL,
  "day" smallint NOT NULL,
  "open_time" time NOT NULL,
  "close_time" time NOT NULL,
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "menu" (
  "id" SERIAL PRIMARY KEY,
  "facility_id" integer NOT NULL,
  "name" varchar(255) NOT NULL,
  "slug" varchar(255),
  "img_uri" varchar(255) DEFAULT '',
  "description" varchar(255),
  "price" integer DEFAULT 0,
  "quantity" varchar(50),
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "facility_preference" (
  "facility_id" integer NOT NULL,
  "preference_id" integer NOT NULL,
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp),
  PRIMARY KEY ("facility_id", "preference_id")
);

CREATE TABLE "manages" (
  "user_id" integer NOT NULL,
  "facility_id" integer NOT NULL,
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp),
  PRIMARY KEY ("user_id", "facility_id")
);

CREATE TABLE "favorite" (
  "user_id" integer NOT NULL,
  "facility_id" integer NOT NULL,
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp),
  PRIMARY KEY ("user_id", "facility_id")
);

CREATE TABLE "facility_registration_request" (
  "id" SERIAL PRIMARY KEY,
  "author_id" integer DEFAULT null,
  "status" smallint DEFAULT 0,
  "title" varchar(50) NOT NULL,
  "content" json NOT NULL,
  "send_date" timestamp DEFAULT (current_timestamp),
  "respond_date" timestamp,
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "post" (
  "id" serial PRIMARY KEY,
  "author_id" integer DEFAULT null,
  "facility_id" integer NOT NULL,
  "title" varchar(50) NOT NULL,
  "content" text DEFAULT '',
  "img_uri" varchar(255) DEFAULT '',
  "post_date" timestamp DEFAULT (current_timestamp),
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "review" (
  "id" serial PRIMARY KEY,
  "author_id" integer NOT NULL,
  "facility_id" integer NOT NULL,
  "score" smallint NOT NULL,
  "content" text DEFAULT '',
  "img_uri" varchar(255) DEFAULT '',
  "likes" int DEFAULT 0,
  "post_date" timestamp DEFAULT (current_timestamp),
  "update_date" timestamp DEFAULT (current_timestamp),
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "hashtag" (
  "id" serial PRIMARY KEY,
  "name" varchar(50) UNIQUE NOT NULL,
  "slug" varchar(50),
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "review_hashtag" (
  "review_id" integer NOT NULL,
  "hashtag_id" integer NOT NULL,
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp),
  PRIMARY KEY ("review_id", "hashtag_id")
);

CREATE TABLE "stamp_ruleset" (
  "facility_id" integer PRIMARY KEY,
  "logo_img_uri" varchar(255) DEFAULT '',
  "total_cnt" integer NOT NULL,
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "stamp_reward" (
  "id" serial PRIMARY KEY,
  "facility_id" integer NOT NULL,
  "cnt" integer NOT NULL,
  "name" varchar(50) DEFAULT '',
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "stampbook" (
  "user_id" integer NOT NULL,
  "facility_id" integer NOT NULL,
  "cnt" integer DEFAULT 0,
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp),
  PRIMARY KEY ("user_id", "facility_id")
);

CREATE TABLE "transaction" (
  "id" serial PRIMARY KEY,
  "buyer_id" integer DEFAULT null,
  "facility_id" integer DEFAULT null,
  "seller_id" integer DEFAULT null,
  "type" smallint NOT NULL,
  "amount" integer,
  "transaction_time" timestamp DEFAULT (current_timestamp),
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "report" (
  "id" serial PRIMARY KEY,
  "author_id" integer DEFAULT null,
  "type" smallint NOT NULL,
  "content" text DEFAULT '',
  "review_id" integer DEFAULT null,
  "status" smallint DEFAULT 0,
  "action" varchar(20) DEFAULT '',
  "admin_id" integer DEFAULT null,
  "respond_date" timestamp DEFAULT null,
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "pending_kaist_user" (
  "id" SERIAL PRIMARY KEY,
  "account_id" varchar(20) UNIQUE NOT NULL,
  "user_type" smallint NOT NULL,
  "password" varchar(72) NOT NULL,
  "email" varchar(255) NOT NULL,
  "auth_code" varchar(72) not null,
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "user_refresh_token" (
  "user_id" integer PRIMARY KEY,
  "refresh_token" text not null,
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE TABLE "summary" (
  "facility_id" integer primary key,
  "summary" text default '',
  "created_at" timestamp DEFAULT (current_timestamp),
  "updated_at" timestamp DEFAULT (current_timestamp)
);

CREATE INDEX ON "pending_kaist_user" ("account_id");

CREATE INDEX ON "user" ("account_id");

CREATE UNIQUE INDEX ON "opening_hours" ("facility_id", "day");

CREATE INDEX ON "post" ("author_id", "facility_id");

CREATE INDEX ON "review" ("author_id", "facility_id");

CREATE INDEX ON "transaction" ("buyer_id", "facility_id");

COMMENT ON COLUMN "user"."user_type" IS '0:admin, 1:KAIST, 2:facility';

COMMENT ON TABLE "preference" IS 'Food & diet type - user preference & facility attriburtes';

COMMENT ON COLUMN "preference"."type" IS '0:Cuisine type, 1:Diet type, etc.';

COMMENT ON COLUMN "facility"."type" IS 'One-word general category of facility';

COMMENT ON COLUMN "facility"."business_id" IS 'Business registration number';

COMMENT ON COLUMN "facility"."url" IS 'website or SNS url';

COMMENT ON COLUMN "facility"."description" IS 'Short description text';

COMMENT ON COLUMN "address"."post_number" IS 'post number';

COMMENT ON COLUMN "address"."road_address" IS 'Korean, road address';

COMMENT ON COLUMN "address"."jibun_address" IS 'Korean, jibun/legacy address';

COMMENT ON COLUMN "address"."english_address" IS 'English, road address';

COMMENT ON COLUMN "address"."lat" IS 'Latitude';

COMMENT ON COLUMN "address"."lng" IS 'Longitude';

COMMENT ON COLUMN "opening_hours"."day" IS '0:sun ~ 6:sat';

COMMENT ON COLUMN "menu"."description" IS 'Short description about the dish';

COMMENT ON COLUMN "menu"."price" IS 'price in KRW';

COMMENT ON COLUMN "menu"."quantity" IS 'serving quantity (g or ml)';

COMMENT ON TABLE "manages" IS 'facility_user-facility relationship';

COMMENT ON TABLE "favorite" IS 'Favorites (Bookmarks)';

COMMENT ON COLUMN "facility_registration_request"."status" IS '0:pending, 1:approved, 2:rejected';

COMMENT ON COLUMN "facility_registration_request"."title" IS 'facility name';

COMMENT ON COLUMN "facility_registration_request"."content" IS 'all records to be inserted. This should be able to be viewed by admin.';

COMMENT ON COLUMN "facility_registration_request"."respond_date" IS 'time checked by admin';

COMMENT ON TABLE "post" IS 'Facility post / notice';

COMMENT ON COLUMN "post"."img_uri" IS 'supports up to 1 image attachment';

COMMENT ON COLUMN "review"."score" IS '0 ~ 5 int score';

COMMENT ON COLUMN "review"."img_uri" IS 'supports up to 1 image attachment';

COMMENT ON COLUMN "review"."likes" IS 'number of likes';

COMMENT ON TABLE "stamp_ruleset" IS 'A stamp ruleset is - stamp program settings for a facility';

COMMENT ON COLUMN "stamp_ruleset"."total_cnt" IS 'total number of stamps collectable';

COMMENT ON TABLE "stamp_reward" IS 'A reward contained in a stamp program';

COMMENT ON COLUMN "stamp_reward"."name" IS 'ex) A free drink';

COMMENT ON TABLE "stampbook" IS 'A stamp book is - list of stamps for a facility, owned by one user';

COMMENT ON COLUMN "stampbook"."cnt" IS 'current stamp count';

COMMENT ON TABLE "transaction" IS 'give / redeem stamps';

COMMENT ON COLUMN "transaction"."seller_id" IS 'seller - the facility manager';

COMMENT ON COLUMN "transaction"."type" IS '0: redeem (-n), 1: give (+n)';

COMMENT ON COLUMN "transaction"."amount" IS 'how many stamps were traded. In case of redeem, its (total_cnt)';

COMMENT ON TABLE "report" IS 'Bug report & Review report (harmful content)';

COMMENT ON COLUMN "report"."type" IS '0: bug report, 1: content report';

COMMENT ON COLUMN "report"."review_id" IS 'only for review reports';

COMMENT ON COLUMN "report"."status" IS '0: pending, 1: accepted';

COMMENT ON COLUMN "report"."action" IS 'action taken upon handling the report (ex) delete, no action, fix, etc.';

COMMENT ON COLUMN "report"."admin_id" IS 'admin id if the report was handled / checked';

COMMENT ON COLUMN "report"."respond_date" IS 'when the admin handled / checked the report';

ALTER TABLE "user_preference" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "user_preference" ADD FOREIGN KEY ("preference_id") REFERENCES "preference" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "address" ADD FOREIGN KEY ("facility_id") REFERENCES "facility" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "opening_hours" ADD FOREIGN KEY ("facility_id") REFERENCES "facility" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "menu" ADD FOREIGN KEY ("facility_id") REFERENCES "facility" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "facility_preference" ADD FOREIGN KEY ("facility_id") REFERENCES "facility" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "facility_preference" ADD FOREIGN KEY ("preference_id") REFERENCES "preference" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "manages" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "manages" ADD FOREIGN KEY ("facility_id") REFERENCES "facility" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "favorite" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "favorite" ADD FOREIGN KEY ("facility_id") REFERENCES "facility" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "facility_registration_request" ADD FOREIGN KEY ("author_id") REFERENCES "user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "post" ADD FOREIGN KEY ("author_id") REFERENCES "user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "post" ADD FOREIGN KEY ("facility_id") REFERENCES "facility" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "review" ADD FOREIGN KEY ("author_id") REFERENCES "user" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "review" ADD FOREIGN KEY ("facility_id") REFERENCES "facility" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "review_hashtag" ADD FOREIGN KEY ("review_id") REFERENCES "review" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "review_hashtag" ADD FOREIGN KEY ("hashtag_id") REFERENCES "hashtag" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "stamp_ruleset" ADD FOREIGN KEY ("facility_id") REFERENCES "facility" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "stamp_reward" ADD FOREIGN KEY ("facility_id") REFERENCES "stamp_ruleset" ("facility_id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "stampbook" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "stampbook" ADD FOREIGN KEY ("facility_id") REFERENCES "facility" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "transaction" ADD FOREIGN KEY ("buyer_id") REFERENCES "user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "transaction" ADD FOREIGN KEY ("seller_id") REFERENCES "user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "transaction" ADD FOREIGN KEY ("facility_id") REFERENCES "facility" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "report" ADD FOREIGN KEY ("author_id") REFERENCES "user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "report" ADD FOREIGN KEY ("review_id") REFERENCES "review" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "report" ADD FOREIGN KEY ("admin_id") REFERENCES "user" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "user_refresh_token" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "summary" ADD FOREIGN KEY ("facility_id") REFERENCES "facility" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- TRIGGER : auto update 'updated_at' columns

CREATE OR REPLACE FUNCTION public.trigger_set_timestamp()
  RETURNS trigger
  LANGUAGE plpgsql
AS $function$
  BEGIN
  NEW.updated_at=now();
  RETURN NEW;
  END;
$function$
;

CREATE TRIGGER set_timestamp BEFORE UPDATE ON "preference" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "opening_hours" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "menu" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "facility_preference" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "user" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "facility" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "address" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "manages" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "favorite" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "review" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "review_hashtag" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "hashtag" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "stamp_ruleset" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "stampbook" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "user_preference" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "facility_registration_request" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "post" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "stamp_reward" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "transaction" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "report" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "pending_kaist_user" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "user_refresh_token" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();
CREATE TRIGGER set_timestamp BEFORE UPDATE ON "summary" FOR EACH row EXECUTE PROCEDURE trigger_set_timestamp();

-- TRIGGER : auto update slug w/ slugify function

CREATE EXTENSION IF NOT EXISTS unaccent;

CREATE or replace FUNCTION public.slugify(
  v TEXT
) RETURNS TEXT
  LANGUAGE plpgsql
  STRICT IMMUTABLE AS
$function$
BEGIN
  -- 1. trim trailing and leading whitespaces from text
  -- 2. remove accents (diacritic signs) from a given text
  -- 3. lowercase unaccented text
  -- 4. replace non-alphanumeric (excluding hyphen, underscore) with a hyphen
  -- 5. trim leading and trailing hyphens
  RETURN trim(BOTH '-' FROM regexp_replace(lower(public.unaccent(trim(v))), '[^a-z0-9\\-_]+', '-', 'gi'));
END;
$function$;

CREATE or replace FUNCTION public.set_slug_from_name() 
	RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.slug := slugify(NEW.name);
  RETURN NEW;
END
$$;

CREATE TRIGGER set_slug_insert BEFORE INSERT ON "preference" 
	FOR EACH ROW 
	WHEN (NEW.name IS NOT NULL AND NEW.slug IS NULL)
	EXECUTE PROCEDURE set_slug_from_name();
	
CREATE TRIGGER set_slug_update BEFORE UPDATE ON "preference" 
	FOR EACH ROW 
	WHEN (NEW.name IS NOT NULL)
	EXECUTE PROCEDURE set_slug_from_name();
	
CREATE TRIGGER set_slug_insert BEFORE INSERT ON "facility" 
	FOR EACH ROW 
	WHEN (NEW.name IS NOT NULL AND NEW.slug IS NULL)
	EXECUTE PROCEDURE set_slug_from_name();
	
CREATE TRIGGER set_slug_update BEFORE UPDATE ON "facility" 
	FOR EACH ROW 
	WHEN (NEW.name IS NOT NULL)
	EXECUTE PROCEDURE set_slug_from_name();
	
CREATE TRIGGER set_slug_insert BEFORE INSERT ON "menu" 
	FOR EACH ROW 
	WHEN (NEW.name IS NOT NULL AND NEW.slug IS NULL)
	EXECUTE PROCEDURE set_slug_from_name();
	
CREATE TRIGGER set_slug_update BEFORE UPDATE ON "menu" 
	FOR EACH ROW 
	WHEN (NEW.name IS NOT NULL)
	EXECUTE PROCEDURE set_slug_from_name();
	
CREATE TRIGGER set_slug_insert BEFORE INSERT ON "hashtag" 
	FOR EACH ROW 
	WHEN (NEW.name IS NOT NULL AND NEW.slug IS NULL)
	EXECUTE PROCEDURE set_slug_from_name();
	
CREATE TRIGGER set_slug_update BEFORE UPDATE ON "hashtag" 
	FOR EACH ROW 
	WHEN (NEW.name IS NOT NULL)
	EXECUTE PROCEDURE set_slug_from_name();

-- FUNCTION : get avg score
create or replace function avg_review_score(fid integer)
returns float8 
language plpgsql as
$$
begin 
	return (select avg(r.score)
		from review r
		where r.facility_id = fid
		group by r.facility_id
	);
end
$$;


-- VIEWS
     
CREATE OR REPLACE VIEW stamp_ruleset_rewards AS
SELECT srs.facility_id,
	srs.logo_img_uri,
	srs.total_cnt,
	json_strip_nulls(json_agg(srw)) rewards
	from stamp_ruleset srs 
	left join stamp_reward srw on srs.facility_id = srw.facility_id
	group by srs.facility_id;

create or replace view review_with_hashtag as
	select r.*, 
		array_remove(array_agg(rh.hashtag_id), null) hashtag_ids,
		json_strip_nulls(json_agg(h)) hashtags
	from review r
	left join review_hashtag rh on r.id = rh.review_id
	left join hashtag h on rh.hashtag_id = h.id
	group by r.id;


CREATE OR REPLACE VIEW public.facility_detailed
AS SELECT f.id,
    f.name,
    f.english_name,
    f.slug,
    f.type,
    f.business_id,
    f.profile_img_uri,
    f.phone,
    f.email,
    f.url,
    f.description,
    f.created_at,
    f.updated_at,
    avg_review_score(f.id) AS avg_score,
    a.post_number,
    a.country,
    a.city,
    a.road_address,
    a.english_address,
    array_remove(array_agg(DISTINCT p.id), NULL::integer) AS preference_ids,
    json_strip_nulls(json_agg(DISTINCT p.*)) AS preferences,
    json_strip_nulls(json_agg(DISTINCT oh.*)) AS opening_hours,
    json_strip_nulls(json_agg(DISTINCT m.*)) AS menus
   FROM facility f
     LEFT JOIN address a ON f.id = a.facility_id
     LEFT JOIN facility_preference fp ON f.id = fp.facility_id
     LEFT JOIN preference p ON fp.preference_id = p.id
     LEFT JOIN opening_hours oh ON f.id = oh.facility_id
     LEFT JOIN menu m ON f.id = m.facility_id
  GROUP BY f.id, a.facility_id;
  
CREATE OR REPLACE VIEW public.facility_pin
AS SELECT f.id,
    f.name,
    f.english_name,
    f.slug,
    f.profile_img_uri,
    f.description,
    a.lat,
    a.lng,
    a.road_address,
    a.english_address,
    avg_review_score(f.id) AS avg_score,
    json_strip_nulls(json_agg(DISTINCT oh.*)) AS opening_hours,
    array_remove(array_agg(DISTINCT p.id), NULL::integer) AS preference_ids,
    json_strip_nulls(json_agg(DISTINCT p.*)) AS preferences
   FROM facility f
     LEFT JOIN address a ON f.id = a.facility_id
     LEFT JOIN opening_hours oh ON f.id = oh.facility_id
     LEFT JOIN facility_preference fp ON f.id = fp.facility_id
     LEFT JOIN preference p ON fp.preference_id = p.id
  GROUP BY f.id, a.facility_id;
  
create or replace view report_with_review
as select 
	rp.*,
	to_json(rv.*) review
	from report rp
	left join review rv on rp.review_id = rv.id;
