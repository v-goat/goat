{{define "brand.info"}}
select
    b.*,d.icp_number,d.header_script,d.footer_script
from
    brands as b
left join
    domains as d
on
    b.id=d.brand_id
where
    true
{{ if .id}}
    and id =:id
{{end}}
{{ if .name}}
    and name =:name
{{end}}
{{ if .key}}
    and key =:key
{{end}}
{{ if .domain}}
    and domain =:domain
{{end}}
    limit 1
{{end}}

{{define "brand.update"}}
    update
        brands
    set
        {{if .wx_customer_services_qr_code}}
            wx_customer_services_qr_code = :wx_customer_services_qr_code
        {{end}}
    where
        id=:brand_id
{{end}}