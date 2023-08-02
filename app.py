import streamlit as st
from st_pages import Page, Section, add_page_title, show_pages

def main():
    show_pages(
        [
            Page("Welcome.py", "Toolbox", "🏠", in_section=False),
            Page("Instructions.py", "Instructions", " 📝", in_section=False),
            Section(name="Explore", icon="1️⃣"),
            Page("Upload1.py", "Upload data", "⬆️"),
            Page("Analysis1.py", "Statistical analysis", "📊"),
            Page("Eco1.py", "Ecological measures", "📖"),
            Page("Ai1.py", "AI predictions", "🌐"),
        ]
    )

    add_page_title()

if __name__ == '__main__':

    st.title("Welcome to the microbiome Analysis & AI Prediction toolbox ✨")
    st.write("""
    This website is designed to **facilitate** the data analysis of microbiome datasets. Specifically, the website is designed to compare two groups of microbiome datasets (e.g., case vs control, positive vs negative etc) that are identified through the metadata.
    """)
    st.write("""
    It provides basic exploratory analysis and statistical tests tools. The website also provides various pre-processing tools and Artificial Intelligence (AI) models, including SVM, Logistic Regression, KNN, and XGBoost, to help discover potential patterns and insights in your data.
    """)

    st.image('./ims/glimpse.png')

    main()