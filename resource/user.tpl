{{define "user.list"}}
    select
        *
    from
        users
    where
        true
        {{ if .id}}
            and id = :id
        {{end}}
        {{ if .limit}}
            limit :limit
        {{end}}
        {{ if .offset}}
            offset :offset
        {{end}}
{{end}}

{{define "user.add"}}
    insert into
        users
    (
        created_at,
        updated_at
        {{if .mobile}}
            ,mobile
        {{end}}
        {{if .password}}
            ,password
        {{end}}
        {{if .nickname}}
            ,nickname
        {{end}}
        {{if .avatar}}
            ,avatar
        {{end}}
        {{if .union_id}}
        ,union_id
        {{end}}
    )
    values(
        :created_at,
        :updated_at
        {{if .mobile}}
            ,:mobile
        {{end}}
        {{if .password}}
            ,:password
        {{end}}
        {{if .nickname}}
            ,:nickname
        {{end}}
        {{if .avatar}}
            ,:avatar
        {{end}}
        {{if .union_id}}
        ,:union_id
        {{end}}
    )
{{end}}

{{define "user.update"}}
    update
        users
    set
        updated_at=:updated_at
        {{if .password}}
            ,password=:password
        {{end}}
        {{if .avatar}}
            ,avatar=:avatar
        {{end}}
    where
        true
        {{if .id}}
            and id=:id
        {{end}}
        {{if .mobile}}
            and mobile=:mobile
        {{end}}
{{end}}

{{define "user.count"}}
    select
        count(*) as count
    from
        users
    where
        true
    {{if .mobile}}
        and mobile=:mobile
    {{end}}
{{end}}

{{define "user.info"}}
    select
        *
    from
        users
    where
        true
        {{ if .id}}
            and id =:id
        {{end}}
        {{ if .mobile}}
            and mobile =:mobile
        {{end}}
        {{ if .union_id}}
            and union_id =:union_id
        {{end}}
    limit 1
{{end}}


{{define "sms.log"}}
    insert into
        sms_logs (mobile,code,client_ip,template_code,params,created_at)
    values
        (:mobile,:code,:ip,:template_code,:params,:created_at)
{{end}}

{{define "sms.last.params.code"}}
    select
        params->>'$.code' as code,created_at
    from
        sms_logs
    where
        mobile = :mobile
    and
        template_code = :template_code
    order by
        created_at desc
    limit 1
{{end}}

{{define "sms.ip.limit.count"}}
    select
        count(*) as count
    from
        sms_logs
    where
        client_ip=:ip
    and
        code = 'OK'
    and
        created_at > :created_at
{{end}}

{{define "user.random.id"}}
    select
        id
    from
        users
    order by rand()
    limit 1
{{end}}

