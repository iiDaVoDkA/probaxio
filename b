# Spec Generator pilot - TrackLab

**tarek-pilot-1.0 | 6 independent scenarios + 2 linked refinements = 8 observations**

Run the real POC manually. This is a new pilot, separate from the existing twenty-case kit. No results are supplied or assumed.

## Start here

1. Start a fresh draft for each base case P01-P06.
2. Paste the common context below into **Contexte projet (optional)**. Paste only the case request into **Ticket brut**, select its **Type de work item**, then click **Générer**.
3. Keep the untouched first specification and tasks before making any edits. Save errors and every retry; do not rerun to choose a better-looking answer.
4. Review against the checklist, which is for you and must not be pasted into the POC. Correct the draft only if necessary, and record the actual corrections.
5. Approve only when acceptable. For P01/P02, run the linked refinement on the same draft. If the base was acceptable and approved, observe whether refinement clears approval; otherwise record that check as not tested.
6. Save the first refined output too. After review, export the final Excel workbook for each case except P05. For P01/P02, the final workbook is the one after R1. Keep a base-approved workbook too if you already exported one.

If a base draft needed correction before R1, retain both its first output and corrected starting draft. A prescribed R1 is a planned test action, not a repair. Additional prompts fixing errors are repairs.

Share only fictional or otherwise permitted material. Keep employer-only content in the approved work environment.

## Common context - paste into Contexte projet

```text
TrackLab is a fictional application for managing initiatives and their tasks. This pilot is independent of FLOWR and uses invented rules and data. The interface uses React, the backend uses Python, and data is held in a relational database. No repository structure, table schema, API routes, package versions or implementation root cause is provided. Produce the specification and implementation tasks in English. Treat each base test as a separate change to this fictional application.
```

## Eight criteria - no 64-score form to fill

We can assess the six content criteria from the saved outputs. You only need to return the outputs and actual operational observations.

| # | Criterion | What we examine |
|---|---|---|
| 1 | Fidelity | Does the output preserve the requested scope? |
| 2 | Completeness | Are the supplied requirements covered? |
| 3 | Testable acceptance criteria | Can actions and expected outcomes be checked? |
| 4 | No invented information | Are unsupported rules and implementation claims avoided? |
| 5 | Preservation after refinement | Do unchanged constraints survive P01-R1/P02-R1? |
| 6 | Task-breakdown quality | Are tasks useful, proportionate and grounded? |
| 7 | Technical validity | Does the expected output appear; does the Excel file open when required? |
| 8 | Human intervention | What corrections and active review time were needed before approval? |

---

## P01 - Readable team information

**Type de work item: User Story**

### Ticket brut - copy only this block

```text
In TrackLab's initiative task list, display the assigned team's readable label when it is available. If a team is assigned but its readable label is unavailable, display the existing team code. If no team is assigned, display 'Unassigned'. This is a display-only change. Do not change assignment, permissions, status, stored data or exports. Fictional examples: team code TM-07 with label 'Research Team' displays 'Research Team'; team code TM-12 with no readable label displays 'TM-12'; no assigned team displays 'Unassigned'.
```

### Expected checklist - keep outside the POC

- Readable label is displayed when available: TM-07 becomes 'Research Team'.
- An assigned team without a readable label displays its existing code: TM-12.
- No assigned team displays exactly 'Unassigned'.
- Assignment, permissions, status, stored data and exports remain unchanged.
- Tasks focus on display/data preparation and relevant checks; no invented paths or schema changes.

### P01-R1 - prescribed refinement on the same draft

Save the base output first. Use the existing refinement action; do not start a fresh draft. If refinement is unavailable, record that outcome.

```text
Change only the fallback for an assigned team whose readable label is unavailable: display 'Team name unavailable' instead of the team code. Keep 'Unassigned' when no team is assigned. Keep every other requirement unchanged.
```

Expected after refinement:

- TM-12 now displays 'Team name unavailable'; this replaces only the missing-label fallback.
- The readable label still appears when available; no assigned team still displays 'Unassigned'.
- Assignment, permissions, status, stored data and exports still remain unchanged.

If the base was actually approved, record whether approval resets. Save the untouched refined output before repairs; export only after its review.

**Save:** first specification + tasks, any errors/retries and corrections; approval outcome; final .xlsx and whether it opens. Record active review/correction minutes only if measured.

---

## P02 - A default only for new initiatives

**Type de work item: User Story**

### Ticket brut - copy only this block

```text
TrackLab has an optional 'Risk reviewed' answer with three allowed values: Yes, No or blank. When a new initiative is created and this answer is omitted, default it to No. Preserve explicit answers, including Yes, No and a deliberately blank answer. Existing initiatives must retain their current answer. In particular, an existing blank answer must stay blank when the record is opened, edited, or saved after changing another field. Do not bulk-update existing records or make the answer mandatory.
```

### Expected checklist - keep outside the POC

- New initiative with the answer omitted receives No.
- Explicit Yes, No and deliberately blank answers are preserved.
- Existing blank remains blank on opening, editing and saving another field.
- Existing explicit answers remain unchanged; there is no bulk update or new mandatory field.
- The draft distinguishes omission from an explicitly supplied blank answer.

### P02-R1 - prescribed refinement on the same draft

Save the base output first. Use the existing refinement action; do not start a fresh draft. If refinement is unavailable, record that outcome.

