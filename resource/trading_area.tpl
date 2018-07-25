{{define "trading.area.list"}}
    select
        *
    from
        trading_areas
    where
        true
    {{if .city_id}}
        and city_id=:city_id
    {{end}}
{{end}}

{{define "trading.area.info"}}
    select
        *
    from
        trading_areas
    where
        true
    {{if .pinyin}}
        and pinyin=:pinyin
    {{end}}
    {{if .id}}
        and id=:id
    {{end}}
    limit 1
{{end}}