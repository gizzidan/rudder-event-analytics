with cte_sessions as (
    select * from {{ref('rs_stg_sessions')}}
)
select {{ var('main_id') }}, {{to_date('session_start_time')}} as reporting_date, 
count(*) as n_sessions,
sum(session_length) as total_session_length,
avg(session_length) as avg_session_length from cte_sessions group by 1,2
