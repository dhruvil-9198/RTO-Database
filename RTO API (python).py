import psycopg2 as psql
import os

con = psql.connect(host="localhost", port=5432, dbname=os.getenv("dbname"), user=os.getenv("username"), password=os.getenv("password"))
print("Connection Successful")

cur = con.cursor()

cur.execute("SET Search_Path to RMS")

#Show details of users with atleast two vehicles
cur.execute("SELECT u.* FROM Users AS u JOIN RC_Book AS r ON u.ID_Proof = r.ID_Proof GROUP BY u.ID_Proof HAVING COUNT(u.ID_proof)>=2;")
op = cur.fetchall()
print(op)
