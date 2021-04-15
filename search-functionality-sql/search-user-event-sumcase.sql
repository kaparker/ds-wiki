
select user_id, 
sum(case when event_name = 'search_run' then 1 else 0 end) as search_run,
sum(case when event_name = 'search_autocomplete' then 1 else 0 end) as search_autocomplete,
sum(case when event_name = 'search_click_result_1' then 1 else 0 end) as search_click_result_1,
sum(case when event_name = 'search_click_result_2' then 1 else 0 end) as search_click_result_2,
sum(case when event_name = 'search_click_result_3' then 1 else 0 end) as search_click_result_3,
sum(case when event_name = 'search_click_result_4' then 1 else 0 end) as search_click_result_4,
sum(case when event_name = 'search_click_result_5' then 1 else 0 end) as search_click_result_5,
sum(case when event_name = 'search_click_result_6' then 1 else 0 end) as search_click_result_6,
sum(case when event_name = 'search_click_result_7' then 1 else 0 end) as search_click_result_7,
sum(case when event_name = 'search_click_result_8' then 1 else 0 end) as search_click_result_8,
sum(case when event_name like 'search_click_result_%' then 1 else 0 end) as search_click_result_X,
sum(case when event_name like 'search%' then 1 else 0 end) as search_total
from tutorial.yammer_events a
where event_name like 'search%'
group by user_id
order by user_id

