import streamlit as st
import pandas as pd
from db import get_connection

def get_kpi(query):
    try:
        conn = get_connection()
        df = pd.read_sql_query("SET search_path TO rms; " + query, conn)
        return df.iloc[0, 0]
    except:
        return "N/A"

def show():
    st.title("📊 RTO DBMS Project – Dashboard")

    st.markdown("""
    This project simulates the operations of a **Regional Transport Office (RTO)** using a PostgreSQL relational database.
    
    It models real-world entities such as:
    - Vehicle ownership and registration
    - License issuance and validation
    - Carnet, permit, and insurance tracking
    - RTO branches, employees, departments

    Built as part of a university DBMS course, this Streamlit app showcases the schema, insights, and queries with a clean UI for recruiters and reviewers.
    """)

    st.divider()
    st.subheader("📈 Key Statistics (Live)")
    col1, col2, col3 = st.columns(3)
    col4, col5, col6 = st.columns(3)

    col1.metric("Total Users", get_kpi("SELECT COUNT(*) FROM users"))
    col2.metric("Total Vehicles", get_kpi("SELECT COUNT(*) FROM vehicle"))
    col3.metric("Active Vehicles", get_kpi("SELECT COUNT(*) FROM rc_book WHERE CURRENT_DATE < expiry_date"))
    col4.metric("Total Licenses", get_kpi("SELECT COUNT(*) FROM license"))
    col5.metric("Expired Licenses", get_kpi("SELECT COUNT(*) FROM license WHERE CURRENT_DATE > expiry_date"))
    col6.metric("Total RTO Branches", get_kpi("SELECT COUNT(*) FROM rto"))

    st.divider()
    st.subheader("🧠 Project Goals")
    st.markdown("""
    - Apply advanced **relational schema design** with constraints, triggers, and procedures
    - Build a **normalized, scalable DBMS** around real-world government operations
    - Enable **SQL-based reporting** for insights, audits, and management
    - Present with an **interactive, recruiter-friendly UI**
    """)

    st.divider()
    st.subheader("🛠️ Tech Stack")
    st.markdown("""
    - **Database:** PostgreSQL (with schema `rms`)
    - **Frontend:** Streamlit
    - **Language:** Python
    - **Deployment:** Ready for Streamlit Cloud / localhost
    """)

    st.markdown("🔗 [View GitHub Repository](https://github.com/dhruvil-9198/RTO-Database)")
