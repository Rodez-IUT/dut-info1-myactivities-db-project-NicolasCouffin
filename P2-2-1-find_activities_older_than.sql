CREATE OR REPLACE FUNCTION find_activities_older_than(old_date date) RETURNS SETOF activity AS $$
    SELECT *
    FROM activity
    WHERE modification_date < old_date;
$$ LANGUAGE SQL;