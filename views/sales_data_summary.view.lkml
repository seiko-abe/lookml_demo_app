view: sales_data_summary {
  derived_table: {
    sql:
      SELECT
        sales_data."店舗ID" AS shop_id,
        DATE_TRUNC('MONTH', DATE(sales_data."売上日", 'YYYY/MM/DD')) AS "売上日",
        SUM(sales_data."売上") AS "売上"
      FROM
        "PUBLIC"."売上データ" AS sales_data
      GROUP BY
        shop_id, "売上日"
    ;;
  }

  dimension: sales_day_2019 {
    type: date
    sql: ${TABLE}."売上日" ;;
  }

  dimension: sales_day_2020 {
    type: date
    sql: DATE_ADD(${TABLE}."売上日", 1, 'YEAR') ;;
  }

  measure: sales_amount_2019 {
    type: sum
    sql: ${TABLE}."売上" ;;
  }

  measure: sales_amount_2020 {
    type: sum
    sql: ${TABLE}."売上" ;;
  }
}