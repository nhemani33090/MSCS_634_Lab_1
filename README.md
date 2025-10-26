# MSCS_634_Lab_1 – Data Visualization, Data Preprocessing, and Statistical Analysis

**Name:** Nadeem Hemani  
**Course:** MSCS-634 – Advanced Big Data and Data Mining  
**Assignment:** Lab 1 – Data Visualization, Data Preprocessing, and Statistical Analysiss  
**Dataset:** [Sample Sales Data – Kaggle](https://www.kaggle.com/datasets/kyanyoga/sample-sales-data)

---

## Purpose
This lab demonstrates how to collect, visualize, preprocess, and analyze real-world data using Python and Jupyter Notebook. The selected dataset, *Sample Sales Data* from Kaggle, contains information about customer orders, sales, pricing, and product categories. The goal is to explore the data through meaningful visualizations, handle missing values and outliers, apply data reduction and scaling, and perform statistical analysis to uncover patterns and relationships among variables.

---

## Data Visualization
Several visualization techniques were applied to explore patterns within the sales data:

- **Scatter Plot:** Displayed the relationship between `PRICEEACH` and `SALES`, showing a clear positive correlation—higher prices often correspond to higher sales for premium products.  
- **Line Plot:** Illustrated total `SALES` trends over time, highlighting sales peaks in mid-year periods.  
- **Histogram:** Revealed that most sales values fall within the lower-to-mid range, with a right-skewed distribution indicating a few large orders.  
- **Box Plot:** Compared `SALES` across `PRODUCTLINE`, identifying which product lines drive higher revenue and detecting potential outliers.  
- **Pie Chart:** Showed proportions of different `DEALSIZE` categories (Small, Medium, Large), offering insight into overall order size distribution.

All visualizations were generated using Matplotlib and automatically saved to the `/screenshots/` directory.

---

## Data Preprocessing
A comprehensive preprocessing workflow was applied to ensure data quality and consistency:

1. **Handling Missing Values:**  
   - Missing entries in fields like `STATE`, `POSTALCODE`, and `TERRITORY`were handled by removing rows with null values to maintain data consistency.  
   - After cleaning, all columns contained zero missing values.

2. **Outlier Detection and Removal:**  
   - Outliers in `SALES` were detected using the Interquartile Range (IQR) method.  
   - 81 high-value outliers were identified and removed, reducing skewness and improving statistical accuracy.

3. **Data Reduction:**  
   - A 60% random sample was taken to reduce data volume for faster analysis.  
   - Less relevant columns like `ADDRESSLINE2` and `PHONE` were dropped to simplify the dataset.

4. **Data Scaling and Discretization:**  
   - Applied **Min–Max Scaling** to normalize numeric features (`SALES`, `PRICEEACH`, `QUANTITYORDERED`, `MSRP`) between 0 and 1.  
   - The `SALES` column was discretized into three categories — **Low**, **Medium**, and **High** — to support categorical analysis.

---

## Statistical Analysis
Comprehensive statistical analysis was performed on the cleaned and scaled dataset:

- **General Overview:** `.info()` and `.describe()` confirmed all columns are properly typed and summarized distribution metrics.  
- **Central Tendency:** Calculated mean, median, and mode of `SALES`, showing balanced spread after scaling.  
- **Dispersion:** Range, IQR, variance, and standard deviation were computed (IQR ≈ 0.29; Std. Dev ≈ 0.21), confirming moderate data variability.  
- **Correlation Analysis:**  
  - `PRICEEACH` and `SALES` exhibited a strong positive correlation (≈ 0.69).  
  - `QUANTITYORDERED` also correlated positively with `SALES` (≈ 0.51).  
  - These findings align with real-world business logic where both price and quantity influence total revenue.

All results, including correlation matrices, were visualized and exported as screenshots.

---

## Key Insights
- Higher product prices and quantities lead to higher total sales, confirming expected business behavior.  
- Some product lines significantly outperform others, suggesting potential focus areas for marketing or inventory optimization.  
- After data cleaning, the dataset was fully consistent, with 1,645 valid entries and no missing or anomalous values.  
- The normalized and categorized data provides a solid foundation for future predictive modeling or deeper business analysis.

---

## Challenges and Decisions
- The Kaggle dataset used **Windows-1252 encoding**, which initially caused decoding errors. This was resolved by implementing a robust multi-encoding loader (UTF-8 → CP1252 → Latin-1).  
- Outlier handling required careful balancing to remove anomalies without distorting legitimate high-value sales.  
- Discretizing continuous sales values was chosen to better visualize and compare order sizes across categories.

---

## Repository Structure
```
MSCS_634_Lab_1/
│
├── Lab1_Kaggle_Sales_Data.ipynb          # Jupyter Notebook (main analysis)
├── sales_data_sample.csv                 # Kaggle dataset (downloaded manually)
├── screenshots/                          # Auto-generated visualizations
├── README.md                             # Lab summary and documentation
├── requirements.txt                      # Required Python packages
└── run_jupyter.sh                        # Helper script to start Jupyter
```

---

## 🚀 How to Run

You can run the notebook either using the provided helper script (**recommended**) or by running the Jupyter command manually.

### **Option A – Using the Helper Script (Recommended on WSL/Linux)**
```bash
# (optional) create and activate a virtual environment
python3 -m venv venv
source venv/bin/activate

# install dependencies
pip install -r requirements.txt

# start Jupyter (binds to all interfaces so it opens correctly on WSL)
bash run_jupyter.sh
```
> This script runs:  
> `jupyter notebook --no-browser --ip=0.0.0.0 --port=8888`

Once started, open the link printed in the terminal (it includes your **token**)  
or go to [http://localhost:8888](http://localhost:8888) and paste the token when prompted.

---

### **Option B – Run the Command Directly**
```bash
# inside your project folder (venv activated)
pip install -r requirements.txt
jupyter notebook --no-browser --ip=0.0.0.0 --port=8888
```

---

### **Optional – Set a Permanent Password**
If you prefer logging in with a password instead of a token:
```bash
jupyter server password
# or: jupyter notebook password
```
Restart Jupyter afterward, and log in with your new password.

---

### **Troubleshooting Tips**
- If the kernel doesn’t start, choose **Kernel → Restart** in Jupyter or reopen the notebook.  
- If port 8888 is busy:  
  ```bash
  jupyter notebook --no-browser --ip=0.0.0.0 --port=8890
  ```
- If you get `Permission denied` when running the script:  
  ```bash
  chmod +x run_jupyter.sh
  ```

## Conclusion
This lab successfully demonstrates the end-to-end process of preparing and analyzing real-world sales data. From visualization and cleaning to statistical analysis and correlation study, every step follows best practices in data analytics. The findings align with expected business relationships and validate the dataset’s integrity, making it a strong foundation for further exploration or modeling.

---