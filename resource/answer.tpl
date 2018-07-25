{{define "answer.list"}}
    select
        *
    from
        questions_answers
    where
        question_id=:question_id
    order by
        created_at
    {{if .limit}}
        limit :limit
    {{end}}
    {{if .offset}}
        offset :offset
    {{end}}
{{end}}


{{define "answer.count"}}
    select
        count(*) as count
    from
        questions_answers
    where
        question_id=:question_id
{{end}}

{{define "answer.user.count"}}
    select
        count(*) as count
    from
        questions_answers
    where
        user_id=:user_id
    and
        brand_id=:brand_id
{{end}}

{{define "answer.user.list"}}
    select
        *
    from
        questions_answers
    where
        user_id=:user_id
    and
        brand_id=:brand_id
    order by
        created_at
    {{if .limit}}
        limit :limit
    {{end}}
    {{if .offset}}
        offset :offset
    {{end}}
{{end}}


{{define "answer.add"}}
    insert into
        questions_answers (
            user_id,
            {{if .avatar}}
                avatar,
            {{end}}
            {{if .nickname}}
                nickname,
            {{end}}
            question_id,
            {{if .parent_id}}
            parent_id,
            {{end}}
            {{if .images}}
            images,
            {{end}}
            content,
            created_at
            )
    values
        (
            :user_id,
            {{if .avatar}}
                :avatar,
            {{end}}
            {{if .nickname}}
            :nickname,
            {{end}}
            :question_id,
            {{if .parent_id}}
            :parent_id,
            {{end}}
            {{if .images}}
            :images,
            {{end}}
            :content,
            :created_at
        )
{{end}}


{{define "answer.update"}}
    update
        questions_answers
    set
        {{if .user_id}}
            user_id=:user_id
        {{end}}
    where
        id=:id
{{end}}

{{define "answer.random.nickname.avatar"}}
    select
        user_id,nickname,avatar
    from
        questions_answers
    where
        nickname!=''
    and
        avatar like '%/user/%'
    order by rand()
    limit 1
{{end}}