import os
import matplotlib.pyplot as plt
from dotenv import load_dotenv
import mysql.connector
import pandas as pd
from matplotlib.ticker import FuncFormatter

load_dotenv(override=True)
host = os.getenv("DB_HOST")
username = os.getenv("DB_USER")
password = os.getenv("DB_PASSWORD")

database = "brazil_ecommerce_db"

db = mysql.connector.connect(
    host=os.getenv("DB_HOST"),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD"),
    database="brazil_ecommerce_db"
)
print("Connected successfully")
cursor = db.cursor()

query = """SELECT 
    c.customer_unique_id AS customers,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY customers
ORDER BY total_orders DESC
LIMIT 10;

            """

df = pd.read_sql(query, db)
df["Customer_Label"] = [f"Customer {i}" for i in range(1, len(df) + 1)]
X = df["Customer_Label"]
Y = df["total_orders"]
plt.figure(figsize=(14, 8))
plt.bar(X, Y)
plt.xlabel("Customer_Label")
plt.ylabel("total_orders")
plt.title("Top 10 customers by orders")
plt.xticks(rotation=45, ha="right")
"""plt.gca().yaxis.set_major_formatter(
    FuncFormatter(lambda x, _: f'{x/1_000_000:.1f}M')
)"""
plt.tight_layout()
plt.show()           