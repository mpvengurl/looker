connection: "mpv-som"

# include all the views
include: "/views/**/*.view"

datagroup: mpv-test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: mpv-test_default_datagroup

explore: service_calls {}

explore: connection_reg_r3 {}
