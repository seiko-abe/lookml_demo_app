view: budget_master {
  sql_table_name: "PUBLIC"."予算データ_ビュー" ;;
  drill_fields: [store_id]

  dimension: store_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."店舗ID" ;;
  }
  dimension:budget_year {
    type: string
    sql: ${TABLE}."予算年月" ;;
  }
  dimension:budget_amount  {
    type: number
    sql: ${TABLE}."予算額" ;;
  }
  measure: count {
    type: count
    drill_fields: [store_id]
  }
}
