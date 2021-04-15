select 
        case when difference between '00:00:00' and '00:00:30' then '1 - 0-30s'
        when difference between '00:00:31' and '00:01:00' then '2- 30-1min'
        when difference between '00:01:01' and '00:02:00' then '3- 1-2min'
        when difference between '00:02:01' and '00:05:00' then '4- 2-5min'
        when difference between '00:05:01' and '00:10:00' then '5- 5-10min'
        when difference between '00:10:01' and '00:30:00' then '6- 10-30min'
        when difference between '00:30:01' and '01:00:00' then '7- 30min-1hr'
        when difference between '01:00:01' and '1 day' then '8- 1hr-1day'
        else '9- more than 1day'
        END as group_difference,
        count(*)
FROM (
select user_id, event_name, occurred_at, 
RANK() OVER (PARTITION BY user_id
                    ORDER BY occurred_at),
 occurred_at -LAG(occurred_at, 1) OVER
         (PARTITION BY user_id ORDER BY occurred_at)
         AS difference
from tutorial.yammer_events
where event_name like 'search%') a
group by 1
order by group_difference
