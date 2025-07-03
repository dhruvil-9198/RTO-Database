import streamlit as st
import pandas as pd
import uuid
from db import get_connection

EXAMPLE_QUERIES = {
    "Total License Holders": "SELECT COUNT(*) FROM license;",
    "Expired Licenses": "SELECT * FROM license WHERE CURRENT_DATE > expiry_date;",
    "Users with ≥2 Vehicles": "SELECT u.* FROM users u JOIN rc_book r ON u.id_proof = r.id_proof GROUP BY u.id_proof HAVING COUNT(*) >= 2;",
    "Total Vehicles per Type": "SELECT vehicle_type_id, COUNT(*) FROM vehicle GROUP BY vehicle_type_id;"
}

def show():
    st.title("🧪 Run Custom SQL")
    st.markdown("Write your own **read-only SQL** queries against the `rms` schema.")

    # Query presets
    with st.expander("📌 Example Queries"):
        choice = st.selectbox("Choose an example", list(EXAMPLE_QUERIES.keys()))
        if st.button("Load Example"):
            st.session_state["custom_query"] = EXAMPLE_QUERIES[choice]

    # Query input box
    query = st.text_area("Enter SQL Query", value=st.session_state.get("custom_query", ""), height=150)
    unique_key = f"run_query_button_{uuid.uuid4()}"

    if st.button("Run Query"):
        if not query.strip().lower().startswith("select"):
            st.error("❌ Only SELECT queries are allowed.")
            return
        try:
            conn = get_connection()
            full_query = "SET search_path TO rms; " + query
            df = pd.read_sql_query(full_query, conn)
            st.success(f"✅ Query executed. {len(df)} row(s) returned.")
            st.dataframe(df, use_container_width=True)

            # Optional CSV download
            csv = df.to_csv(index=False).encode("utf-8")
            st.download_button(
                label="⬇️ Download results as CSV",
                data=csv,
                file_name="custom_query_results.csv",
                mime="text/csv",
            )

        except Exception as e:
            st.error(f"❌ Error: {e}")
