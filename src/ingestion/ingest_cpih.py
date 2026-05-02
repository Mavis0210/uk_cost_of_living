# ingest_cpih.py
import pandas as pd
import os
from utils import get_engine, clean_column_names

PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

engine = get_engine()
df = pd.read_csv(os.path.join(PROJECT_ROOT, 'data', 'raw', 'cpih_inflation.csv'))
df = clean_column_names(df)
df.to_sql('raw_cpih', engine, schema='cost_of_living', if_exists='replace', index=False)
print(f"Loaded {len(df)} rows into raw_cpih")