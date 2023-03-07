# The name of this view in Looker is "311 Service Requests"
view: sf_311_service_requests {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sf_311.311_service_requests`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Agency Name" in Explore.

  dimension: agency_name {
    type: string
    description: "The agency responsible for fulfilling or otherwise addressing the service request."
    sql: ${TABLE}.agency_name ;;
  }

  dimension: category {
    type: string
    description: "The Human readable name of the specific service request type (service_name)"
    sql: ${TABLE}.category ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: closed {
    type: time
    description: "The date and time when the service request was closed"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.closed_date ;;
  }

  dimension: complaint_type {
    type: string
    description: "More specific description of the problem related to the Category"
    sql: ${TABLE}.complaint_type ;;
  }

  dimension_group: created {
    type: time
    description: "The date and time when the service request was made"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_date ;;
  }

  dimension: descriptor {
    type: string
    description: "More specific description of the problem related to the Request Type"
    sql: ${TABLE}.descriptor ;;
  }

  dimension: incident_address {
    type: string
    description: "Human readable address or description of location"
    sql: ${TABLE}.incident_address ;;
  }

  dimension: latitude {
    type: number
    description: "Latitude using the (WGS84) projection."
    sql: ${TABLE}.latitude ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_latitude {
    type: sum
    sql: ${latitude} ;;
  }

  measure: average_latitude {
    type: average
    sql: ${latitude} ;;
  }

  dimension: location {
    type: string
    description: "Latitude and longitude using the (WGS84) projection."
    sql: ${TABLE}.location ;;
  }

  dimension: longitude {
    type: number
    description: "Longitude using the (WGS84) projection."
    sql: ${TABLE}.longitude ;;
  }

  dimension: media_url {
    type: string
    description: "Website URL"
    sql: ${TABLE}.media_url ;;
  }

  dimension: neighborhood {
    type: string
    sql: ${TABLE}.neighborhood ;;
  }

  dimension: police_district {
    type: string
    sql: ${TABLE}.police_district ;;
  }

  dimension_group: resolution_action_updated {
    type: time
    description: "The date and time when the service request was last modified. For requests with status=closed, this will be the date the request was closed"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.resolution_action_updated_date ;;
  }

  dimension: source {
    type: string
    description: "How the service request was made"
    sql: ${TABLE}.source ;;
  }

  dimension: status {
    type: string
    description: "The current status of the service request."
    sql: ${TABLE}.status ;;
  }

  dimension: status_notes {
    type: string
    description: "Explanation of why status was changed to current state or more details on current status than conveyed with status alone"
    sql: ${TABLE}.status_notes ;;
  }

  dimension: supervisor_district {
    type: number
    sql: ${TABLE}.supervisor_district ;;
  }

  dimension: unique_key {
    type: number
    description: "Unique case id"
    sql: ${TABLE}.unique_key ;;
  }

  measure: count {
    type: count
    drill_fields: [agency_name]
  }
}
