view: google_trends {
  sql_table_name: `mpv-bq.911_data.google_trends`
    ;;

  dimension: double_field_1 {
    type: number
    sql: ${TABLE}.double_field_1 ;;
  }

  dimension: string_field_0 {
    type: string
    sql: ${TABLE}.string_field_0 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
