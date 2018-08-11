view: events {
  derived_table:  {
    sql: (select 10 as lat, 20 as long
  union
  select 20 as lat, 30 as long
  union
  select 40 as lat, 0 as long
  union
  select 80 as lat, -110 as long
  union
  select 90 as lat, -12 as long)

  ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: home_location {
    type: location
    sql_latitude: ${TABLE}.lat ;;
    sql_longitude: ${TABLE}.long ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }



  dimension: type_id {
    type: number
    sql: ${TABLE}.type_id ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.first_name, users.last_name, users.id]
  }

}
