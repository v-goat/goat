{{define "question.list"}}
    select
        *
    from
        questions
    where
        brand_id=:brand_id
    {{if .user_id}}
     and user_id =:user_id
    {{end}}
    and
        deleted_at is null
    order by
        created_at desc
    {{if .limit}}
        limit :limit
    {{end}}

    {{if .offset}}
        offset :offset
    {{end}}
{{end}}

{{define "question.count"}}
    select
        count(*) as count
    from
        questions
    where
        brand_id=:brand_id
        {{if .user_id}}
            and user_id=:user_id
        {{end}}
    and
        deleted_at is null
{{end}}

{{define "question.list.random"}}
    select
        *
    from
        questions
    where
        brand_id=:brand_id
    and
        deleted_at is null
    and
        images !=''
    and
        content !=''
    order by
        created_at desc
    limit 4
{{end}}

{{define "question.list.by.tag"}}
    select
        q.*
    from
        questions as q
    right join
        questions_to_tags as qtt
    on
        q.id=qtt.question_id
    where
        brand_id=:brand_id
    and
        qtt.tag_id=:tag_id
    and
        deleted_at is null
    order by
        created_at desc
    {{if .limit}}
        limit :limit
    {{end}}
    {{if .offset}}
        offset :offset
    {{end}}
{{end}}

{{define "question.count.by.tag"}}
    select
        count(*) as count
    from
        questions as q
    right join
        questions_to_tags as qtt
    on
        q.id=qtt.question_id
    where
        brand_id=:brand_id
    and
        qtt.tag_id=:tag_id
    and
        deleted_at is null
{{end}}

{{define "question.info"}}
    select
        *
    from
        questions
    where
        brand_id=:brand_id
    and
        id =:id
    and
        deleted_at is null
    limit 1
{{end}}


{{define "question.update"}}
    update
        questions
    set
        updated_at = now()
        {{if .user_id}}
            ,user_id=:user_id
        {{end}}
    where
        id=:id
{{end}}


{{define "question.ids"}}
    select
        id
    from
        questions
    where
        brand_id=:brand_id
    and
        status = 1
    and
        deleted_at is null
    order by
        created_at desc
{{end}}


{{define "question.relate"}}
    select
        *
    from
        questions
    where
        brand_id=:brand_id
    {{if .q}}
        and title like :q
    {{end}}
    and
        deleted_at is null
    order by
        created_at desc
    limit 5

{{end}}