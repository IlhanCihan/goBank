package db

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/lib/pq"
)

const (
	dbDriver = "postgres"
	dbSource = "postgresql://root:secret@localhost:5432/simplebank?sslmode=disable"
)

var testQueries *Queries

func TestMain(m *testing.M) {
	config, err := sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("cannot load config:", err)
	}

	testQueries = New(config)

	os.Exit(m.Run())
}