```text
Change only the default for a new initiative when 'Risk reviewed' is omitted: use Yes instead of No. Keep every other requirement unchanged, including explicit answers, existing blanks, optionality and the absence of bulk updates.
```

Expected after refinement:

- Only the new-and-omitted default changes to Yes; no conflicting No default remains.
- Explicit Yes, No and deliberately blank answers remain unchanged.
- Existing blank/explicit answers, optionality and the no-bulk-update constraint are preserved.

If the base was actually approved, record whether approval resets. Save the untouched refined output before repairs; export only after its review.

**Save:** first specification + tasks, any errors/retries and corrections; approval outcome; final .xlsx and whether it opens. Record active review/correction minutes only if measured.

---

## P03 - Duplication preserves later edits

**Type de work item: Bug**

### Ticket brut - copy only this block

```text
In TrackLab, duplicating an initiative initially prefills title, category and owner from the selected source. The user then edits the title and owner. When asynchronously loaded reference options refresh, the user's edits are reset to the source values. Expected behaviour: prefill once for the selected source, preserve subsequent user edits across option refreshes, and resolve category/owner selections correctly when their reference options become available. Saving must create a distinct initiative and leave the source unchanged. The implementation root cause has not been established.
```

### Expected checklist - keep outside the POC

- The bug describes the observed reset and the expected preservation of user edits.
- Initial prefill and later editing are treated as different phases.
- Reference-option loading and category/owner selection resolution are covered.
- Saving creates a separate record and does not alter the source initiative.
- No unverified code-level root cause, file, hook, table or endpoint is asserted as fact.

**Save:** first specification + tasks, any errors/retries and corrections; approval outcome; final .xlsx and whether it opens. Record active review/correction minutes only if measured.

---

## P04 - Notify the selected assessor once

**Type de work item: Bug**

### Ticket brut - copy only this block

```text
In TrackLab, task creation sends notifications to the assigned team, but a selected individual primary assessor does not receive the expected notification. The selected primary assessor must receive exactly one notification, including when that person is also a member of the notified team. Preserve permissions, other recipients and other notification behaviour. The implementation root cause has not been established.
```

### Expected checklist - keep outside the POC

- A selected primary assessor outside the notified team receives exactly one notification; existing team recipients keep their notifications.
- When also in the notified team, the selected assessor still receives exactly one notification.
- Existing other recipients and permissions are preserved.
- Checks cover individual, team and overlapping-recipient situations.
- No invented SMTP failure, missing method, source file or confirmed root cause appears.

**Save:** first specification + tasks, any errors/retries and corrections; approval outcome; final .xlsx and whether it opens. Record active review/correction minutes only if measured.

---

## P05 - An export request with missing decisions

**Type de work item: User Story**

### Ticket brut - copy only this block

```text
Add an Export button for the initiative currently displayed in TrackLab. The export format, included fields and access rules have not yet been decided.
```

### Expected checklist - keep outside the POC

- Targeted questions identify the undecided format, included fields and access rules.
- Unknown decisions remain visible; the draft does not silently select a format, field set or authorised role.
- The requested scope remains the currently displayed initiative.
- A clarification-only response is acceptable; a detailed ticket is not required before these decisions are supplied.
- Do not approve or export this case until its open decisions have actually been answered.

**Case note:** Stop after saving the first response. Do not answer the open questions during this pilot. If the response is clarification only, acceptance-criteria and task-quality ratings are N/A. There is no approval or Excel-export requirement for P05.

**Save:** untouched first response (including clarification questions), any visible error and retry record. Do not answer questions, correct, approve or export P05 during this pilot.

---

## P06 - A precise CSV writer contract

**Type de work item: Task**

### Ticket brut - copy only this block

```text
Prepare implementation tasks for TrackLab's Python CSV writer. It must use a semicolon delimiter and CRLF row endings, preserve an empty final field, and correctly quote fields containing a semicolon, a double quote or a newline. For the sample row ['Alpha', 'B;C', ''], the required text is Alpha;"B;C"; followed by CRLF (carriage return U+000D then line feed U+000A). Do not change the source data. Repository structure and filenames are not provided.
```

### Expected checklist - keep outside the POC

- The tasks preserve the semicolon delimiter, CRLF ending and empty final field.
- The sample is Alpha;"B;C"; followed by CRLF; a final semicolon is retained.
- Checks cover embedded semicolons, double quotes and newlines, with correct quoting/escaping.
- Source data remains unchanged; no invented repository paths or filenames are treated as existing.
- The task breakdown is concrete and proportionate to the writer change and its verification.

Escaped notation for the expected row:

```text
Alpha;"B;C";\r\n
```

`\r\n` above denotes two control characters, not the four printable backslash/r/backslash/n characters.

**Case note:** This request concerns a fictional CSV feature in TrackLab. The Spec Generator itself should still produce its normal specification/tasks and final Excel workbook, not a CSV file for this pilot.

**Save:** first specification + tasks, any errors/retries and corrections; approval outcome; final .xlsx and whether it opens. Record active review/correction minutes only if measured.

---

## What to return

Use `Results_to_return.md`. For all eight observations, include the first specification/tasks as copied text or a permitted screenshot. Attach the final Excel workbooks for P01-R1, P02-R1, P03, P04 and P06 if produced. Include failed attempts and corrections. Do not estimate elapsed time after the fact.

If a result is unavailable, write Not run, Failed or Not measured as appropriate. A workbook ready for import is not evidence of a completed Azure DevOps import.
