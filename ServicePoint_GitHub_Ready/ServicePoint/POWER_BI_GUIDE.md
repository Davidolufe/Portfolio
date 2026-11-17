# Power BI build guide

The completed browser dashboard runs without Power BI. A native PBIX file has not been created. These are implementation instructions and DAX for building a Power BI version in Power BI Desktop.

## Import and model
1. Get Data > Text/CSV > ServicePoint_Customer_Service_Data.csv > Transform Data.
2. Rename the query Cases. Set Opened_Date to Date; wait, handling and resolution to Decimal Number; repeat count and CSAT to Whole Number; remaining columns to Text. Preserve blanks as null.
3. Close & Apply. This is a single fact table at case grain. Do not enable an unnecessary relationship or join that duplicates cases.
4. Create the measures below using New measure. Keep Month sorted ascending. An optional dedicated calendar table can be added later for time intelligence; these measures do not require one.

```dax
Cases = COUNTROWS(Cases)

Confirmed FCR Cases =
CALCULATE(COUNTROWS(Cases), Cases[Resolved_On_First_Contact] = "Yes", Cases[Repeat_Contacts_7_Days] = 0)

Confirmed FCR Rate = DIVIDE([Confirmed FCR Cases], [Cases])

Repeat Cases = CALCULATE(COUNTROWS(Cases), Cases[Repeat_Contacts_7_Days] > 0)

Repeat Case Rate = DIVIDE([Repeat Cases], [Cases])

Complaint Cases = CALCULATE(COUNTROWS(Cases), Cases[Complaint] = "Yes")

Complaint Rate = DIVIDE([Complaint Cases], [Cases])

Avg Resolution Hours = AVERAGE(Cases[Resolution_Hours])

Avg CSAT = AVERAGE(Cases[CSAT_Score])

CSAT Responses = COUNT(Cases[CSAT_Score])

CSAT Response Rate = DIVIDE([CSAT Responses], [Cases])

Avg Live Wait Minutes = AVERAGE(Cases[Initial_Wait_Minutes])
```

Enter each measure separately. Format rates as 0.0%, averages as 0.00 and counts as whole numbers. AVERAGE ignores nulls; do not replace nulls with zero.

## Layout
- Slicers: Month, Channel, Contact_Reason.
- Cards: Cases, Confirmed FCR Rate, Repeat Case Rate, Complaint Rate, Avg Resolution Hours, Avg CSAT, CSAT Responses, Avg Live Wait Minutes.
- Bar: Contact_Reason and Cases, descending.
- Line: Month with Confirmed FCR Rate and Repeat Case Rate; show 0–100% axis.
- Matrix: Contact_Reason, case count, rates, resolution and CSAT.
- Detail table: Case_ID, Opened_Date, Channel, Contact_Reason and repeat count.
- Show a visible synthetic-data note and metric definitions.

## Reconciliation checklist
Unfiltered totals must show 720 cases, 49.7% confirmed FCR, 26.8% repeat case rate, 20.7% complaints, 22.52 resolution hours and 3.91 CSAT from 556 responses. Check slicers filter all analytical visuals. Test May + Phone against the browser dashboard. DAX has been supplied for implementation, not executed in Power BI Desktop.
