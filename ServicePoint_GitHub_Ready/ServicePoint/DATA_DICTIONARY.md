# Data dictionary and measure definitions

Grain: one case per row. 720 unique cases; 120 per month, May–October 2026. Dataset assumed observed through 7 November 2026 so every case has seven-day follow-up. Original CSV preserved; blank numeric fields become NULL in SQL and blank cells in Excel. No duplicates or deliberately corrupted records were introduced.

| Field | Definition |
|---|---|
| Case_ID | Unique case identifier; not a customer identifier. |
| Opened_Date | ISO case opening date. |
| Month | Opening month, YYYY-MM. |
| Channel | Phone, Email or Web chat. |
| Contact_Reason | Billing, Technical fault, Installation, Cancellation or Account update. |
| Team | Technical Support for technical faults; Customer Services otherwise. This mapping limits independent team comparisons. |
| Initial_Wait_Minutes | Initial queue wait for phone/chat. Email is NULL/blank; no email response-time data. |
| Initial_Handling_Minutes | Minutes spent on the first interaction only; not total effort across all contacts. |
| Resolution_Hours | Elapsed hours to initial resolution. Does not include later reopened activity. |
| Resolved_On_First_Contact | Initial resolution flag, Yes/No. A later repeat can still occur. |
| Repeat_Contacts_7_Days | Additional contacts for the same case during seven days after initial contact. |
| Complaint | Case complaint flag, Yes/No. |
| Escalated | Case escalation flag, Yes/No. |
| CSAT_Score | Integer 1–5. Blank means no survey response, not zero. |
| Source_Type | Synthetic for every record. |

## Measures
- Confirmed FCR = cases where initial resolution is Yes AND repeat count is zero / all cases.
- Repeat case rate = cases with repeat count > 0 / all cases.
- Complaint rate = cases where Complaint is Yes / all cases.
- Average resolution = sum of Resolution_Hours / cases.
- Average CSAT = sum of nonblank scores / number of responses.
- CSAT coverage = responses / all cases.
- Average live wait = sum of nonblank wait minutes / phone and chat cases with recorded waits.
- Total repeat contacts = sum of repeat counts. This is not the number of repeat cases.

## Interpretation
Data were generated for learning and contain designed relationships; they cannot establish real customer behaviour or causal effects. No customer ID, agent ID, staffing, revenue, cost, issue root cause or arrival timestamp exists. Do not claim retention effects, agent productivity, financial savings or measured process improvement. Six months and equal monthly volumes do not establish seasonality. CSAT non-response may bias comparisons; team and reason are confounded by the team mapping.
