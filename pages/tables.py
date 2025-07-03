import streamlit as st
import pandas as pd
from db import get_connection

TABLE_LIST = [
    "rto", "vehicle_type", "department", "employee", "users", "license_type",
    "license", "permit", "vehicle", "lv_association", "rc_book", "carnet", "insurance"
]

def show():
    st.title("📂 Explore Tables")
    st.markdown("Interactively browse all tables in the RTO database (schema: `rms`).")

    selected_table = st.selectbox("Select a table to view:", TABLE_LIST)

    search_term = st.text_input("Search (by text match in any column, case-insensitive):")

    try:
        conn = get_connection()
        query = f"SET search_path TO rms; SELECT * FROM {selected_table};"
        df = pd.read_sql_query(query, conn)

        if not df.empty and search_term:
            df = df[df.apply(lambda row: row.astype(str).str.contains(search_term, case=False).any(), axis=1)]

        st.write(f"Showing **{len(df)}** record(s) from **{selected_table}**")
        st.dataframe(df, use_container_width=True)

        csv = df.to_csv(index=False).encode("utf-8")
        st.download_button(
            label="⬇️ Download as CSV",
            data=csv,
            file_name=f"{selected_table}.csv",
            mime="text/csv",
        )

    except Exception as e:
        st.error(f"❌ Error loading table: {e}")
