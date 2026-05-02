import pandas as pd
from sqlalchemy import create_engine

def get_engine(db="projects_db"):
    #Create and return a SQLAlchemy engine.
    return create_engine(f"postgresql+psycopg2://root:root@localhost:5432/{db}")


def clean_column_names(df):
    #Standardise column names: lowercase, underscores, stripped.
    df.columns = (
        df.columns
        .str.strip()
        .str.lower()
        .str.replace('-', '_', regex=False)
        .str.replace(' ', '_', regex=False)
    )
    return df