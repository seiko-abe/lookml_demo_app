view:product_master {
  sql_table_name: "PUBLIC"."製品マスタ" ;;
  drill_fields: [product_id]

  dimension: product_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."製品ID" ;;
  }
  dimension:product_name  {
    type: string
    sql: ${TABLE}."製品名" ;;
  }
  dimension: category_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."カテゴリID" ;;
  }
  measure: count {
    type: count
    drill_fields: [product_id, category_id, .count]
  }
}
