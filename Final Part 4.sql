use mydb;

select gym_id, name from gym;

update gym
set name = 'Planet Fitness'
where gym_id = '2';

delete from gym
where name = 'Planet Fitness';

select * from gym_has_membership;

update gym_has_membership
set membership_id = '3'
where gym_id = 2;

delete from gym_has_membership
where gym_id = 2;

select * from instructor;

update instructor
set fname = 'Jaren'
where instructor_id = 4;

delete from instructor
where instructor_id = 3;

select * from members;

update members
set fname = 'Bobby'
where members_id = 3;

select membership_id, type, duration from membership;

update membership
set duration = 6
where membership_id = 3;

delete from membership
where membership_id = 2;

select * from workout_plans;

update workout_plans
set workout_type = 'shoulders'
where workout_plans_id = '3';





