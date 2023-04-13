SET check_function_bodies = false;
CREATE SCHEMA IF NOT EXISTS tiger;
CREATE SCHEMA IF NOT EXISTS tiger_data;
CREATE SCHEMA IF NOT EXISTS topology;
COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';
CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;
COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';
CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;
COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';
CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;
COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';
CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;
COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';
CREATE TABLE public."user" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    gender text NOT NULL
);
CREATE TABLE public.user_tracking (
    user_id uuid NOT NULL,
    location public.geometry NOT NULL,
    id uuid DEFAULT public.gen_random_uuid() NOT NULL
);
ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.user_tracking
    ADD CONSTRAINT user_tracking_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.user_tracking
    ADD CONSTRAINT user_tracking_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;
