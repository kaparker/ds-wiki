select user_id, 
count(case when event_name = 'search_run' then 1
else 0 end) as search_run,
count(case when event_name = 'search_click_result_1' then 1
else 0 end) as search_click_result_1
from tutorial.yammer_events a
where user_id in (
select a.user_id from tutorial.yammer_events a
where a.event_name =  'search_click_result_1' )
group by user_id
order by search_run