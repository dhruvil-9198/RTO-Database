import streamlit as st
import pandas as pd
from db import get_connection

# Define categorized insights
CATEGORIES = {
    "License Analytics": {
        "Total License Holders": "SELECT COUNT(*) AS total FROM license;",
        "Expired Licenses": "SELECT * FROM license WHERE CURRENT_DATE > expiry_date;",
        "License Holders by State": "SELECT state, COUNT(*) FROM users u JOIN license l ON u.id_proof = l.id_proof GROUP BY state;",
        "International Licenses per Branch": "SELECT SUBSTRING(license_id, 1, 4) AS branch, COUNT(*) FROM license WHERE license_type_id = 'IL' GROUP BY branch;"
    },
    "Vehicle Insights": {
        "Total Active Vehicles": "SELECT COUNT(*) FROM rc_book WHERE CURRENT_DATE < expiry_date;",
        "Users with 2+ Vehicles": "SELECT u.* FROM users u JOIN rc_book r ON u.id_proof = r.id_proof GROUP BY u.id_proof HAVING COUNT(*) >= 2;",
        "Users with No Vehicles": "SELECT * FROM users WHERE id_proof NOT IN (SELECT id_proof FROM rc_book);",
        "Vehicles by Type": "SELECT vehicle_type_id, COUNT(*) FROM vehicle GROUP BY vehicle_type_id;"
    },
    "RTO & Employee Stats": {
        "Employees per Branch": "SELECT branch_id, COUNT(*) FROM employee GROUP BY branch_id;",
        "RTOs with < 3 Employees": "SELECT r.* FROM rto r JOIN employee e ON r.branch_id = e.branch_id GROUP BY r.branch_id HAVING COUNT(*) < 3;",
        "Employees with >1 License Issued": "SELECT e.* FROM employee e JOIN license l ON e.employee_id = l.eid GROUP BY e.employee_id HAVING COUNT(*) > 1;"
    },
    "Permit & Carnet Data": {
        "Carnet Holders per State": "SELECT SUBSTRING(r.registration_no, 1, 2) AS state_code, COUNT(*) FROM carnet c JOIN rc_book r ON c.chassis_no = r.chassis_no GROUP BY SUBSTRING(r.registration_no, 1, 2);",
        "Permits by Branch": "SELECT u.branch_id, COUNT(*) FROM permit p JOIN users u ON p.id_proof = u.id_proof GROUP BY u.branch_id;"
    }
}

def show():
    st.title("📈 Insights & Analytics")
    st.markdown("Explore predefined SQL queries grouped by category. Results load live from the RMS database.")

    # Select category
    category = st.selectbox("Choose a category", list(CATEGORIES.keys()))
    query_map = CATEGORIES[category]

    # Select query
    query_label = st.selectbox("Choose a query", list(query_map.keys()))
    sql = query_map[query_label]

    # Execute and display
    if st.button("Run Query", key="run_query_button"):
        try:
            conn = get_connection()
            df = pd.read_sql_query("SET search_path TO rms; " + sql, conn)
            st.success(f"✅ Query returned {len(df)} row(s)")
            st.dataframe(df, use_container_width=True)

            # Download button
            csv = df.to_csv(index=False).encode("utf-8")
            st.download_button("⬇️ Download as CSV", csv, f"{query_label.replace(' ', '_')}.csv", mime="text/csv")

        except Exception as e:
            st.error(f"❌ Error: {e}")
