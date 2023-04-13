alter table "public"."user"
  add constraint "user_gender_fkey"
  foreign key ("gender")
  references "public"."gender"
  ("id") on update cascade on delete cascade;
