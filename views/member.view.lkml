view: member {
  sql_table_name: "PUBLIC"."会員情報" ;;
  drill_fields: [customer_id]

  dimension: customer_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."顧客ID" ;;
  }
  dimension:sex  {
    type: string
    sql: ${TABLE}."性別" ;;
  }
  dimension:birthday {
    type: string
    sql: ${TABLE}."誕生日" ;;
  }
  dimension:customer_city  {
    type: string
    sql: ${TABLE}."顧客市区町村" ;;
  }
  dimension:customer_prefecture  {
    type: string
    sql: ${TABLE}."顧客都道府県" ;;
  }
  dimension:member_registration_date {
    type: string
    sql: ${TABLE}."会員登録日" ;;
  }
  dimension:member_total  {
    type: number
    sql: ${TABLE}."会員数" ;;
  }
  measure: count {
    type: count
    drill_fields: [customer_id, public_.count, public_.count, public_.count, public_.count]
  }
}
