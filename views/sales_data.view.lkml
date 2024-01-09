view: sales_data {
  sql_table_name: "PUBLIC"."売上データ" ;;
  drill_fields: [store_id]

  dimension: store_id {
    # primary_key: yes
    type: number
    sql: ${TABLE}."店舗ID" ;;
  }

  dimension: sales_date {
    type: date
    sql: DATE_TRUNC('month', TO_DATE(${TABLE}."売上日", 'YYYY/MM/DD')) ;;
    label: "Sales Month"
    }

  measure: sales_amount {
    type: sum
    label: "売上金額"
    sql: abs(${TABLE}."売上");;
  }

  # measure: sales_amount_2019 {
  #   type: sum
  #   label: "2019年売上金額"
  #   sql: CASE WHEN DATE_TRUNC('year', TO_DATE(${TABLE}."売上日",'YYYY/MM/DD')) = '2019-01-01'
  #       THEN abs(${TABLE}."売上")
  #       ELSE NULL
  #       END ;;
  # }

  # measure: sales_amount_2020 {
  #   type: sum
  #   label: "2020年売上金額"
  #   sql: CASE WHEN DATE_TRUNC('year', TO_DATE(${TABLE}."売上日",'YYYY/MM/DD')) = '2020-01-01'
  #       THEN abs(${TABLE}."売上")
  #       ELSE NULL
  #       END ;;
  # }

  # measure: sales_amount_2019 {
  #   type: sum
  #   label: "2019年売上金額"
  #   sql: CASE WHEN EXTRACT(YEAR FROM ${TABLE}."売上日") = 2019
  #       THEN abs(${TABLE}."売上")
  #       ELSE NULL
  #       END ;;
  # }

  # measure: sales_amount_2020 {
  #   type: sum
  #   label: "2020年売上金額"
  #   sql: CASE WHEN EXTRACT(YEAR FROM ${TABLE}."売上日") = 2020
  #       THEN abs(${TABLE}."売上")
  #       ELSE NULL
  #       END ;;
  # }

  dimension:cost_price  {
    type: string
    sql: ${TABLE}."原価" ;;
  }
  dimension:gross_profit  {
    type: string
    sql: ${TABLE}."荒利" ;;
  }
  dimension:quantity  {
    type: number
    sql: ${TABLE}."数量" ;;
  }
  dimension:slip_number  {
    type: string
    sql: ${TABLE}."伝票番号" ;;
  }
  dimension:earnings  {
    # primary_key: yes
    type: number
    sql: ${TABLE}."売上" ;;
  }
  # dimension: earnings_total {
  #   type: number
  #   sql: ${TABLE}."売上" ;;
  # }
  # dimension: earnings_yearly {
  #   type: number
  #   sql: ${TABLE}."年" ;;
  #   # sql: "year" ;;  # フィールドのエイリアスを指定
  #   # filters: [timeframe: "this year"] ;;# フィルタリング条件を指定
  # }

  dimension:product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."製品ID" ;;
  }
  dimension: customer_id {
    primary_key: yes
    type: number
    # hidden: yes
    sql: CONCAT(${TABLE}."顧客ID") ;;
  }
  dimension: order_date_key {
    # primary_key: yes
    type: number
    sql: CONCAT(${TABLE}."受注日付KEY");;
  }

  measure: count {
    type: count
    drill_fields: [store_id, product_id, customer_id, .count]
  }
}
