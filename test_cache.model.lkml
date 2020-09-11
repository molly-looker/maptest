connection: "faa_redshift"

include: "*.view.lkml"


#persist_for: "0 seconds"
datagroup: dwc_datagroup {
  sql_trigger: SELECT CURRENT_DATE ;;
  max_cache_age: "24 hours"
}

persist_with: dwc_datagroup

explore: airports {
  view_label: "Accidents_Cache"
  hidden: yes


  }
