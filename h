**The exact-label fix is working. This run shows four tests passed in 53.42 seconds.**

| Case | What I can confirm |
|---|---|
| Display label | Now uses **“Assessment ongoing”** and preserves `ONGOING`. |
| Permissions | Covers Admin-only access and name validation. |
| Refinement | Uses **“Assessment in progress”** and preserves the existing rules. |
| Clarification | Asks useful questions about the missing behavior. |

**One issue remains:** the Admin case invents a task to create a database migration for `initiative_templates.name`. Your supplied context never established that this column needs adding, yet **Task usefulness still scored 1.00**. The refinement also introduces an i18n requirement without supporting context.

**Next, check that the judge can reject a deliberately wrong answer.**

At the **very bottom** of `spec_evals/test_spec_quality.py`, after the clarification test, add:

```python
def test_judge_rejects_wrong_permission(judge):
    test_case = LLMTestCase(
        input=(
            "Only Admin may rename an initiative template. "
            "Initiative Owner and Initiative Assessor must be denied."
        ),
        expected_output=(
            "Admin can rename. Initiative Owner and Initiative "
            "Assessor cannot rename."
        ),
        actual_output=(
            "Acceptance criterion: Given an Initiative Owner, "
            "when they rename a template, then the new name is saved. "
            "Both Admin and Initiative Owner may rename templates."
        ),
    )

    metric = build_metric(
        name="Permission negative control",
        instructions=(
            "Compare actual_output with input and expected_output. "
            "Check every forbidden permission. "
            "Granting rename access to an explicitly denied role "
            "is a critical violation and must receive score 0."
        ),
        judge=judge,
        critical=True,
    )

    metric.measure(test_case)

    print(f"\nJudge score: {metric.score}")
    print(metric.reason)

    assert metric.score == 0.0, (
        "The judge accepted a deliberately incorrect permission."
    )
```

Run only this new test:

```bash
RUN_LLM_EVALS=1 \
EVAL_JUDGE_MODEL=mistral-small-2603 \
PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
python -m pytest spec_evals/test_spec_quality.py \
  -k judge_rejects_wrong_permission -v -s
```

**Expected: the test passes because the judge gives the bad answer `0.0`.** This starts checking the evaluator’s reliability before trusting its scores on more FLOWR tickets.
