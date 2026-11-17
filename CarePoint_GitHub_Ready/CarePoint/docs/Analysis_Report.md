# CarePoint Healthcare Workforce Analytics

Completed analysis • October 2025–September 2026 • Synthetic portfolio project

## Decision summary

Across five fictional care homes, additional staffing expenditure totalled **£233,751**, comprising **£156,549 overtime (67.0%)** and **£77,202 agency cover (33.0%)**. Oakfield House recorded the highest cost (£51,716.10), while Brookside Care had the highest average monthly vacancy count (2.08). These are different workforce pressures and warrant different investigations.

December 2025 had the highest cost (£22,797.40), and May 2026 the lowest (£16,735.15). The home-month vacancy/cost correlation was **−0.054**, indicating no clear linear association in this sample. It does not establish that vacancies never affect costs.

## Scope and questions

The original source contains 240 rows: 5 homes × 4 departments × 12 months. Each row represents one department in one home in one month. Questions cover home rankings, overtime versus agency spending, monthly changes, vacancy counts, vacancy/cost association, and priorities for management. Supporting exploration covers departments, sickness and occupancy.

## Verified home comparison

| Care home | Overtime | Agency | Additional cost | Average monthly vacancy count |
|---|---:|---:|---:|---:|
| Oakfield House | £35,645.10 | £16,071.00 | £51,716.10 | 1.25 |
| Riverside Lodge | £33,203.40 | £14,039.00 | £47,242.40 | 1.83 |
| Brookside Care | £32,367.75 | £14,590.00 | £46,957.75 | 2.08 |
| Meadow View | £28,337.70 | £17,593.00 | £45,930.70 | 1.25 |
| Willow Gardens | £26,995.05 | £14,909.00 | £41,904.05 | 0.92 |

Oakfield contributes 22.1% of group extra cost. Meadow View has the highest agency spending (£17,593), despite Oakfield having the highest overall cost. Absolute totals do not establish inefficiency: staffing size, skill mix and occupancy differ.

## Monthly trend

| Month | Additional staffing cost |
|---|---:|
| 2025-10 | £18,496.40 |
| 2025-11 | £17,471.35 |
| 2025-12 | £22,797.40 |
| 2026-01 | £20,704.85 |
| 2026-02 | £21,556.20 |
| 2026-03 | £19,397.40 |
| 2026-04 | £18,497.90 |
| 2026-05 | £16,735.15 |
| 2026-06 | £18,546.55 |
| 2026-07 | £20,015.15 |
| 2026-08 | £20,439.90 |
| 2026-09 | £19,092.75 |

December costs rose 30.5% from November. Spending fell to May, rose through August, then fell in September. With only one year of synthetic data, recurring seasonality cannot be established.

## Supporting findings

- Nursing recorded £78,091.50 additional costs, the highest department total, including 1,634 overtime hours. Hourly pay and skill mix need review before interpreting its higher expenditure.
- Care recorded £64,104.60, Domestic £46,084.40 and Activities £45,470.50.
- Sickness totalled 807 department-recorded days. January and September were joint highest at 90 days; June was lowest at 45. December had the most overtime hours (664), so sickness peaks and overtime peaks did not coincide consistently.
- Weighted occupancy was **87.9%**, calculated from 60 unique home-month bed observations. Bed counts repeat across departments and were counted once per home/month.

## Vacancy and cost relationship

The main scatter chart uses 60 home-month observations: departments are summed within each home/month before plotting vacancy count against additional cost. Pearson r = −0.054, a very weak negative linear association. At the original 240 department-month grain, r = +0.176, a weak positive association. The difference illustrates why the unit of analysis must be stated.

Neither result proves causality or absence of a relationship. Repeated observations within homes, integer vacancy counts, department rates and unmeasured factors limit interpretation. Five annual home totals are too few points for a robust relationship claim.

## Management actions

| Priority | Proposed owner | Action | Evidence / follow-up |
|---|---|---|---|
| 1 | Oakfield manager + finance | Review overtime by department, rota and shift | Highest cost; compare authorised cover, rates and occupied bed-days |
| 2 | Brookside manager + recruitment | Check vacancy duration, turnover and recruitment progress | Highest average vacancy count; obtain role-level vacancy history |
| 3 | Meadow View manager | Review agency bookings and skill mix | Highest agency cost; compare hours, rates and alternatives |
| 4 | Workforce lead | Review December and May rostering differences | Highest and lowest spend; inspect leave, sickness and demand |
| 5 | Reporting lead | Agree definitions and add another year of data | Separate vacancy counts, FTE gaps and persistent posts; test repeat patterns |

These are investigation recommendations. No real-world savings or service improvements have been measured. Cost per occupied bed-day and vacancy rates should be developed only after confirming denominator definitions and appropriate staffing budgets.

## Validation and limitations

Validation found 240 unique Month/Care_Home/Department keys, no blank source fields, 12 consecutive months, four departments per home/month, and no row-level overtime-plus-agency cost discrepancies beyond £0.01. Bed values agree across each set of four department rows. Workbook totals reconcile to SQL and independent calculations. Source values were retained.

Vacancies is a synthetic integer count and does not necessarily equal budgeted minus actual FTE. The sum of 88 is a total of repeated monthly observations, **not 88 distinct unfilled jobs**. The group monthly average is 7.33. Complaint counts were not treated as distinct incidents because their attribution is unspecified.

This is a fictional organisation and is not NHS operational evidence.

## Deliverables and status

- Completed Excel workbook: formula-driven dashboard, three source-linked charts, monthly detail, home-month calculations, original data and definitions/checks. Summaries use SUMIF/SUMIFS rather than native PivotTables.
- Tested SQL analysis and populated SQLite database; original CSV and 60-row home-month CSV.
- Native two-page Power BI Project (PBIP), with embedded data and 15 measures. David opened both pages in Desktop and confirmed the care-home slicer changes the results. The repository contains a PBIP project, not a PBIX binary.
- Teaching plan and interview preparation below/alongside this report.

The Excel workbook was recalculated, checked for formula errors and visually inspected. A source-edit test confirmed dependent totals update. Native Excel/Google Sheets behaviour was not tested in those applications. Subsequently, David opened both Power BI pages in Desktop; visible KPIs matched the expected figures and he confirmed a care-home selection changed the results. Comprehensive slicer/interaction testing and PBIX export remain outstanding.

## Portfolio wording

CarePoint is a synthetic healthcare workforce analytics project exploring vacancies, overtime and agency costs across five care homes. I practised PivotTables and charts in earlier spreadsheet exercises. The completed analysis was developed with AI assistance and includes a formula-driven dashboard, verified SQL outputs and recommendations for management investigation. The project identified Oakfield as the highest-cost home and Brookside as having the highest average vacancy count. A native Power BI project is included; its first Desktop load and a care-home filter interaction have been checked.

The completed workbook, SQL pack and native Power BI definitions were developed with AI assistance. Earlier PivotTable and chart exercises were performed by David, who also opened and checked the Power BI report in Desktop.

## Reproducibility

Source SHA-256: `386fee5f6df6c661e45d37a235766fd2046dfd2c25bab4992d28c03ed590534f`.

Open `../sql/CarePoint.sqlite` with a SQLite client and run the supplied SQL script. For phpMyAdmin, import the original CSV into a table called workforce, setting the first three columns to text and remaining columns to numeric types. The SELECT statements use MySQL 8-compatible syntax; CTE queries require a compatible server version.
