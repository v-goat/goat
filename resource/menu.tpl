{{define "menu.list"}}
select
    *
from
    menus
order by
    sort,id
{{end}}