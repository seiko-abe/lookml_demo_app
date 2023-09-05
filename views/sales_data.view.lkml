view: sales_data {
  sql_table_name: "PUBLIC"."売上データ" ;;
  drill_fields: [store_id]

  dimension: store_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."店舗ID" ;;
  }
  dimension:sales_date  {
    type: string
    sql: ${TABLE}."売上日" ;;
  }
  dimension:cost_price  {
    type: string
    sql: ${TABLE}."原価" ;;
  }
  dimension:gross_profit  {
    type: string
    sql: ${TABLE}."荒利" ;;
  }
  dimension:quantity  {
    type: string
    sql: ${TABLE}."数量" ;;
  }
  dimension:slip_number  {
    type: string
    sql: ${TABLE}."伝票番号" ;;
  }
  dimension:earnings  {
    type: string
    sql: ${TABLE}."売上" ;;
  }
  dimension:product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."製品ID" ;;
  }
  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."顧客ID" ;;
  }
  dimension: order_date_key {
    type: number
    sql: ${TABLE}."受注日付KEY" ;;
  }
  measure: count {
    type: count
    drill_fields: [store_id, product_id, customer_id, .count, .count]
  }
}