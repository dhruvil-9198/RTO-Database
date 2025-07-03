import streamlit as st
from dotenv import load_dotenv
from pages import dashboard, tables, insights, queries, er_diagram

load_dotenv()

st.set_page_config(page_title="RTO DBMS Showcase", layout="wide")

st.markdown(
    """
    <style>
        [data-testid="stSidebar"] {
            display: none;
        }
        [data-testid="collapsedControl"] {
            display: none;
        }
    </style>
    """,
    unsafe_allow_html=True
)

st.title("🚦 RTO DBMS Showcase")
tabs = st.tabs(["Dashboard", "Explore Tables", "Insights", "Run Queries", "ER Diagram"])

with tabs[0]:
    dashboard.show()
with tabs[1]:
    tables.show()
with tabs[2]:
    insights.show()
with tabs[3]:
    queries.show()
with tabs[4]:
    er_diagram.show()
