**The integration works: four tests passed in about 46 seconds. There is a false positive in the first test, though.**

| Case | What the screenshots show | Assessment |
|---|---|---|
| Display label | Expected **“Assessment ongoing”**, generated **“Assessment”** | **Should fail.** The judge missed the mismatch. |
| Admin permission | Covers Admin access, denied roles, blank names and preserved links | Functional coverage looks good; task file paths remain unverified. |
| Refinement | Uses **“Assessment in progress”** and preserves `ONGOING` | Looks consistent with the request. |
| Clarification | Asks which validation fails and what behavior is expected | Clarification check passed. |

**My initial checks were too permissive for exact labels. Add this correction.**

**1. In `spec_evals/test_spec_quality.py`, add this import:**

```python
import re
```

**2. Inside the first generation case’s existing `"expected"` dictionary, add:**

```python
"required_literals": ["Assessment ongoing"],
```

Inside the refinement test’s `expected={...}` dictionary, add:

```python
"required_literals": ["Assessment in progress"],
```

**3. In `assess()`, immediately after the existing `checks = {...}` block, add:**

```python
then_text = "\n".join(
    criterion.then
    for criterion in spec.acceptance_criteria
)

for literal in expected.get("required_literals", []):
    check_name = f"required_literal_present:{literal}"

    checks[check_name] = (
        re.search(
            r"(?<!\w)" + re.escape(literal) + r"(?!\w)",
            then_text,
        )
        is not None
    )

    status = "PASS" if checks[check_name] else "FAIL"
    print(f"{status} — required exact value: {literal!r}")
```

Your existing failure collection will automatically pick up this check. **An output containing only “Assessment” will now fail**, regardless of the judge’s score.

**4. In `build_metric()`, replace the instruction starting with `"Evaluate semantic behavior, not identical wording"` with:**

```python
(
    "Allow different explanatory wording. "
    "Required literal UI labels and identifiers must retain their exact values "
    "from input and expected_output. "
    "Do not accept a shortened or changed label as equivalent. "
    "Explain specific omissions or contradictions in actual_output."
),
```

Rerun the same command. This catches the observed missing label; the judge still needs to check that the label is used correctly and consistently.
