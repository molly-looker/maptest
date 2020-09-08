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


  #sql_always_where:  ${end_of_day_postd_tm_ky} >= 20170101  ;;
  sql_always_where:

 {% if _user_attributes['brandua'] == 'exception' %}
  1=1
  {% else %}
  EXISTS (SELECT 1 FROM public.accidents  AS accidents
  WHERE  ((accidents.investigation_type) = '{{ _user_attributes['state_test'] }}'))
  {% endif %} ;;



  }
