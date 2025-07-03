import streamlit as st

def show():
    st.title("🧬 ER Diagram – RTO DBMS")

    st.markdown("""
    The following **Entity-Relationship Diagram (ERD)** visually represents the structure of the `RMS` database schema used in this RTO project.
    
    It highlights how the entities such as **Users**, **Vehicles**, **Licenses**, **Permits**, and **Employees** are interconnected through well-defined relationships and constraints.
    """)

    st.image("RTO ER Diagram.png", use_container_width=True)
    st.caption("⬆️ Entity-Relationship diagram of the RMS database schema (PostgreSQL)")

    st.subheader("🔍 Key Components")

    st.markdown("""
    - **Users**: Individuals who own vehicles, hold licenses, or apply for permits.
    - **Vehicles**: Each identified by a `Chassis_No`, linked to a user via the `RC_Book`.
    - **License / Permit / Carnet**: Legal documents linked to both `Users` and `Employees`.
    - **Employee / RTO / Department**: Government-side structure, with employees working in RTOs and issuing permits/licenses.
    - **Vehicle Type / License Type**: Enumerations supporting data integrity.
    """)

    st.subheader("🧠 Design Notes")

    st.markdown("""
    - Fully normalized to avoid redundancy (3NF)
    - Uses **foreign key constraints**, **check constraints**, and **triggers**
    - Schema: `RMS` (set via `SET search_path TO rms`)
    - Triggers auto-set expiry dates for License, Permit, Carnet, and RC Book entries
    - Each table uses **sensible primary keys**, data types, and formats (e.g. PAN, license ID patterns)
    """)

    st.markdown("For the full schema, see the GitHub repo or explore the tables.*")
