# Imports
import numpy
import pandas
from datetime import datetime

# Read our data to a dataframe
fp = "income.csv"
df = pandas.read_csv(fp)

# Drop rows and columns that are only nan
df.dropna(axis=1,how="all",inplace=True)
df.dropna(axis=0,how="all",inplace=True)

# Convert data to correct format and type
df["date"] = df["date"].apply(lambda x: datetime.strptime(x,"%d.%m.%Y"))
df["date"] = df["date"].apply(lambda x: x.strftime("%Y-%m-%d"))
df["category"] = df["category"].apply(lambda x: x.lower())
df["amount"] = df["amount"].apply(lambda x: x.replace("$","").replace("€","").strip())

# Save the cleaned csv to new file
df.to_csv("clean_income.csv")