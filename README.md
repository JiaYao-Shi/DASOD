# DASOD: Dual-Aspect Synergistic Outlier Detection

This repository contains the official MATLAB implementation of the paper: **"Dual-aspect synergistic outlier detection with structural deviation and attribute rarity"** (Published in *Pattern Recognition*, 2026).

## Overview
DASOD is a novel unsupervised outlier detection framework based on Formal Concept Analysis (FCA) and Granular Computing (GrC).It overcomes the limitations of traditional FCA-based methods by concurrently measuring conceptual structural deviation and statistical attribute rarity. The method utilizes a noise-robust core concept extraction strategy to emphasize dominant data patterns, thereby significantly reducing computational complexity while providing strong interpretability.

## Requirements
* MATLABR2024b
  
## Repository Structure

Based on the algorithm described in the paper, the codebase is structured as follows:

* **`breastcancer_ori.mat`**: The Wisconsin breast cancer dataset used for the interpretability case study in the paper.
* **`demo.m`**: The main entry script to run the DASOD algorithm on a sample dataset and evaluate its performance.
* **`DASOD.m`**: The core function integrating the dual-aspect synergistic outlier detection framework.
* **`datasets/`**: Folder containing benchmark datasets used in the experiments.
* **Data Preprocessing & Granular Concepts:**
    * **`equal_width.m`**: Performs equal-width discretization for numerical features.
    * **`create_formal_context.m`**: Transforms the dataset into a formal context.
    * **`f_1.m`, `f_2.m`, `f_g.m`**: Functions for generating object and attribute granular concepts ($\mathcal{L}_{og}$ and $\mathcal{L}_{ag}$).
    * **`extract_core_concepts.m`**: Extracts support-based core concepts ($\mathcal{L}_{c}$) to filter noise and reduce dimensionality.
* **Outlier Scoring Components:**
    * **`calculate_M.m`**: Computes the extent-based structural distinction degree ($M$).
    * **`compute_N.m`**: Computes the intent-based semantic distinction degree ($N$).
    * **`NGOF.m`**: Computes the Granular concept-based Outlier Degree (GOD) and Core Concept-based Outlier Factor (CCOF).
    * **`GPD_anomaly_detection.m`**: Calculates the Global Probability Deviation Factor (GPDF) using self-information for attribute rarity.
* **Evaluation:**
    * **`compute_auc.m`**: Computes the Area Under the ROC Curve (AUC) for performance evaluation.

## Usage
1. Clone this repository to your local machine.
2. Open MATLAB and navigate to the repository folder.
3. Run the `demo.m` script:
   ```matlab
   demo
