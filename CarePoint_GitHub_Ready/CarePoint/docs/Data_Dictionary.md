# CarePoint data dictionary

Source: `../data/workforce.csv`. Grain: **Month × Care_Home × Department**. All data is synthetic.

| Field | Meaning / unit | Aggregation note |
|---|---|---|
| Month | Reporting month, YYYY-MM | 12 monthly snapshots |
| Care_Home | Fictional care-home name | Five homes |
| Department | Care, Nursing, Activities or Domestic | Four per home/month |
| Budgeted_Staff_FTE | Budgeted full-time equivalent staff | Snapshot; do not treat an annual sum as distinct staff |
| Actual_Staff_FTE | Actual full-time equivalent staff | Same snapshot convention |
| Vacancies | Synthetic integer vacancy count | May differ from FTE gap; average monthly counts are more useful than annual sums |
| Sickness_Days | Department-recorded sickness days | Additive recorded days |
| Overtime_Hours | Additional overtime hours | Additive |
| Overtime_Cost_GBP | Overtime expenditure in GBP | Additive |
| Agency_Hours | Agency cover hours | Additive |
| Agency_Cost_GBP | Agency expenditure in GBP | Additive |
| Total_Extra_Staff_Cost_GBP | Overtime cost + agency cost | Excludes ordinary salaries |
| Available_Beds | Home-level capacity | Repeated across departments: count once per home/month |
| Occupied_Beds | Home-level occupied beds | Repeated across departments: count once per home/month |
| Complaints | Department-recorded complaints | Unique-incident attribution is unspecified; not used as distinct complaints |

The derived `home_month.csv` contains 60 home/month groups. `Vacancy_Count` and `Extra_Cost_GBP` are department sums; bed values appear once per home/month. Power BI derives its HomeMonth identifier from the embedded source and does not depend on this CSV.
