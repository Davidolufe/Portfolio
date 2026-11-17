# ServicePoint: Customer Experience and Contact Centre Performance

**Excel · SQL · Interactive dashboard · Business analysis | David Akinyemi**

Which customer issues drive repeat contact, and where should a service team investigate first?

ServicePoint is a portfolio case study using **720 synthetic broadband customer-service cases from May–October 2026**. It connects customer-service reporting with proposed process improvements, using case volume, resolution time, repeat contact, complaints and satisfaction.

## Key results

| Measure | Result |
|---|---:|
| Cases analysed | 720 |
| Confirmed first-contact resolution | 49.7% |
| Cases with repeat contact within seven days | 26.8% |
| Complaint rate | 20.7% |
| Average initial resolution time | 22.52 hours |
| Average satisfaction score | 3.91 / 5 |
| Survey response coverage | 556 responses — 77.2% |
| Average phone/chat queue wait | 8.28 minutes |

Billing and technical faults account for **419 cases (58.2%)** and have repeat-case rates of **38.1%** and **36.8%** respectively. These are priorities for investigation. The dataset does not establish why those issues recur or prove an intervention would improve performance.

## Explore the project

| Component | Files | Purpose |
|---|---|---|
| Interactive dashboard | [OPEN_DASHBOARD.html](OPEN_DASHBOARD.html) | Offline overview with month, channel and contact-reason filters, reset and case export |
| Excel analysis | [ServicePoint_Analysis.xlsx](ServicePoint_Analysis.xlsx) | Formula-driven analysis, editable charts and source cases |
| SQL | [Setup](SQL_SETUP.sql) · [Analysis queries](SQL_ANALYSIS.sql) · [Verified results](SQL_RESULTS.json) | Eight queries covering quality, KPIs, reasons, months, channels and repeat contacts |
| Data | [Original CSV](ServicePoint_Customer_Service_Data.csv) · [Dictionary](DATA_DICTIONARY.md) | Source fields, units and measure definitions |
| Management report | [Findings and recommendations](MANAGEMENT_REPORT.md) | Priorities, evidence gaps and a proposed pilot evaluation |
| Business analysis | [AS-IS / TO-BE process maps](PROCESS_MAPS.md) | Assumed current process, proposed future process and acceptance criteria |
| Power BI preparation | [Import guide and DAX](POWER_BI_GUIDE.md) | Instructions for a future native report; no PBIX or PBIP is included |
| Learning | [Two-day learning guide](TWO_DAY_LEARNING_GUIDE.md) · [Portfolio description](PORTFOLIO_WRITEUP.md) | Reproduction exercises and interview preparation |
| Validation | [Checks and limitations](VALIDATION.md) | What has been verified and what still requires native application checks |

## Open the dashboard

GitHub displays HTML source rather than running this dashboard directly.

1. At the repository’s top level, choose **Code → Download ZIP** and extract it on your laptop.
2. Find the **ServicePoint** folder and double-click **OPEN_DASHBOARD.html**.
3. Use the Month, Channel and Contact reason controls, then choose **Reset filters** to return to all 720 cases.
4. Open **ServicePoint_Analysis.xlsx** separately to inspect the spreadsheet analysis.

The HTML embeds its own data and runs offline without a server, login or external dependencies. Editing the CSV or workbook does not automatically refresh that embedded snapshot. Findings and process proposals describe the full dataset and are labelled accordingly.

## Reproduce the SQL

Run **SQL_SETUP.sql** in a new SQLite database, then run each statement in **SQL_ANALYSIS.sql**. Compare the output with **SQL_RESULTS.json**. For MySQL 8/phpMyAdmin, use a practice database and import the setup script before running the analysis queries.

Setup creates `servicepoint_cases` and inserts 720 rows. It does not drop an existing table; a second import will fail rather than overwrite records. All eight analysis queries were re-executed against SQLite while preparing this GitHub package and matched the saved outputs.

## Analytical decisions

- **Case grain:** one row represents a case, not necessarily a single call or a distinct customer.
- **Confirmed FCR:** initial resolution must be Yes **and** seven-day repeat contact must be zero. The dataset assumes follow-up through 7 November 2026.
- **Repeat contacts:** the number of affected cases differs from the total number of additional interactions.
- **Missing values:** blank satisfaction scores are non-responses; email queue waits are unavailable. Neither becomes zero in the averages.
- **Survey coverage:** report response rates alongside satisfaction scores to expose missing feedback.

## Proposed management actions

1. Pilot clearer billing explanations and written summaries.
2. Pilot a technical diagnostic checklist and named ownership of unresolved cases.
3. Collect arrival timestamps, queue capacity and staffing data to investigate longer waits.
4. Compare four baseline weeks with four pilot weeks using consistent definitions and similar issue mixes.

The process maps are proposed designs for a fictional organisation. No real stakeholder interviews, implemented changes, financial savings or retention effects are claimed.

## Status and limitations

The package contains a completed offline dashboard and Excel/SQL analysis, plus a guide for building a Power BI version. SQL has been executed in SQLite, and spreadsheet calculations were reconciled during original creation. Dashboard logic was tested across 168 filter combinations with a DOM stub; actual browser rendering and download behaviour remain to be checked on a laptop. Native Excel/Google Sheets import, MySQL execution and Power BI DAX have not been verified in those applications.

All records and designed patterns are synthetic. Team assignment is tied to contact reason, limiting independent team comparisons. The source has no customer identifiers, agent identifiers, staffing, revenue or direct root-cause evidence. Findings cannot establish real customer behaviour, seasonality or causal effects.

## Contribution

This is an AI-assisted portfolio project prepared for David Akinyemi’s guided study. It supports practical learning in reporting, data quality, customer-service analysis and process improvement. The included learning guide asks David to reproduce the checks, formulas and SQL before claiming independent proficiency; the contribution statement can then be updated to describe the work he personally completed.
