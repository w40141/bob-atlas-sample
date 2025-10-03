package main

import (
	"context"
	"fmt"
	"log"
	"log/slog"
	"os"

	"github.com/aarondl/opt/omit"
	_ "github.com/go-sql-driver/mysql"
	"github.com/stephenafamo/bob"
)

func main() {
	logger := slog.New(slog.NewJSONHandler(os.Stdout, nil))
	slog.SetDefault(logger)

	dns := "user:password@tcp(localhost:13306)/sample"

	db, err := bob.Open("mysql", dns)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	ctx := context.Background()

	userTable := models.Users

	users, err := userTable.View.Query().All(ctx, db)
	if err != nil {
		log.Fatal(err)
	}

	if len(users) == 0 {
		slog.Info("no users found")

		u := models.UserSetter{
			Name:  omit.From("Alice"),
			Email: omit.From("alice@example.com"),
		}

		_, e := userTable.Insert(&u).Exec(ctx, db)
		if e != nil {
			log.Fatal(e)
		}
	}

	for _, user := range users {
		fmt.Printf("ID: %d, Name: %s, Email: %s", user.ID, user.Name, user.Email)
	}
}
