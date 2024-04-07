postgres:
	docker run --name postgresDocker -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it postgresDocker createdb --username=root --owner=root goBank

dropdb:
	docker exec -it postgresDocker dropdb goBank

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/goBank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/goBank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres dropdb dropdb migrateup migratedown sqlc