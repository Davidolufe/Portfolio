# Process improvement maps

The current process is an assumed baseline for this fictional case study. The future process is a proposal, not an implemented change.

## AS-IS: assumed current process
```mermaid
flowchart TD
 A["Log customer issue"] --> B["Investigate issue"]
 B --> C{"Resolved?"}
 C -->|Yes| D["Close case"]
 C -->|No| E["Transfer to another queue"]
 E --> B
 D --> F{"Issue recurs?"}
 F -->|Yes| G["Customer contacts company again"]
 G --> A
 F -->|No| H["Case remains closed"]
```

## TO-BE: proposed future process
```mermaid
flowchart TD
 A["Log issue and check repeat history"] --> B["Use issue-specific checklist"]
 B --> C{"Resolved?"}
 C -->|Yes| D["Confirm understanding and send summary"]
 C -->|No| E["Assign owner and update date"]
 E --> F["Owner investigates and updates customer"]
 F --> C
 D --> G["Monitor seven-day repeat contact"]
 G --> H{"Customer returns?"}
 H -->|Yes| I["Review previous resolution with owner"]
 I --> B
 H -->|No| J["Record confirmed FCR when eligible"]
```

## Proposed requirements and acceptance criteria
1. An unresolved pilot case must have an owner and update date before transfer. Verify on sample cases.
2. A returning customer case must show related case history to the agent. Requires an operational customer/case linkage absent from this dataset.
3. A first-contact resolution qualifies as confirmed only after the seven-day follow-up period and zero repeats.
4. Reporting must exclude missing CSAT and email waits from those averages.
5. Filtered case counts and rate denominators must reconcile with exported cases.

Owner, update date and customer history fields require additional system design; they are not fabricated in the historical source.
