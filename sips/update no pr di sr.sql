UPDATE sr_item
SET id_item_pr = sub.id_item_pr
FROM (
    SELECT
        sr.id,
        pr.id AS id_item_pr
    FROM sr_item sr
    LEFT JOIN pr_item pr
        ON sr.no_pr = pr.no_pr
        AND sr.item_of = pr.item_of
    WHERE sr.id_item_pr IS NULL
      AND sr.no_pr IS NOT NULL and pr.id is not null
) sub
WHERE sr_item.id = sub.id;