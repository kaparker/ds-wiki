SELECT count(user_id) FROM tutorial.yammer_users;

select count(distinct user_id), count(user_id) from tutorial.yammer_events
where event_name like 'search%';

select user_id, count(user_id) from tutorial.yammer_events
where event_name like 'search%'
group by user_id
having count(user_id)>5;


-- like search%
--19066 total users, 4465 use search, 23%
-- 40611 total search events
-- 2196 users have used it more than 5 times

-- ('search_autocomplete','search_run') only
-- 4465 users, 30839 total search events
-- 2009 users have used it more than 5 times

-- range of search data: 3 months