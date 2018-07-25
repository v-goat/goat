{{define "review.list"}}
    select
        *
    from
        stores_reviews
    where
        true
        {{if .store_id}}
            and store_id=:store_id
        {{end}}
    order by
        created_at desc
    {{if .limit}}
        limit :limit
    {{end}}
    {{if .offset}}
        offset :offset
    {{end}}
{{end}}


{{define "review.count"}}
    select
        count(*) as count
    from
        stores_reviews
    where
        true
    {{if .store_id}}
        and store_id=:store_id
    {{end}}
{{end}}

{{define "review.add"}}
    insert into
        stores_reviews(
        user_id,
        {{if .images}}
        images,
        {{end}}
        star,
        content,
        created_at,
        store_id)
    values
        (
        :user_id,
        {{if .images}}
        :images,
        {{end}}
        :star,
        :content,
        :created_at,
        :store_id
    )
{{end}}


{{define "review.list.by.category"}}
    select
        sr.*, s.name
    from
        stores_reviews as sr
    left join
        stores as s
    on
        sr.store_id=s.id
    where
        category_id=:category_id
    and
        sr.images != ''
    order by
        created_at desc
    {{if .limit}}
            limit :limit
    {{end}}
    {{if .offset}}
        offset :offset
    {{end}}
{{end}}