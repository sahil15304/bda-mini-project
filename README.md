A lightweight Big Data Analytics mini-project implemented using **PySpark (in Google Colab)** and **R (in Posit Cloud)** — requiring **no local installations**.  
The project demonstrates batch analytics, streaming analytics, probabilistic data structures, and basic recommendations.

---

## ✅ Features

| Component | Technology | Description |
|----------|-------------|-------------|
| Batch Processing | PySpark | Selection, Projection, Union, Intersection, Co-occurrence |
| Streaming | PySpark Structured Streaming | Bloom Filter, Flajolet–Martin (FM), DGIM (sliding window) |
| Persistence | Local JSON/CSV | Used as a NoSQL-style file store (Mongo optional) |
| Visualization | R via Posit Cloud | DAU trend, Category Views vs Buys, Conversion Rate |
| Recommendation | Spark batch output | Item co-occurrence → top-k similar products |

---

## ✅ Folder Structure

```
bda-mini-project/
│
├── README.md
│
├── colab/
│   └── BDA_MiniProject_Colab.ipynb
│
├── data/
│   ├── product_agg.csv
│   ├── item_topk.csv
│   ├── product_agg.json
│   ├── item_topk.json
│   ├── r_dau.csv
│   └── r_cat_stats.csv
│
└── r/
    ├── BDA_R_Analytics.R
    └── plots/
        ├── plot_dau.png
        ├── plot_views_vs_buys.png
        └── plot_conversion_rate.png

---

## ✅ How to Run (Colab)

1. Open: `colab/BDA_MiniProject_Colab.ipynb` in Google Colab
2. Run cells sequentially:
   - Synthetic dataset generation
   - PySpark transformations (MapReduce-style ops)
   - Co-occurrence pair mining (recommendation preparation)
   - Local persistence (writes JSON/CSV to `/content/out`)
   - Streaming simulation (Bloom, FM, DGIM)
3. Export r_dau and r_cat_stats CSVs for R

---

## ✅ How to Run (R / Posit Cloud)

1. Open https://posit.cloud (RStudio in browser)
2. Upload:
   - `data/r_dau.csv`
   - `data/r_cat_stats.csv`
3. Open: `r/BDA_R_Analytics.R`
4. Run script → plots saved to `r/plots/`:
   - `plot_dau.png`
   - `plot_views_vs_buys.png`
   - `plot_conversion_rate.png`

---

## ✅ Outputs

| File | Description |
|------|-------------|
| product_agg.csv/json | Per-product aggregated metrics |
| item_topk.csv/json | Co-occurring item pairs (for recs) |
| plot_dau.png | Daily Active User trend |
| plot_views_vs_buys.png | Demand vs purchases |
| plot_conversion_rate.png | Efficiency by category |

---

## ✅ Streaming Demonstration (PySpark)

The streaming step prints approximate metrics per batch:
- `FM ≈ distinct users`
- `DGIM ≈ sliding-window buys`
- `newBF = number of newly-seen users in Bloom filter`

This demonstrates probabilistic structures used in large-scale real-time analytics.

---

## Notes

- Apache Spark is used in **local mode**
- File-based JSON/CSV is used as a **NoSQL prototype** (no DB dependency).
- R visualizations complete the analytics lifecycle end-to-end.



