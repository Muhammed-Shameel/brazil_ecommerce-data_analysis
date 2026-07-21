import os
import pandas as pd


from sqlalchemy import create_engine, text
from sqlalchemy.engine import URL

load_dotenv(override=True)
# -----------------------------
# 1. Load credentials
# -----------------------------

host = os.getenv("DB_HOST")
username = os.getenv("DB_USER")
password = os.getenv("DB_PASSWORD")

database = "brazil_ecommerce_db"

# -----------------------------
# -----------------------------
# 2. Connect to MySQL server
#    WITHOUT selecting a database
# -----------------------------

server_url = URL.create(
    drivername="mysql+pymysql",
    username=username,
    password=password,
    host=host,
    port=3306
)

server_engine = create_engine(server_url)

# -----------------------------
# 3. Create the database
# -----------------------------

with server_engine.connect() as connection:
    connection.execute(text(
        "CREATE DATABASE IF NOT EXISTS brazil_ecommerce_db"
    ))

    connection.commit()

print("Database is ready!")

# -----------------------------
# 4. Connect to the database
# -----------------------------

database_url = URL.create(
    drivername="mysql+pymysql",
    username=username,
    password=password,
    host=host,
    port=3306,
    database=database
)

engine = create_engine(database_url)

with engine.connect() as connection:
    print("SQLAlchemy connected successfully!")

# -----------------------------
# 5. Import CSV files
# -----------------------------

folder = r"C:\Users\Acer\Desktop\brazil-ecommerce\datasets"

for file in os.listdir(folder):

    if file.endswith(".csv"):

        table_name = (
            file
            .replace("olist_", "")
            .replace("_dataset", "")
            .replace(".csv", "")
        )

        file_path = os.path.join(folder, file)

        df = pd.read_csv(file_path)

        df.to_sql(
            table_name,
            engine,
            if_exists="replace",
            index=False
        )

        print(f"Imported {table_name}")
with engine.connect() as connection:
    result = connection.execute(
        text("SELECT * FROM customers LIMIT 5")
    )

    for row in result:
        print(row)
from sqlalchemy import text

tables = [
    "customers",
    "geolocation",
    "order_items",
    "order_payments",
    "order_reviews",
    "orders",
    "products",
    "sellers",
    "product_category_name_translation"
]
with engine.connect() as connection:
    for table in tables:

        print(f"\n{'=' * 50}")
        print(f"TABLE: {table}")
        print(f"{'=' * 50}")

        # First 5 rows
        result = connection.execute(
            text(f"SELECT * FROM `{table}` LIMIT 5")
        )

        print("\nFIRST 5 ROWS:")
        for row in result:
            print(row)

        # Table structure
        schema = connection.execute(
            text(f"DESCRIBE `{table}`")
        )

        print("\nSCHEMA:")
        for row in schema:
            print(row)
df.to_sql(
    table_name,
    engine,
    if_exists="replace",
    index=False
)
