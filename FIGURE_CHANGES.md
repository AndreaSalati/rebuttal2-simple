# Rebuttal figure changes: removing the grid method

## Context

- The rebuttal (branch `least-resistance` of this repo) no longer presents the "grid method" (called "vector" in some code) as an alternative estimator.
- The "subtraction method" (called "twin" in the code) is the only method.
- The grid survives in one place only: as a "check" on the real data in `FIGURE_VECTOR_REAL.pdf`.
- The captions in `figures.tex` are already rewritten for the target figures. Each figure to redo has a `% TODO least-resistance` comment above it. The figures must match these captions.

## General rules

- Keep the same file names in `rebuttal2/figures/`, so `figures.tex` does not change.
- Keep the colors as they are: the subtraction method is blue, the oracles purple/grey, the truth black.
- Do not put titles, panel results or numbers inside the figures beyond what is there now. Panel letters are fine.
- **Data:** the saved results are NOT on this Mac (`context_repo/review2/results/` is gitignored). They are on ssh host `beast`, in `/home/maxine/Documents/andrea/mega_scritmo/code/context_repo/review2/results/`. Copy them locally or run there. Do not rerun the simulations; only re-plot.
- **Code mapping:** in the result tables, model `twin` is the subtraction method, and `vector`/`grid` is the grid method.

## 1. `FIGURE_estimator_abs_error.pdf` (R2.1, label `fig:vector-vs-twin`)

**Script:** `context_repo/review2/nb/estimator_figure.py`
**Data:** `sim_deconv_hier15_rho0.25_shell1.csv` / `_shell2.csv`

- REMOVE panel A (the per-group log-scale boxplots). Keep only the current panel B, as a single panel with no panel letter.
- REMOVE the grid (orange) bars. Keep blue only:
  - light bars: mean absolute error of a single group (90 groups);
  - dark bars: the single value over 6 groups (15 replicates), using `pooled_filled_error_h`.
- Keep the two columns: low and high desynchrony, with the mean true spread in the column titles. Keep UMI per cell on the x axis.
- Remove any legend entry that mentions grid, vector, subtraction vs grid, or "both methods". The legend should only distinguish "single group" from "average of 6 groups".
- Check: the blue values must stay the same as now:

  | Spread | 3k | 10k | 30k |
  |---|---|---|---|
  | 2.5 h, single group | 0.51 | 0.21 | 0.14 |
  | 2.5 h, single value | 0.28 | 0.04 | 0.02 |
  | 1.0 h, single group | 0.68 | 0.32 | 0.14 |
  | 1.0 h, single value | 0.45 | 0.12 | 0.05 |

## 2. `FIGURE_VECTOR_REAL.pdf` (R2.1, label `fig:vector-real`)

**Script:** `context_repo/nb/_FIGURES_marimo/FIGURE_VECTOR_PANELS.py` (section E)

- REMOVE panel B (the distribution of the period obtained from the slopes, with the shaded mean ± sigma_T).
- Relabel the remaining panels A, B, C:
  - A = SABER-FISH sigma over time;
  - B = mouse;
  - C = Drosophila.
- Keep the orange (grid) series in all remaining panels. Here the grid is the "check" and must stay.
- Any legend label "grid method" / "vector" becomes "check" (the caption says "Orange: check of R2.1", "Hatched bars: check").

## 3. `FIGURE_ramp_fish_sigmaT.pdf` (R2.3c, label `fig:ramp_fish`)

**Script:** `context_repo/review2/nb/ramp_fish_sims.py`
**Data:** `sim_ramp_fish_shell1.csv`, `sim_ramp_fish_trend.csv`

- **Panels A and B** (sigma_bio over time, ramp and constant):
  - REMOVE the orange grid line.
  - Keep the black truth, the blue subtraction mean with its band (SD over replicates), the dashed purple fitted-model oracle and the dotted grey generating-model oracle.
- **Panels C and D** (sigma_T, ramp and constant):
  - REMOVE the grid column/marker.
  - Keep subtraction (blue), both oracles (open markers, purple and grey), the black truth bar, the replicate dots, and the mean ± SD markers.
- Check, sigma_T (subtraction): ramp 1.26 ± 0.17, constant 0.29 ± 0.14.
- Check, oracles: fitted-model 1.31 ± 0.21 / 0.32 ± 0.28; generating-model 1.46 ± 0.32 / 0.26 ± 0.22.
- Check, truth: 1.40 / 0.18.

## 4. `FIGURE_ramp_rnaseq.pdf` (R2.3c, label `fig:ramp_rnaseq`)

**Script:** `context_repo/review2/nb/ramp_rnaseq_sims.py`
**Data:** `sim_ramp_rnaseq_shell1.csv`, `_shell2.csv`, `_trend.csv`; design `twoday12`

- **Panel A** (estimates per time point, 4 profiles × 3 depths): REMOVE the grid lines and bands. Keep the black truth and the blue subtraction mean ± SD band (`bio_filled_h`).
- **Panel B** (single value per profile, including the zero control): REMOVE the grid markers and dots. Keep the blue markers (`pooled_signed_all_h`), the replicate dots and the black truth bar.
  - The subtraction single value can be negative, for example the zero control at 30k. Keep the y axis so negative values are visible.
- With one method left, the legend only needs truth vs estimate. If the colour still encodes the method, keep blue.
- Check (single value, zero control): 1.44 / 0.45 / −0.08 h at 3k / 10k / 30k.

## 5. Unchanged

- `FIGURE_replicates_pooled_simple.pdf` (R2.4) is already subtraction only.
- `FIGURE_flash_delay.pdf` (R2.5) has no grid.

## 6. Later, for the manuscript (do not do now unless asked)

The same retreat will apply to the paper's supplementary figures. These scripts will need the same treatment:

- `context_repo/review2/nb/manuscript_figures/S_FIGURE_ESTIMATORS.py` (Fig. S8, the whole figure compares the two methods).
- `context_repo/review2/nb/manuscript_figures/S_FIGURE_SIGMA_BIO_CHANGES.py` (Fig. S9, orange grid lines in A and C).

## After re-plotting

1. Copy the PDFs into `rebuttal2/figures/` under the same names.
2. Remove the four `% TODO least-resistance` comments in `figures.tex`.
3. Run `latexmk -pdf main.tex` in `rebuttal2/` and check that the captions match what each figure shows.
