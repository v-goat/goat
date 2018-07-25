{{define "category.list"}}
    select
        id,name,pinyin
    from
        categories
    where
        {{if .brand_id}}
            brand_id=:brand_id
        {{end}}
{{end}}


{{define "category.info"}}
    select
        *
    from
        categories
    where
        true
    {{if .brand_id}}
        and brand_id=:brand_id
    {{end}}
    {{if .id}}
       and id=:id
    {{end}}
    {{if .pinyin}}
      and pinyin=:pinyin
    {{end}}
    limit 1
{{end}}


{{define "category.update.fixed"}}
    update
        categories
    set
        fixed_count=fixed_count+1
    where
        id=:id
{{end}}