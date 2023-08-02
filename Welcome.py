from st_pages import add_page_title

import streamlit as st
import pandas as pd
from streamlit_tags import st_tags

add_page_title()
#st.title("Welcome to the microbiome Analysis & AI Prediction toolbox ✨")
st.write("""
This website is designed to **facilitate** the data analysis of microbiome datasets. Specifically, the website is designed to compare two groups of microbiome datasets (e.g., case vs control, positive vs negative etc) that are identified through the metadata.
""")
st.write("""
It provides basic exploratory analysis and statistical tests tools. The website also provides various pre-processing tools and Artificial Intelligence (AI) models, including SVM, Logistic Regression, KNN, and XGBoost, to help discover potential patterns and insights in your data.
""")

st.write('Here is a preview of the website once the data has been uploaded: ')
st.image('./ims/glimpse.png')