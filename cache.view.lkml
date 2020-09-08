view: cache {
  # You can specify the table name if it's different from the view name:
  derived_table: {
    sql: SELECT cast('molly.lippsett@looker.com' as varchar) as investigation_type from  public.airports ;;

  }


#   # Define your dimensions and measures here, like this:
  dimension: type {

    type: string
    sql: ${TABLE}.investigation_type;;
  }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
}
