{{define "tag.list"}}
    select
        t.*
    from
        tags as t
    left join
        questions_to_tags as qtt
    on
        qtt.tag_id=t.id
    where
        qtt.question_id=:question_id
{{end}}

{{define "tag.info"}}
    select
        *
    from
        tags
    where
        true
    {{if .id}}
        and id=:id
    {{end}}
    {{if .url}}
        and url=:url
    {{end}}
{{end}}
{{define "tag.list.url"}}
    select
        *
    from
        tags
    where
        url != ''
{{end}}