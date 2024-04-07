--name: CreateEntry :one
INSERT INTO entries (
    account_id,
    amount,
    currency,
    transfer_id
) VALUES (
    $1,$2,$3,$4
) RETURNING *;

-- name: GetEntry :one
SELECT * FROM entries
WHERE id = $1 LIMIT 1;