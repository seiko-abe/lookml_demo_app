view:store_master {
  sql_table_name: "PUBLIC"."店舗マスタ" ;;
  drill_fields: [store_id]

  dimension: store_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."店舗ID" ;;
  }
  dimension:grocery_department_area  {
    type: number
    sql: ${TABLE}."食料雑貨部門面積" ;;
  }
  dimension:store_manager  {
    type: string
    sql: ${TABLE}."店舗マネージャー" ;;
  }
  dimension:flower_shop{
    type: number
    sql: ${TABLE}."花屋" ;;
  }
  dimension:store_zip_code  {
    type: number
    sql: ${TABLE}."郵便番号（店舗）" ;;
  }
  dimension:latitude  {
    type: number
    sql: ${TABLE}."緯度" ;;
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}."経度" ;;
  }
  dimension:side_dish  {
    type: number
    sql: ${TABLE}."惣菜" ;;
  }
  dimension:video_store  {
    type: number
    sql: ${TABLE}."ビデオストア" ;;
  }
  dimension:store_area  {
    type: string
    sql: ${TABLE}."店舗エリア" ;;
  }
  dimension:salad_bar  {
    type: number
    sql: ${TABLE}."サラダバー" ;;
  }
  dimension:store_name  {
    type: string
    sql: ${TABLE}."店舗名" ;;
  }
  dimension:store_town_address  {
    type: string
    sql: ${TABLE}."町村番地（店舗）" ;;
  }
  dimension:meat_department_area {
    type: number
    sql: ${TABLE}."肉部門面積" ;;
  }
  dimension:store_phone_number  {
    type: string
    sql: ${TABLE}."電話番号（店舗）" ;;
  }
  dimension:open_date {
    type: string
    sql: ${TABLE}."開店日" ;;
  }
  dimension:store_prefecture  {
    type: string
    sql: ${TABLE}."店舗都道府県" ;;
  }
  dimension:store_classification {
    type: string
    sql: ${TABLE}."店舗区分" ;;
  }
  dimension:store_city  {
    type: string
    sql: ${TABLE}."店舗市区町村" ;;
  }
  dimension:store_number  {
    type: number
    sql: ${TABLE}."店舗番号" ;;
  }
  dimension:frozen_food_department_area {
    type: number
    sql: ${TABLE}."冷凍食品部門面積" ;;
  }
  dimension:coffee_bar  {
    type: number
    sql: ${TABLE}."コーヒーバー" ;;
  }
  dimension:store_space  {
    type: number
    sql: ${TABLE}."店舗面積" ;;
  }
  dimension:last_renovation_date {
    type: string
    sql: ${TABLE}."最終改装日" ;;
  }
  dimension:store_fax_number {
    type: string
    sql: ${TABLE}."FAX番号（店舗）" ;;
  }
  dimension: region_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."地域ID" ;;
  }
  measure: count {
    type: count
    drill_fields: [store_id, region_id, .count]
  }
}
