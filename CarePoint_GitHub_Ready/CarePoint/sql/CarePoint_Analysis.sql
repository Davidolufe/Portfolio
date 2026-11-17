-- CarePoint: synthetic workforce portfolio project
-- Tested on the supplied SQLite database. SELECT statements also use standard
-- SQL supported by MySQL/phpMyAdmin (import the CSV into a table named workforce).
-- Grain: Month, Care_Home, Department. Monetary values are GBP.

-- 1. Validate coverage and uniqueness.
SELECT COUNT(*) AS record_count, COUNT(DISTINCT Month) AS months,
       COUNT(DISTINCT Care_Home) AS homes,
       COUNT(DISTINCT Department) AS departments
FROM workforce;
SELECT Month, Care_Home, Department, COUNT(*) AS duplicate_count
FROM workforce GROUP BY Month, Care_Home, Department HAVING COUNT(*) > 1;

-- 2. Reconcile all cost records. Expected: zero exceptions.
SELECT Month, Care_Home, Department
FROM workforce
WHERE ABS(Total_Extra_Staff_Cost_GBP - Overtime_Cost_GBP - Agency_Cost_GBP) > 0.01;

-- 3. Rank homes by additional staffing expenditure.
SELECT Care_Home, ROUND(SUM(Overtime_Cost_GBP),2) AS overtime_gbp,
       ROUND(SUM(Agency_Cost_GBP),2) AS agency_gbp,
       ROUND(SUM(Total_Extra_Staff_Cost_GBP),2) AS extra_cost_gbp,
       ROUND(SUM(Vacancies)*1.0/COUNT(DISTINCT Month),2) AS avg_monthly_vacancies
FROM workforce GROUP BY Care_Home ORDER BY extra_cost_gbp DESC;

-- 4. Monthly trend; YYYY-MM strings sort chronologically.
SELECT Month, ROUND(SUM(Overtime_Cost_GBP),2) AS overtime_gbp,
       ROUND(SUM(Agency_Cost_GBP),2) AS agency_gbp,
       ROUND(SUM(Total_Extra_Staff_Cost_GBP),2) AS extra_cost_gbp,
       SUM(Vacancies) AS vacancy_count
FROM workforce GROUP BY Month ORDER BY Month;

-- 5. Aggregate first for the scatter chart: 60 points, one per home/month.
SELECT Month, Care_Home, SUM(Vacancies) AS vacancy_count,
       ROUND(SUM(Total_Extra_Staff_Cost_GBP),2) AS extra_cost_gbp
FROM workforce GROUP BY Month, Care_Home ORDER BY Month, Care_Home;

-- 6. Check bed consistency before deduplicating. Expected: zero exceptions.
SELECT Month, Care_Home FROM workforce GROUP BY Month, Care_Home
HAVING MIN(Available_Beds) <> MAX(Available_Beds)
    OR MIN(Occupied_Beds) <> MAX(Occupied_Beds);

-- 7. Weighted occupancy: bed values repeat across departments.
SELECT ROUND(100.0*SUM(occupied)/SUM(available),2) AS occupancy_pct
FROM (SELECT Month, Care_Home, MAX(Occupied_Beds) AS occupied,
             MAX(Available_Beds) AS available
      FROM workforce GROUP BY Month, Care_Home) AS home_month;

-- 8. Monthly highest-cost homes, retaining ties.
WITH costs AS (
 SELECT Month,Care_Home,SUM(Total_Extra_Staff_Cost_GBP) AS cost
 FROM workforce GROUP BY Month,Care_Home
)
SELECT c.Month,c.Care_Home,ROUND(c.cost,2) AS extra_cost_gbp
FROM costs c WHERE c.cost=(SELECT MAX(c2.cost) FROM costs c2 WHERE c2.Month=c.Month)
ORDER BY c.Month;

-- 9. Distinguish vacancy counts from FTE gaps; do not overwrite either measure.
SELECT Care_Home, ROUND(SUM(Budgeted_Staff_FTE-Actual_Staff_FTE)/12.0,2) AS avg_monthly_net_gap_fte,
       ROUND(SUM(Vacancies)/12.0,2) AS avg_monthly_source_vacancy_count
FROM workforce GROUP BY Care_Home ORDER BY Care_Home;

-- 10. Department cost and sickness comparison.
SELECT Department, SUM(Sickness_Days) AS sickness_days,
       SUM(Overtime_Hours) AS overtime_hours,
       ROUND(SUM(Total_Extra_Staff_Cost_GBP),2) AS extra_cost_gbp
FROM workforce GROUP BY Department ORDER BY extra_cost_gbp DESC;

-- 11. Sickness and overtime through time (descriptive, not causal).
SELECT Month, SUM(Sickness_Days) AS sickness_days,
       SUM(Overtime_Hours) AS overtime_hours
FROM workforce GROUP BY Month ORDER BY Month;

-- 12. Pearson components at home-month grain.
-- r = numerator / SQRT(x_component * y_component).
-- Component output avoids relying on an optional SQLite SQRT extension.
WITH points AS (
 SELECT Month,Care_Home,SUM(Vacancies) AS x,SUM(Total_Extra_Staff_Cost_GBP) AS y
 FROM workforce GROUP BY Month,Care_Home
)
SELECT COUNT(*)*SUM(x*y)-SUM(x)*SUM(y) AS numerator,
       COUNT(*)*SUM(x*x)-SUM(x)*SUM(x) AS x_component,
       COUNT(*)*SUM(y*y)-SUM(y)*SUM(y) AS y_component
FROM points;
