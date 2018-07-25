{{define "regions.info"}}
    select
        *
    from
        regions
    where
        true
    {{if .id}}
        and id=:id
    {{end}}
    {{if .city}}
        and fullname like :city
    {{end}}
    {{if .pinyin}}
        and pinyin =:pinyin
    {{end}}
    {{if .level}}
        and level=:level
    {{end}}
    limit 1
{{end}}


{{define "regions.list"}}
    select
        *
    from
        regions
    where
        true
    {{if .level}}
        and level<=:level
    {{end}}
    order by
        level,id
{{end}}


{{define "regions.children"}}
    select
        pinyin,name,fullname
    from
        regions
    where
        pid=:pid
{{end}}