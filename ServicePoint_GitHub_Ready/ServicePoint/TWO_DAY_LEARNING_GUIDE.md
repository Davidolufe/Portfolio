# Two-day learning guide

Use four short sessions each day, with breaks. The finished files are references; recreate small pieces so you can explain them yourself.

## Day 1: data and spreadsheet analysis
1. **15 minutes: understand the case.** Read README and the dictionary. Say what a row represents and why a case is not necessarily a single call.
2. **20 minutes: inspect the workbook.** Open Cases. Check 720 unique IDs, date coverage and the missing email waits. Find a case marked initially resolved that later has repeat contact. Explain why it does not count as confirmed FCR.
3. **25 minutes: recreate a pivot.** In a working copy, select Cases A3:P723. In Excel use Insert > PivotTable; in Google Sheets use Insert > Pivot table. Put Contact_Reason in Rows and COUNTA of Case_ID in Values. Compare with Analysis A16:B21. Billing should have 215 cases; technical faults 204.
4. **20 minutes: recreate rates.** Add average of Confirmed_FCR_Flag to the pivot and format as a percentage. Billing should be 33.5%. Explain the difference between averaging a 0/1 flag and counting Yes values. Read MANAGEMENT_REPORT and identify one finding and one hypothesis.

### Day 1 checks
- Overall confirmed FCR: 49.7%; repeat case rate: 26.8%.
- CSAT: 3.91/5 from 556 responses. Missing scores must not become zero.
- What extra data would be needed to prove why August waits rose?

## Day 2: SQL, dashboard and interview explanation
1. **20 minutes: run SQL.** Use a practice database. Import SQL_SETUP.sql, then run queries 1–3 from SQL_ANALYSIS.sql. Compare with SQL_RESULTS.json and the workbook.
2. **20 minutes: explain the queries.** Identify SELECT, FROM, GROUP BY, CASE WHEN and AVG. Explain why SQL AVG ignores NULL. Change the reason summary to order by resolution hours.
3. **20 minutes: test the dashboard.** Open OPEN_DASHBOARD.html. Select May and Phone, then Billing. Explain which counts changed. Reset, export cases, and check the row count matches the selected case count. Read the full-data findings label.
4. **20 minutes: practise your story.** Read the process maps. Give a two-minute explanation of the problem, measures, findings, proposed action and limitations. Adapt PORTFOLIO_WRITEUP in your own words. Build a Power BI version later with POWER_BI_GUIDE if you want native Power BI practice.

## Interview prompts
1. Why did you choose confirmed FCR rather than initial resolution alone?
2. How did you treat missing data?
3. Why are billing and technical faults priorities?
4. How would you test whether your recommendations worked?
5. Which parts did AI help create, and which calculations can you reproduce yourself?

## Suggested answer structure
“I used a synthetic customer-service dataset to practise analysing repeat contact and resolution. I checked definitions and missing values, compared issues using counts and rates, and reviewed a dashboard and SQL analysis. Billing and technical faults were priorities in this dataset. I proposed a pilot; I did not measure a real business improvement.” Adjust this only to reflect the work you have actually completed.
