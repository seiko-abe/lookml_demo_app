view: category_master {
  sql_table_name: "PUBLIC"."カテゴリーマスター" ;;
  drill_fields: [category_id]

  dimension: category_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."カテゴリID" ;;
  }
  dimension:product_category  {
    type: string
    sql: ${TABLE}."製品カテゴリ" ;;
  }

  measure: count {
    type: count
    drill_fields: [category_id]
  }
}
