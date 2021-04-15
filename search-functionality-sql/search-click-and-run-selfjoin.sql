select a.user_id, a.event_name, a.occurred_at, b.user_id, b.event_name, b.occurred_at, (b.occurred_at-a.occurred_at) as difference from tutorial.yammer_events a
join tutorial.yammer_events b ON
b.user_id = a.user_id and b.event_name = 'search_run'
where a.event_name =  'search_click_result_1'  