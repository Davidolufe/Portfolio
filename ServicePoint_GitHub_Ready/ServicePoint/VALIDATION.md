# Validation record

Completed 17 November 2026.

- Preserved the original 720-row CSV. Verified unique case IDs, six months, month/date consistency and satisfaction-score bounds.
- Executed all eight SQL queries using SQLite; saved their results in SQL_RESULTS.json. Reconciled headline counts, confirmed FCR and survey coverage.
- Recalculated the Excel workbook and compared all eight headline measures with independently aggregated source data. Formula error search returned no matches.
- Changed a complaint flag temporarily and verified the complaint rate moved by exactly 1/720, then restored the source value and recalculated before export.
- Rendered and visually reviewed the Analysis and Cases worksheets. Confirmed two native editable charts in the exported workbook.
- Executed the dashboard JavaScript using a Node DOM stub. Compared all eight displayed measures across all 168 month/channel/reason combinations with a separate CSV aggregation. Verified reset and CSV export produced 720 cases plus the header.
- Browser launch was unavailable in the execution environment. Actual browser rendering, mobile layout, download behaviour and print layout have not been verified in a native browser. Open OPEN_DASHBOARD.html on your laptop for the final application check.
- The XLSX was not opened in native Excel or imported into Google Sheets. The SQL syntax was executed in SQLite, not MySQL/phpMyAdmin. DAX measures are supplied for implementation and were not executed in Power BI Desktop.

## Interpretation limits
Data and patterns are synthetic. All proposed processes, stakeholders and interventions are part of a fictional case study. Recommendations are not evidence of implemented improvements or realised financial benefits.
