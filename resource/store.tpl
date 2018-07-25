{{define "store.count"}}
    select
        count(*) as count
    from
        stores as s
    left join
        stores_to_brands as stb
    on
        s.id=stb.store_id
    where
        stb.brand_id=:brand_id
    {{if .province_id}}
        and s.province_id = :province_id
    {{end}}
    {{if .city}}
        and (s.city like :city or s.province like :city  or s.district like :city)
    {{end}}
    {{if .q}}
        and (s.name like :q or s.address like :q or s.phone like :q)
    {{end}}
{{end}}


{{define "store.list"}}
    select
        s.id,s.name,s.thumbnail,s.province,s.city,s.address,s.road,s.phone,s.office_hours_start_at,s.office_hours_end_at,s.days_off_week,s.type,s.lat,s.lng
    from
        stores as s
    left join
        stores_to_brands as stb
    on
        s.id=stb.store_id
    where
        stb.brand_id=:brand_id
    {{if .province_id}}
        and s.province_id = :province_id
    {{end}}
    {{if .city_id}}
    and s.city_id = :city_id
    {{end}}
    {{if .city}}
        and (s.city like :city or s.province like :city or s.district like :city)
    {{end}}
    {{if .q}}
        and (s.name like :q or s.address like :q or s.phone like :q)
    {{end}}
        order by s.`index` desc
    {{if .limit}}
        limit :limit
    {{end}}
    {{if .offset}}
        offset :offset
    {{end}}
{{end}}

{{define "store.info"}}
    select
        id,name,province,city,address,road,phone,office_hours_start_at,office_hours_end_at,days_off_week,thumbnail,type,item,lat,lng,position
    from
        stores as s
    left join
        stores_to_brands as stb
    on
        s.id=stb.store_id
    where
        stb.brand_id=:brand_id
    and
        s.id=:id
limit 1
{{end}}

{{define "store.favorite"}}
    select
        s.id,s.name,s.province,s.city,s.address,s.road,s.phone,s.office_hours_start_at,s.office_hours_end_at,s.days_off_week,s.type
    from
        stores as s
    left join
        stores_to_brands as stb
    on
        s.id=stb.store_id
    left join
        stores_favorites as sf
    on
        s.id=sf.store_id
    where
        stb.brand_id=:brand_id
    and
        sf.user_id=:user_id
    order by
        `index` desc,s.id
{{end}}

{{define "store.favorite.add"}}
    insert into
        stores_favorites(store_id,user_id)
    values(:store_id,:user_id)
{{end}}


{{define "store.favorite.remove"}}
    delete from
        stores_favorites
    where
        store_id = :store_id
    and
        user_id = :user_id
{{end}}


{{define "store.is.favorite"}}
    select
        count(*) as count
    from
        stores_favorites
    where
        user_id=:user_id
    and
        store_id=:store_id
    limit 1
{{end}}


{{define "stores.add"}}
    insert into
        stores(name,type,office_hours_start_at,office_hours_end_at,days_off_week,province,province_id,city_id,city,address,phone,item,lng,lat,position,thumbnail,images)
    values(:name,:type,:office_hours_start_at,:office_hours_end_at,:days_off_week,:province,:province_id,:city_id,:city,:address,:phone,:item,:lng,:lat,:position,:thumbnail,:images)
    returning id
{{end}}

{{define "store.update.list"}}
    select
        id,name,province,city,address,province_id,city_id
    from
        stores
    where
        name=:name
    and
        city=:city
    limit 1
{{end}}

{{define "store.update"}}
    update
        stores
    set
    {{if .lng}}
        lng=:lng
    {{end}}
    {{if .lat}}
        ,lat=:lat
    {{end}}
    {{if .city_id}}
        ,city_id=:city_id
    {{end}}
    {{if .province_id}}
        ,province_id=:province_id
    {{end}}
    {{if .images}}
        ,images=:images
    {{end}}
    {{if .thumbnail}}
        ,thumbnail=:thumbnail
    {{end}}
    {{if .thumbnail}}
        ,thumbnail=:thumbnail
    {{end}}
    where
        id=:id
{{end}}


{{define "store.region"}}
    select
        r.name,r.pinyin
    from
        stores as s
    left join
        stores_to_brands as stb
    on
        s.id=stb.store_id
    left join
        regions as r
    on
        r.id=s.city_id
    where
        stb.brand_id=:brand_id
    group by
        r.pinyin,r.name
{{end}}


{{define "store.hot"}}
    select
        city,pinyin
    from
        hot_cities
    where
        brand_id=:brand_id
    order by
        sort
{{end}}