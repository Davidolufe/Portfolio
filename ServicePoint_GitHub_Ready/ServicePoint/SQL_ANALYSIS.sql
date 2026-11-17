-- Read-only queries. Percentages are 0–100, not fractions.
-- NULL scores and waits are excluded by AVG.

-- 1. Data quality and coverage
SELECT COUNT(*) AS case_count, COUNT(DISTINCT Case_ID) AS unique_cases, MIN(Opened_Date) AS first_date, MAX(Opened_Date) AS last_date, SUM(CASE WHEN CSAT_Score IS NULL THEN 1 ELSE 0 END) AS missing_csat, SUM(CASE WHEN Channel = 'Email' AND Initial_Wait_Minutes IS NOT NULL THEN 1 ELSE 0 END) AS unexpected_email_waits FROM servicepoint_cases;

-- 2. Overall service measures
SELECT COUNT(*) AS cases, ROUND(100.0*AVG(CASE WHEN Resolved_On_First_Contact='Yes' AND Repeat_Contacts_7_Days=0 THEN 1.0 ELSE 0.0 END),1) AS confirmed_fcr_pct, ROUND(100.0*AVG(CASE WHEN Repeat_Contacts_7_Days>0 THEN 1.0 ELSE 0.0 END),1) AS repeat_case_pct, ROUND(100.0*AVG(CASE WHEN Complaint='Yes' THEN 1.0 ELSE 0.0 END),1) AS complaint_pct, ROUND(AVG(Resolution_Hours),2) AS avg_resolution_hours, ROUND(AVG(CSAT_Score),2) AS avg_csat, COUNT(CSAT_Score) AS survey_responses, ROUND(100.0*COUNT(CSAT_Score)/COUNT(*),1) AS response_pct, ROUND(AVG(Initial_Wait_Minutes),2) AS avg_live_wait_minutes FROM servicepoint_cases;

-- 3. Contact reason comparison
SELECT Contact_Reason, COUNT(*) AS cases, ROUND(100.0*AVG(CASE WHEN Resolved_On_First_Contact='Yes' AND Repeat_Contacts_7_Days=0 THEN 1.0 ELSE 0.0 END),1) AS confirmed_fcr_pct, ROUND(100.0*AVG(CASE WHEN Repeat_Contacts_7_Days>0 THEN 1.0 ELSE 0.0 END),1) AS repeat_case_pct, ROUND(100.0*AVG(CASE WHEN Complaint='Yes' THEN 1.0 ELSE 0.0 END),1) AS complaint_pct, ROUND(AVG(Resolution_Hours),2) AS avg_resolution_hours, ROUND(AVG(CSAT_Score),2) AS avg_csat, COUNT(CSAT_Score) AS survey_responses FROM servicepoint_cases GROUP BY Contact_Reason ORDER BY cases DESC;

-- 4. Monthly performance
SELECT Month, COUNT(*) AS cases, ROUND(100.0*AVG(CASE WHEN Resolved_On_First_Contact='Yes' AND Repeat_Contacts_7_Days=0 THEN 1.0 ELSE 0.0 END),1) AS confirmed_fcr_pct, ROUND(100.0*AVG(CASE WHEN Repeat_Contacts_7_Days>0 THEN 1.0 ELSE 0.0 END),1) AS repeat_case_pct, ROUND(AVG(Resolution_Hours),2) AS avg_resolution_hours, ROUND(AVG(Initial_Wait_Minutes),2) AS avg_live_wait_minutes FROM servicepoint_cases GROUP BY Month ORDER BY Month;

-- 5. Channel comparison
SELECT Channel, COUNT(*) AS cases, ROUND(AVG(Resolution_Hours),2) AS avg_resolution_hours, ROUND(AVG(Initial_Wait_Minutes),2) AS avg_live_wait_minutes, COUNT(CSAT_Score) AS survey_responses, ROUND(AVG(CSAT_Score),2) AS avg_csat FROM servicepoint_cases GROUP BY Channel ORDER BY cases DESC;

-- 6. Repeat cases versus repeat interactions
SELECT Contact_Reason, SUM(CASE WHEN Repeat_Contacts_7_Days>0 THEN 1 ELSE 0 END) AS repeat_cases, SUM(Repeat_Contacts_7_Days) AS total_repeat_contacts FROM servicepoint_cases GROUP BY Contact_Reason ORDER BY repeat_cases DESC;

-- 7. Initial resolution later followed by repeat contact
SELECT Case_ID, Opened_Date, Contact_Reason, Repeat_Contacts_7_Days FROM servicepoint_cases WHERE Resolved_On_First_Contact='Yes' AND Repeat_Contacts_7_Days>0 ORDER BY Repeat_Contacts_7_Days DESC, Case_ID LIMIT 20;

-- 8. Example filtered slice: May phone cases
SELECT COUNT(*) AS cases, ROUND(100.0*AVG(CASE WHEN Resolved_On_First_Contact='Yes' AND Repeat_Contacts_7_Days=0 THEN 1.0 ELSE 0.0 END),1) AS confirmed_fcr_pct, ROUND(AVG(CSAT_Score),2) AS avg_csat FROM servicepoint_cases WHERE Month='2026-05' AND Channel='Phone';
