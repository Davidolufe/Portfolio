# CarePoint Power BI project

The report definitions are built: **2 pages, 31 visuals and text elements, 15 DAX measures**, an embedded import model and the original 240-row CSV.

This is a native **Power BI Project (.pbip)**, with PBIR report definitions and a TMSL model.bim semantic model. It is not a `.pbix` binary. The definitions passed static schema and reference checks. On 17 November 2026, David opened both pages in Power BI Desktop: the displayed KPIs matched the expected results and he confirmed the care-home slicer changed the values. Broader interaction testing and PBIX export remain outstanding.

## Open on your Windows computer

1. Download this repository using GitHub’s **Code → Download ZIP**, then choose **Extract All**. Open the `CarePoint/powerbi` folder and keep its contents together.
2. Open `CarePoint.pbip` with an up-to-date **Microsoft Power BI Desktop**. If your version asks for Power BI Project/PBIR preview features, enable the requested feature and restart Desktop.
3. Choose **Refresh** to populate the model. The source is embedded in the project: there are no local CSV path settings or website credentials to configure. A project without a cache can initially display empty visuals until refreshed.
4. Check the totals below. Then try the home, month and department slicers on each page and clear them again.
5. Save your working report. If Desktop offers **Save As → Power BI Desktop file (.pbix)**, you can save a PBIX copy for sharing and portfolio use.

Power BI Desktop is the application that opens this project. The optional Power BI plugin in ChatGPT is a separate integration and is not required to open the downloaded project. Do not rename the ZIP or `.pbip` extension to `.pbix`.

## Page 1 — Workforce overview

Home, month and department slicers; six KPI cards; overtime/agency costs by care home; monthly extra staffing cost; a home comparison table.

## Page 2 — Staffing investigation

Home, month and department slicers; dynamic correlation and observation-count cards; sickness and cover-hours cards; a scatter plot at home-month grain; department cost comparison; interpretation notes.

Slicers are independent between pages. Correlation recalculates for the current selection and returns blank if there are fewer than two points or no variance. HomeMonth is a hidden model column used to identify scatter points; it is not a separate table.

## Acceptance checks after opening

| Check, with all filters cleared | Expected |
|---|---:|
| Extra staffing cost | £233,751.00 |
| Overtime | £156,549.00 |
| Agency | £77,202.00 |
| Agency share | 33.0% |
| Average monthly vacancies, group | 7.33 |
| Occupancy | 87.9% |
| Scatter observations | 60 |
| Vacancy / cost correlation | −0.054 |
| Sickness days | 807 |
| Brookside selected: extra cost | £46,957.75 |
| December 2025 selected: extra cost | £22,797.40 |
| May 2026 selected: extra cost | £16,735.15 |

The scatter should show one data point per selected care home/month, with vacancies on X and extra cost on Y. Some points can overlap. Department selection changes the contribution from those departments; it does not create department-level capacity. Bed values are deduplicated at home-month grain.

Check that all five homes remain readable in the overview table, every card displays a complete label, the monthly line is ordered from Oct 2025 to Sep 2026, and selecting/clearing slicers updates the visuals. Adjust formatting in Desktop if your installed version lays out labels differently.

## What was verified here

- 39 native report/project JSON documents validated against Microsoft's published schemas.
- Every visual field reference resolves to a defined measure or column.
- All visual positions fit within their 1280 × 800 page canvases.
- Embedded CSV bytes match the original exactly; 240 rows and £233,751 extra cost reconcile to the completed project.
- The semantic model and report use relative references and an embedded data query.

Static checks do not verify DAX/Power Query execution, native rendering, slicer interactions or PBIX export. `Validation.json` records that boundary. `../assets/overview_design.jpg` is a separately rendered illustration of the intended layout using the verified source data, **not a screenshot from Power BI**.

## Editing and refresh

The embedded data is a fixed portfolio snapshot, not a live source. `Embedded_Query.m` and `CarePoint_Measures.dax` are readable copies of the definitions already installed in model.bim; you do not need to paste them to use the project. To load future data, replace the embedded import query with a managed CSV/data source in Power Query and revalidate definitions and totals.

## Interpretation and attribution

CarePoint is fictional and all source data is synthetic. Vacancy counts are repeated snapshots, not distinct jobs over a year or FTE shortfalls. No causal effects or real savings are claimed. David completed earlier spreadsheet learning exercises; this native Power BI project was developed with AI assistance.

## Format references

- https://learn.microsoft.com/en-us/power-bi/developer/projects/projects-overview
- https://learn.microsoft.com/en-us/power-bi/developer/projects/projects-dataset
- https://learn.microsoft.com/en-us/rest/api/fabric/articles/item-management/definitions/report-definition
