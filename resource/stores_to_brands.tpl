{{define "store.brand.add"}}
    insert into
        stores_to_brands
            (store_id, brand_id)
        value
            (:store_id, :brand_id)
    return store_id
{{end}}