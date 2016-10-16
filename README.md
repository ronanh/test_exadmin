# TestExadmin

Simple test for creating with `ExAdmin` a `User` that belongs to a `Role`

To run that project, first check the db hostname in `config/dev.exs` which is set to `db` instead of the default `localhost`

The project itself only implements a basic json api for `/api/users` and `/api/roles`

Phoenix traces when creating a `User` that belongs to a `Role`:

```
[info] POST /admin/users
[debug] Processing by ExAdmin.AdminResourceController.create/2
  Parameters: %{"_csrf_token" => "HgpGMBNqN2Yibm5oK3Z4HykzDQdEJgAAHG+RP3cUHZ6/c/4TmPAssg==", "commit" => "Create User", "resource" => "users", "user" => %{"email" => "foo@gmail.com", "role_id" => "1"}, "utf8" => "✓"}
  Pipelines: [:browser]
[debug] QUERY OK db=0.1ms
begin []
[debug] QUERY OK db=0.6ms
INSERT INTO "users" ("email","inserted_at","updated_at") VALUES ($1,$2,$3) RETURNING "id" ["foo@gmail.com", {{2016, 10, 16}, {7, 4, 2, 0}}, {{2016, 10, 16}, {7, 4, 2, 0}}]
[debug] QUERY OK db=0.7ms
commit []
[debug] QUERY OK source="users" db=0.8ms
SELECT u0."id", u0."email", u0."role_id", u0."inserted_at", u0."updated_at" FROM "users" AS u0 WHERE (u0."id" = $1) [2]
[info] Sent 302 in 3ms
[info] GET /admin/users/2
[debug] Processing by ExAdmin.AdminResourceController.show/2
  Parameters: %{"id" => "2", "resource" => "users"}
  Pipelines: [:browser]
[debug] QUERY OK source="users" db=0.6ms queue=0.1ms
SELECT u0."id", u0."email", u0."role_id", u0."inserted_at", u0."updated_at" FROM "users" AS u0 WHERE (u0."id" = $1) [2]
[info] Sent 200 in 3ms
```
