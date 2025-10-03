schema "sample" {
  charset = "utf8mb4"
  collate = "utf8mb4_0900_ai_ci"
}

table "users" {
  schema = schema.sample
  column "id" {
    null = false
    type = int
    auto_increment = true
  }
  column "name" {
    type = varchar(255)
    null = false
  }
  column "email" {
    type = varchar(255)
    null = false
  }
  primary_key {
    columns = [column.id]
  }
  index "email" {
    columns = [column.email]
    unique = true
  }
}

table "user_logs" {
  schema = schema.sample
  column "id" {
    type = int
  }
  column "user_id" {
    type = int
    null = false
  }
  column "body" {
    type = text
    null = false
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "user_fk" {
    columns = [column.user_id]
    ref_columns = [table.users.column.id]
  }
}

table "test" {
  schema = schema.sample
  column "id" {
    null = false
    type = int
  }
  column "name" {
    type = varchar(255)
    null = true
  }
}

table "test2" {
  schema = schema.sample
  column "id" {
    null = false
    type = int
  }
  column "name" {
    type = varchar(255)
    null = true
  }
}
